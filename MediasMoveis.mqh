#include "ErrorHandling.mqh"
//#include "Utils.mqh"

//+------------------------------------------------------------------+  
// Inicio Variaveis Moveis  
//+------------------------------------------------------------------+

enum ENUM_TRADE_SIGNAL{
   SIGNAL_BUY=1,     //BUY
   SIGNAL_SELL=-1,   //SELL
   SIGNAL_NEUTRAL=0  //NEUTRAL
};

enum ENUM_ALERT_SIGNAL{

};

double BufferMASlow[];
double BufferMAFast[];

int BufferMASlowHandle,BufferMAFastHandle;

double Open[],Close[],High[],Low[];
datetime Time[];

datetime LastNotificationTime;
int Shift=0;
//+------------------------------------------------------------------+  
// Fim Variaveis Moveis  
//+------------------------------------------------------------------+


//+------------------------------------------------------------------+
//| Inicio Logica Media Moveis e seu cruzamento 6 x 21               |
//+------------------------------------------------------------------+ 
void OnInitInitialization(){
   LastNotificationTime=TimeCurrent();
   Shift=CandleToCheck;
}


bool OnInitPreChecksPass(){
   if(MASlowPeriod<=0 || MAFastPeriod<=0 || MAFastPeriod>MASlowPeriod){
      Print("Wrong input parameter");
      return false;
   }   
   if(Bars(Symbol(),PERIOD_CURRENT)<MASlowPeriod+MASlowShift){
      Print("Not Enough Historical Candles");
      return false;
   }   
   return true;
}


void CleanChart(){
   int Window=0;
   for(int i=ObjectsTotal(ChartID(),Window,-1)-1;i>=0;i--){
      if(StringFind(ObjectName(0,i),IndicatorName,0)>=0){
         ObjectDelete(0,ObjectName(0,i));
      }
   }
}


void InitialiseHandles(){
   BufferMAFastHandle=iMA(Symbol(),PERIOD_CURRENT,MAFastPeriod,MAFastShift,MAFastMethod,MAFastAppliedPrice);
   BufferMASlowHandle=iMA(Symbol(),PERIOD_CURRENT,MASlowPeriod,MASlowShift,MASlowMethod,MASlowAppliedPrice);
   ArrayResize(Open,BarsToScan);
   ArrayResize(High,BarsToScan);
   ArrayResize(Low,BarsToScan);
   ArrayResize(Close,BarsToScan);
   ArrayResize(Time,BarsToScan);
}

void InitialiseBuffers(){
   IndicatorSetInteger(INDICATOR_DIGITS,_Digits);
   ArraySetAsSeries(BufferMAFast,true);
   ArraySetAsSeries(BufferMASlow,true);
   SetIndexBuffer(0,BufferMAFast,INDICATOR_DATA);
   SetIndexBuffer(1,BufferMASlow,INDICATOR_DATA);
   PlotIndexSetInteger(0,PLOT_SHIFT,MAFastShift);
   PlotIndexSetInteger(1,PLOT_SHIFT,MASlowShift);
}


datetime NewCandleTime=TimeCurrent();
bool CheckIfNewCandle(){
   if(NewCandleTime==iTime(Symbol(),0,0)) return false;
   else{
      NewCandleTime=iTime(Symbol(),0,0);
      return true;
   }
}


//Check if it is a trade Signla 0 - Neutral, 1 - Buy, -1 - Sell
ENUM_TRADE_SIGNAL IsSignal(int i){
   int j=i+Shift;
   if(BufferMAFast[j+1+MAFastShift]<BufferMASlow[j+1+MASlowShift] && BufferMAFast[j+MAFastShift]>BufferMASlow[j+MASlowShift]) return SIGNAL_BUY;
   if(BufferMAFast[j+1+MAFastShift]>BufferMASlow[j+1+MASlowShift] && BufferMAFast[j+MAFastShift]<BufferMASlow[j+MASlowShift]) return SIGNAL_SELL;

   return SIGNAL_NEUTRAL;
}


datetime LastNotification=TimeCurrent()-WaitTimeNotify*60;

void NotifyHit(string OrientacaoNotificacao){
   int NotificacaoTopoFundo;
   if(!EnableNotify || TimeCurrent()<(LastNotification+WaitTimeNotify*60)) return;
   //if(!SendAlert && !SendApp && !SendEmail) return;
   if(!SendAlert) return;
   if(Time[0]==LastNotificationTime) return;
   ENUM_TRADE_SIGNAL Signal=IsSignal(0);
   if(Signal==SIGNAL_NEUTRAL) return;
   string EmailSubject=IndicatorName+" "+Symbol()+" Notification ";
//   string EmailBody="\r\n"+AccountCompany()+" - "+AccountName()+" - "+IntegerToString(AccountNumber())+"\r\n\r\n"+IndicatorName+" Notification for "+Symbol()+"\r\n\r\n";
   string AlertText=Symbol()+" Cruzou as linhas Moveis Sinal de ";
//   string AppText=AccountCompany()+" - "+AccountName()+" - "+IntegerToString(AccountNumber())+" - "+IndicatorName+" - "+Symbol()+" - ";
   //string Text="";
//   
   if(Signal!=SIGNAL_NEUTRAL){
      if(OrientacaoNotificacao == "COMPRA")
         {
            NotificacaoTopoFundo = SIGNAL_BUY;
         }
        else
         {
            NotificacaoTopoFundo = SIGNAL_SELL;
         }
      if(Signal==SIGNAL_BUY && Signal==NotificacaoTopoFundo)
         {     
            AlertText+="COMPRA";
         }
      else
        {
            AlertText+="VENDA";
        }
   }
//   
//   EmailBody+=Text+"\r\n\r\n";
   //AlertText+=Text+"\r\n";
//   AppText+=Text+"";
   if(SendAlert) Alert(AlertText);
//   if(SendEmail){
//      if(!SendMail(EmailSubject,EmailBody)) Print("Error sending email "+IntegerToString(GetLastError()));
//   }
//   if(SendApp){
//      if(!SendNotification(AppText)) Print("Error sending notification "+IntegerToString(GetLastError()));
//   }
   LastNotification=TimeCurrent();
   Print(Symbol()+"Cruzou as Linhas Moveis em: "+TimeToString(LastNotification));
}


void DrawArrows(){
   RemoveArrows();
   if(!EnableDrawArrows || BarsToScan==0) return;
   int MaxBars=Bars(Symbol(),PERIOD_CURRENT);
   if(MaxBars>BarsToScan) MaxBars=BarsToScan;
   for(int i=MaxBars-2;i>=1;i--){
      DrawArrow(i);
   }
}


void RemoveArrows(){
   int Window=-1;
   for(int i=ObjectsTotal(ChartID(),Window,-1)-1;i>=0;i--){
      if(StringFind(ObjectName(0,i),IndicatorName+"-SETAS-",0)>=0){
         ObjectDelete(0,ObjectName(0,i));
      }
   }
}

int SignalWidth=0;

void DrawArrow(int i){
   RemoveArrowCurr();
   if(!EnableDrawArrows){
      RemoveArrows();
      return;
   }
   ENUM_TRADE_SIGNAL Signal=IsSignal(i);
   if(Signal==SIGNAL_NEUTRAL) return;
   datetime ArrowDate=iTime(Symbol(),0,i);
   string ArrowName=IndicatorName+"-SETAS-"+IntegerToString(ArrowDate);
   double ArrowPrice=0;
   ENUM_OBJECT ArrowType=OBJ_ARROW;
   color ArrowColor=0;
   int ArrowAnchor=0;
   string ArrowDesc="";
   if(Signal==SIGNAL_BUY){
      ArrowPrice=Low[i];
      ArrowType = (ENUM_OBJECT)ArrowBuy;
      ArrowColor=clrGreen;  
      ArrowAnchor=ANCHOR_TOP;
      ArrowDesc="BUY";
   }
   if(Signal==SIGNAL_SELL){
      ArrowPrice=High[i];
      ArrowType = (ENUM_OBJECT)ArrowSell;
      ArrowColor=clrRed;
      ArrowAnchor=ANCHOR_BOTTOM;
      ArrowDesc="SELL";
   }
   ObjectCreate(0,ArrowName,OBJ_ARROW,0,ArrowDate,ArrowPrice);
   ObjectSetInteger(0,ArrowName,OBJPROP_COLOR,ArrowColor);
   ObjectSetInteger(0,ArrowName,OBJPROP_SELECTABLE,false);
   ObjectSetInteger(0,ArrowName,OBJPROP_HIDDEN,true);
   ObjectSetInteger(0,ArrowName,OBJPROP_ANCHOR,ArrowAnchor);
   ObjectSetInteger(0,ArrowName,OBJPROP_ARROWCODE,ArrowType);
   SignalWidth=ArrowSize;
   ObjectSetInteger(0,ArrowName,OBJPROP_WIDTH,SignalWidth);
   ObjectSetInteger(0,ArrowName,OBJPROP_STYLE,STYLE_SOLID);
   ObjectSetInteger(0,ArrowName,OBJPROP_BGCOLOR,ArrowColor);
   ObjectSetString(0,ArrowName,OBJPROP_TEXT,ArrowDesc);
   ObjectSetInteger(0,ArrowName,OBJPROP_BACK,true);
   datetime CurrTime=iTime(Symbol(),0,0);

}


void RemoveArrowCurr(){
   datetime ArrowDate=iTime(Symbol(),0,Shift);
   string ArrowName=IndicatorName+"-SETAS-"+IntegerToString(ArrowDate);
   ObjectDelete(0,ArrowName);
}

//+------------------------------------------------------------------+
//| Fim Logica Media Moveis e seu cruzamento 6 x 21               |
//+------------------------------------------------------------------+ 