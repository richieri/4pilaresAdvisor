//+------------------------------------------------------------------+
//| Linhas desenhadas no grafico                 |
//+------------------------------------------------------------------+ 

   ResetLastError();
   // Cores das linhas   
   ChartRedraw(0);      
   // Linha do Topo
   if(ObjectFind(0, "LinhaTopoHistorico")>=0) ObjectDelete(0, "LinhaTopoHistorico");
   ObjectCreate(0,"LinhaTopoHistorico",OBJ_HLINE,0,0,Topo);
   ObjectSetInteger(0,"LinhaTopoHistorico",OBJPROP_COLOR,clrDodgerBlue);         
   // Linha da Mediana
   if(ObjectFind(0, "LinhaMediana")>=0) ObjectDelete(0, "LinhaMediana");
   ObjectCreate(0,"LinhaMediana",OBJ_HLINE,0,0,Mediana);         
   ObjectSetInteger(0,"LinhaMediana",OBJPROP_COLOR,clrGold);
   ObjectSetInteger(0,"LinhaMediana",OBJPROP_STYLE,STYLE_DASH);
   ObjectSetInteger(0,"LinhaMediana",OBJPROP_WIDTH,2);
   // Linha do Fundo
   if(ObjectFind(0, "LinhaFundoHistorico")>=0) ObjectDelete(0, "LinhaFundoHistorico");
   ObjectCreate(0,"LinhaFundoHistorico",OBJ_HLINE,0,0,Fundo);         
   ObjectSetInteger(0,"LinhaFundoHistorico",OBJPROP_COLOR,clrSalmon);
   
   //Texto das linhas
   //Topo Historico Label
   if(ObjectFind(0, "TopoLabel")>=0) ObjectDelete(0, "TopoLabel");
   ObjectCreate(0,"TopoLabel",OBJ_TEXT,0,IntegerToString(Time.year+1) + "." + IntegerToString(Time.mon) + "." + IntegerToString(Time.day),Topo);
   ObjectSetString(0, "TopoLabel", OBJPROP_TEXT, "Topo");
   ObjectSetString(0,"TopoLabel",OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,"TopoLabel",OBJPROP_FONTSIZE,11);
   ObjectSetInteger(0,"TopoLabel",OBJPROP_COLOR,clrDodgerBlue);
   //Mediana Label
   if(ObjectFind(0, "MedianaLabel")>=0) ObjectDelete(0, "MedianaLabel");
   ObjectCreate(0,"MedianaLabel",OBJ_TEXT,0,IntegerToString(Time.year+1) + "." + IntegerToString(Time.mon) + "." + IntegerToString(Time.day),Mediana);
   ObjectSetString(0, "MedianaLabel", OBJPROP_TEXT, "Mediana");
   ObjectSetString(0,"MedianaLabel",OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,"MedianaLabel",OBJPROP_FONTSIZE,11);
   ObjectSetInteger(0,"MedianaLabel",OBJPROP_COLOR,clrGold);
   //Fundo Historico Label
   if(ObjectFind(0, "FundoLabel")>=0) ObjectDelete(0, "FundoLabel");
   ObjectCreate(0,"FundoLabel",OBJ_TEXT,0,IntegerToString(Time.year+1) + "." + IntegerToString(Time.mon) + "." + IntegerToString(Time.day),Fundo);
   ObjectSetString(0, "FundoLabel", OBJPROP_TEXT, "Fundo");
   ObjectSetString(0,"FundoLabel",OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,"FundoLabel",OBJPROP_FONTSIZE,11);
   ObjectSetInteger(0,"FundoLabel",OBJPROP_COLOR,clrSalmon);
   //Preco atual Label
   if(ObjectFind(0, "PrecoAtualLabel")>=0) ObjectDelete(0, "PrecoAtualLabel");
   ObjectCreate(0,"PrecoAtualLabel",OBJ_TEXT,0,IntegerToString(Time.year+1) + "." + IntegerToString(Time.mon) + "." + IntegerToString(Time.day),PrecoBid);
   ObjectSetString(0, "PrecoAtualLabel", OBJPROP_TEXT, "Preço Atual");
   ObjectSetString(0,"PrecoAtualLabel",OBJPROP_FONT,"Arial");
   ObjectSetInteger(0,"PrecoAtualLabel",OBJPROP_FONTSIZE,8);
   ObjectSetInteger(0,"PrecoAtualLabel",OBJPROP_COLOR,clrGray);   

   // Esconde apenas Label Preço atual
   if(!mostrarPrecoAtual)
     {
      ObjectSetString(0,"PrecoAtualLabel",OBJPROP_TEXT," ");   
     }
   // Esconde as Labels
   if(!titulo_TopoMedianaFundo)
     {
      ObjectSetString(0,"TopoLabel",OBJPROP_TEXT," ");
      ObjectSetString(0,"MedianaLabel",OBJPROP_TEXT," ");
      ObjectSetString(0,"FundoLabel",OBJPROP_TEXT," ");
      ObjectSetString(0,"PrecoAtualLabel",OBJPROP_TEXT," ");
     }      
      

//+------------------------------------------------------------------+
//| Quadros e Background do Display                 |
//+------------------------------------------------------------------+ 
int LarguraBackgroud = 145;
int LarguraMolduraTraz = 139;
int LarguraMolduraFrente = 133;






   // *** Background
   if(ObjectFind(0, "Rectangle")>=0) ObjectDelete(0, "Rectangle");
   ObjectCreate(0, "Rectangle", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "Rectangle", OBJPROP_XSIZE, LarguraBackgroud);
   ObjectSetInteger(0, "Rectangle", OBJPROP_YSIZE, 203);
   ObjectSetInteger(0, "Rectangle", OBJPROP_XDISTANCE, 0);
   ObjectSetInteger(0, "Rectangle", OBJPROP_YDISTANCE, 13);
   ObjectSetInteger(0, "Rectangle", OBJPROP_BGCOLOR, clrDarkSlateGray);
   ObjectSetInteger(0, "Rectangle", OBJPROP_BACK, false);
   //ObjectSetInteger(0, "Rectangle", OBJPROP_ZORDER, 99); 
   
   // *** Moldura 1 Traz
   if(ObjectFind(0, "Moldura1Traz")>=0) ObjectDelete(0, "Moldura1Traz");
   ObjectCreate(0, "Moldura1Traz", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "Moldura1Traz", OBJPROP_XSIZE, LarguraMolduraTraz);
   ObjectSetInteger(0, "Moldura1Traz", OBJPROP_YSIZE, 38);
   ObjectSetInteger(0, "Moldura1Traz", OBJPROP_XDISTANCE,1);
   ObjectSetInteger(0, "Moldura1Traz", OBJPROP_YDISTANCE,28);
   ObjectSetInteger(0, "Moldura1Traz", OBJPROP_BGCOLOR, clrMaroon);
   ObjectSetInteger(0, "Moldura1Traz",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSetInteger(0, "Moldura1Traz", OBJPROP_BACK, false);
   
   // *** Moldura 1 Frente
   if(ObjectFind(0, "Moldura1Frente")>=0) ObjectDelete(0, "Moldura1Frente");
   ObjectCreate(0, "Moldura1Frente", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "Moldura1Frente", OBJPROP_XSIZE, LarguraMolduraFrente);
   ObjectSetInteger(0, "Moldura1Frente", OBJPROP_YSIZE, 34);
   ObjectSetInteger(0,"Moldura1Frente",OBJPROP_XDISTANCE,4);
   ObjectSetInteger(0,"Moldura1Frente",OBJPROP_YDISTANCE,30);
   ObjectSetInteger(0, "Moldura1Frente", OBJPROP_BGCOLOR, clrDarkSlateGray);
   ObjectSetInteger(0, "Moldura1Frente",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSetInteger(0, "Moldura1Frente",OBJPROP_BORDER_COLOR,clrOldLace);
   ObjectSetInteger(0, "Moldura1Frente", OBJPROP_BACK, false);
   
   // *** Moldura 2 Traz
   if(ObjectFind(0, "Moldura2Traz")>=0) ObjectDelete(0, "Moldura2Traz");
   ObjectCreate(0, "Moldura2Traz", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "Moldura2Traz", OBJPROP_XSIZE, LarguraMolduraTraz);
   ObjectSetInteger(0, "Moldura2Traz", OBJPROP_YSIZE, 38);
   ObjectSetInteger(0,"Moldura2Traz", OBJPROP_XDISTANCE,1);
   ObjectSetInteger(0,"Moldura2Traz", OBJPROP_YDISTANCE,68);
   ObjectSetInteger(0, "Moldura2Traz", OBJPROP_BGCOLOR, clrMaroon);
   ObjectSetInteger(0, "Moldura2Traz",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSetInteger(0, "Moldura2Traz", OBJPROP_BACK, false);        
   
   // *** Moldura 2 Frente
   if(ObjectFind(0, "Moldura2Frente")>=0) ObjectDelete(0, "Moldura2Frente");
   ObjectCreate(0, "Moldura2Frente", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "Moldura2Frente", OBJPROP_XSIZE, LarguraMolduraFrente);
   ObjectSetInteger(0, "Moldura2Frente", OBJPROP_YSIZE, 34);
   ObjectSetInteger(0,"Moldura2Frente",OBJPROP_XDISTANCE,4);
   ObjectSetInteger(0,"Moldura2Frente",OBJPROP_YDISTANCE,70);
   ObjectSetInteger(0, "Moldura2Frente", OBJPROP_BGCOLOR, clrDarkSlateGray);
   ObjectSetInteger(0, "Moldura2Frente",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSetInteger(0, "Moldura2Frente",OBJPROP_BORDER_COLOR,clrOldLace);
   ObjectSetInteger(0, "Moldura2Frente", OBJPROP_BACK, false);  
   
   // *** Moldura 3 Traz
   if(ObjectFind(0, "Moldura3Traz")>=0) ObjectDelete(0, "Moldura3Traz");
   ObjectCreate(0, "Moldura3Traz", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "Moldura3Traz", OBJPROP_XSIZE, LarguraMolduraTraz);
   ObjectSetInteger(0, "Moldura3Traz", OBJPROP_YSIZE, 23);
   ObjectSetInteger(0,"Moldura3Traz",OBJPROP_XDISTANCE,1);
   ObjectSetInteger(0,"Moldura3Traz",OBJPROP_YDISTANCE,108);
   ObjectSetInteger(0, "Moldura3Traz", OBJPROP_BGCOLOR, clrMaroon);
   ObjectSetInteger(0, "Moldura3Traz",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSetInteger(0, "Moldura3Traz", OBJPROP_BACK, false);        
   
   // *** Moldura 3 Frente
   if(ObjectFind(0, "Moldura3Frente")>=0) ObjectDelete(0, "Moldura3Frente");
   ObjectCreate(0, "Moldura3Frente", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "Moldura3Frente", OBJPROP_XSIZE, LarguraMolduraFrente);
   ObjectSetInteger(0, "Moldura3Frente", OBJPROP_YSIZE, 19);
   ObjectSetInteger(0,"Moldura3Frente",OBJPROP_XDISTANCE,4);
   ObjectSetInteger(0,"Moldura3Frente",OBJPROP_YDISTANCE,110);
   ObjectSetInteger(0, "Moldura3Frente", OBJPROP_BGCOLOR, clrDarkSlateGray);
   ObjectSetInteger(0, "Moldura3Frente",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSetInteger(0, "Moldura3Frente",OBJPROP_BORDER_COLOR,clrOldLace);
   ObjectSetInteger(0, "Moldura3Frente", OBJPROP_BACK, false); 
   
   // *** Moldura 4 Traz
   if(ObjectFind(0, "Moldura4Traz")>=0) ObjectDelete(0, "Moldura4Traz");
   ObjectCreate(0, "Moldura4Traz", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "Moldura4Traz", OBJPROP_XSIZE, LarguraMolduraTraz);
   ObjectSetInteger(0, "Moldura4Traz", OBJPROP_YSIZE, 51);
   ObjectSetInteger(0,"Moldura4Traz",OBJPROP_XDISTANCE,1);
   ObjectSetInteger(0,"Moldura4Traz",OBJPROP_YDISTANCE,133);
   ObjectSetInteger(0, "Moldura4Traz", OBJPROP_BGCOLOR, clrMaroon);
   ObjectSetInteger(0, "Moldura4Traz",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSetInteger(0, "Moldura4Traz", OBJPROP_BACK, false);        
   
   // *** Moldura 4 Frente
   if(ObjectFind(0, "Moldura4Frente")>=0) ObjectDelete(0, "Moldura4Frente");
   ObjectCreate(0, "Moldura4Frente", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "Moldura4Frente", OBJPROP_XSIZE, LarguraMolduraFrente);
   ObjectSetInteger(0, "Moldura4Frente", OBJPROP_YSIZE, 47);
   ObjectSetInteger(0,"Moldura4Frente",OBJPROP_XDISTANCE,4);
   ObjectSetInteger(0,"Moldura4Frente",OBJPROP_YDISTANCE,135);
   ObjectSetInteger(0, "Moldura4Frente", OBJPROP_BGCOLOR, clrDarkSlateGray);
   ObjectSetInteger(0, "Moldura4Frente",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSetInteger(0, "Moldura4Frente",OBJPROP_BORDER_COLOR,clrOldLace);
   ObjectSetInteger(0, "Moldura4Frente", OBJPROP_BACK, false); 
   
   // *** Quadro Orientacao
   if(ObjectFind(0, "QuadroOrientacao")>=0) ObjectDelete(0, "QuadroOrientacao");
   ObjectCreate(0, "QuadroOrientacao", OBJ_RECTANGLE_LABEL, 0, 0, 0);
   ObjectSetInteger(0, "QuadroOrientacao", OBJPROP_XSIZE, LarguraMolduraTraz);
   ObjectSetInteger(0, "QuadroOrientacao", OBJPROP_YSIZE, 25);
   ObjectSetInteger(0,"QuadroOrientacao",OBJPROP_XDISTANCE,2);
   ObjectSetInteger(0,"QuadroOrientacao",OBJPROP_YDISTANCE,187);
   ObjectSetInteger(0, "QuadroOrientacao",OBJPROP_BORDER_TYPE,BORDER_FLAT);
   ObjectSetInteger(0, "QuadroOrientacao",OBJPROP_BORDER_COLOR,clrOldLace);
   ObjectSetInteger(0, "QuadroOrientacao", OBJPROP_BACK, false);


//+------------------------------------------------------------------+
//| Dados Apresentados no Display                 |
//+------------------------------------------------------------------+ 
   
   // Creditos
   if(ObjectFind(0, "Creditos1")>=0) ObjectDelete(0, "Creditos1");
   ObjectCreate(0,"Creditos1",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"Creditos1",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"Creditos1",OBJPROP_TEXT,"4P_advisor v1.3 by Gustavo");
   ObjectSetInteger(0,"Creditos1",OBJPROP_XDISTANCE,2);
   ObjectSetInteger(0,"Creditos1",OBJPROP_YDISTANCE,15);
   ObjectSetInteger(0,"Creditos1",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"Creditos1",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "Creditos1", OBJPROP_BACK, false);
   
   // Lote em Uso
   if(ObjectFind(0, "LoteUso")>=0) ObjectDelete(0, "LoteUso");
   ObjectCreate(0,"LoteUso",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"LoteUso",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"LoteUso",OBJPROP_FONT, "Arial");
   ObjectSetString(0,"LoteUso",OBJPROP_TEXT,"Lote em Uso:");
   ObjectSetInteger(0,"LoteUso",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"LoteUso",OBJPROP_YDISTANCE,32);
   ObjectSetInteger(0,"LoteUso",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"LoteUso",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "LoteUso", OBJPROP_BACK, false);
   
   // Valor Lote em Uso
   if(ObjectFind(0, "ValorLoteUso")>=0) ObjectDelete(0, "ValorLoteUso");
   ObjectCreate(0,"ValorLoteUso",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorLoteUso",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorLoteUso",OBJPROP_FONT, "Arial");         
   ObjectSetInteger(0,"ValorLoteUso",OBJPROP_XDISTANCE,74);
   ObjectSetInteger(0,"ValorLoteUso",OBJPROP_YDISTANCE,32);
   ObjectSetInteger(0,"ValorLoteUso",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0, "ValorLoteUso", OBJPROP_BACK, false);
   
   // Lote Disponivel
   if(ObjectFind(0, "LoteDisponivel")>=0) ObjectDelete(0, "LoteDisponivel");
   ObjectCreate(0,"LoteDisponivel",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"LoteDisponivel",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"LoteDisponivel",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"LoteDisponivel",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"LoteDisponivel",OBJPROP_YDISTANCE,47);
   ObjectSetInteger(0,"LoteDisponivel",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"LoteDisponivel",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "LoteDisponivel", OBJPROP_BACK, false);
   
   // Valor Lote Disponivel         
   if(ObjectFind(0, "ValorLoteDisponivel")>=0) ObjectDelete(0, "ValorLoteDisponivel");
   ObjectCreate(0,"ValorLoteDisponivel",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorLoteDisponivel",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorLoteDisponivel",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"ValorLoteDisponivel",OBJPROP_XDISTANCE,87);
   ObjectSetInteger(0,"ValorLoteDisponivel",OBJPROP_YDISTANCE,47);
   ObjectSetInteger(0,"ValorLoteDisponivel",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0, "ValorLoteDisponivel", OBJPROP_BACK, false);
   
   // Operações nesse Par
   if(ObjectFind(0, "PosicaoAberta")>=0) ObjectDelete(0, "PosicaoAberta");
   ObjectCreate(0,"PosicaoAberta",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"PosicaoAberta",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"PosicaoAberta",OBJPROP_FONT, "Arial");
   ObjectSetString(0,"PosicaoAberta",OBJPROP_TEXT,"Operações nesse Par:");
   ObjectSetInteger(0,"PosicaoAberta",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"PosicaoAberta",OBJPROP_YDISTANCE,72);
   ObjectSetInteger(0,"PosicaoAberta",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"PosicaoAberta",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "PosicaoAberta", OBJPROP_BACK, false);
   
   // Valor Operações nesse Par
   if(ObjectFind(0, "ValorPosicaoAberta")>=0) ObjectDelete(0, "ValorPosicaoAberta");
   ObjectCreate(0,"ValorPosicaoAberta",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorPosicaoAberta",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorPosicaoAberta",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"ValorPosicaoAberta",OBJPROP_XDISTANCE,120);
   ObjectSetInteger(0,"ValorPosicaoAberta",OBJPROP_YDISTANCE,72);
   ObjectSetInteger(0,"ValorPosicaoAberta",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"ValorPosicaoAberta",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "ValorPosicaoAberta", OBJPROP_BACK, false);         
   
   // Lotes Operados nesse Par
   if(ObjectFind(0, "LotesOperadosNoPar")>=0) ObjectDelete(0, "LotesOperadosNoPar");
   ObjectCreate(0,"LotesOperadosNoPar",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"LotesOperadosNoPar",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"LotesOperadosNoPar",OBJPROP_FONT, "Arial");
   ObjectSetString(0,"LotesOperadosNoPar",OBJPROP_TEXT,"Lotes nesse Par:");
   ObjectSetInteger(0,"LotesOperadosNoPar",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"LotesOperadosNoPar",OBJPROP_YDISTANCE,88);
   ObjectSetInteger(0,"LotesOperadosNoPar",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"LotesOperadosNoPar",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "LotesOperadosNoPar", OBJPROP_BACK, false);
   
   // Valor Lotes Operados nesse Par
   if(ObjectFind(0, "ValorLotesOperadosNoPar")>=0) ObjectDelete(0, "ValorLotesOperadosNoPar");
   ObjectCreate(0,"ValorLotesOperadosNoPar",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorLotesOperadosNoPar",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorLotesOperadosNoPar",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"ValorLotesOperadosNoPar",OBJPROP_XDISTANCE,94);
   ObjectSetInteger(0,"ValorLotesOperadosNoPar",OBJPROP_YDISTANCE,88);
   ObjectSetInteger(0,"ValorLotesOperadosNoPar",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"ValorLotesOperadosNoPar",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "ValorLotesOperadosNoPar", OBJPROP_BACK, false);         
   
   // Distancia da Mediana
   if(ObjectFind(0, "DistanciaMediana")>=0) ObjectDelete(0, "DistanciaMediana");
   ObjectCreate(0,"DistanciaMediana",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"DistanciaMediana",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"DistanciaMediana",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"DistanciaMediana",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"DistanciaMediana",OBJPROP_YDISTANCE,112);
   ObjectSetInteger(0,"DistanciaMediana",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"DistanciaMediana",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "DistanciaMediana", OBJPROP_BACK, false);
   
   // Valor Distancia Mediana
   if(ObjectFind(0, "ValorDistanciaMediana")>=0) ObjectDelete(0, "ValorDistanciaMediana");
   ObjectCreate(0,"ValorDistanciaMediana",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorDistanciaMediana",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorDistanciaMediana",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"ValorDistanciaMediana",OBJPROP_XDISTANCE,PosicaoDistanciaMediana);
   ObjectSetInteger(0,"ValorDistanciaMediana",OBJPROP_YDISTANCE,112);
   ObjectSetInteger(0,"ValorDistanciaMediana",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"ValorDistanciaMediana",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "ValorDistanciaMediana", OBJPROP_BACK, false);                  
   
   // Swap Compra
   if(ObjectFind(0, "SwapCompra")>=0) ObjectDelete(0, "SwapCompra");
   ObjectCreate(0,"SwapCompra",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"SwapCompra",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"SwapCompra",OBJPROP_FONT, "Arial");
   ObjectSetString(0,"SwapCompra",OBJPROP_TEXT,"Swap Compra:");
   ObjectSetInteger(0,"SwapCompra",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"SwapCompra",OBJPROP_YDISTANCE,136);
   ObjectSetInteger(0,"SwapCompra",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"SwapCompra",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "SwapCompra", OBJPROP_BACK, false);
   
   // Valor Swap Compra
   if(ObjectFind(0, "ValorSwapCompra")>=0) ObjectDelete(0, "ValorSwapCompra");
   ObjectCreate(0,"ValorSwapCompra",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorSwapCompra",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorSwapCompra",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"ValorSwapCompra",OBJPROP_XDISTANCE,83);
   ObjectSetInteger(0,"ValorSwapCompra",OBJPROP_YDISTANCE,136);
   ObjectSetInteger(0,"ValorSwapCompra",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0, "ValorSwapCompra", OBJPROP_BACK, false);
   
   // Swap Venda
   if(ObjectFind(0, "SwapVenda")>=0) ObjectDelete(0, "SwapVenda");
   ObjectCreate(0,"SwapVenda",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"SwapVenda",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"SwapVenda",OBJPROP_FONT, "Arial");
   ObjectSetString(0,"SwapVenda",OBJPROP_TEXT,"Swap Venda:");
   ObjectSetInteger(0,"SwapVenda",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"SwapVenda",OBJPROP_YDISTANCE,152);
   ObjectSetInteger(0,"SwapVenda",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"SwapVenda",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "SwapVenda", OBJPROP_BACK, false);
   
   // Valor Swap Venda
   if(ObjectFind(0, "ValorSwapVenda")>=0) ObjectDelete(0, "ValorSwapVenda");
   ObjectCreate(0,"ValorSwapVenda",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorSwapVenda",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorSwapVenda",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"ValorSwapVenda",OBJPROP_XDISTANCE,78);
   ObjectSetInteger(0,"ValorSwapVenda",OBJPROP_YDISTANCE,152);
   ObjectSetInteger(0,"ValorSwapVenda",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0, "ValorSwapVenda", OBJPROP_BACK, false);
   
   // Spread
   if(ObjectFind(0, "Spread")>=0) ObjectDelete(0, "Spread");
   ObjectCreate(0,"Spread",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"Spread",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"Spread",OBJPROP_FONT, "Arial");
   ObjectSetString(0,"Spread",OBJPROP_TEXT,"Spread:");
   ObjectSetInteger(0,"Spread",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"Spread",OBJPROP_YDISTANCE,167);
   ObjectSetInteger(0,"Spread",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"Spread",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "Spread", OBJPROP_BACK, false);
   
   // Valor Spread     
   if(ObjectFind(0, "ValorSpread")>=0) ObjectDelete(0, "ValorSpread");
   ObjectCreate(0,"ValorSpread",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"ValorSpread",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"ValorSpread",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"ValorSpread",OBJPROP_XDISTANCE,52);
   ObjectSetInteger(0,"ValorSpread",OBJPROP_YDISTANCE,167);
   ObjectSetInteger(0,"ValorSpread",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0, "ValorSpread", OBJPROP_BACK, false);
   
   // Topo ou Fundo
   if(ObjectFind(0, "OrientacaoTopoFundo")>=0) ObjectDelete(0, "OrientacaoTopoFundo");
   ObjectCreate(0,"OrientacaoTopoFundo",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"OrientacaoTopoFundo",OBJPROP_FONTSIZE,FonteBase1);
   ObjectSetString(0,"OrientacaoTopoFundo",OBJPROP_FONT, "Arial");
   ObjectSetInteger(0,"OrientacaoTopoFundo",OBJPROP_XDISTANCE,FontePaddingLeft);
   ObjectSetInteger(0,"OrientacaoTopoFundo",OBJPROP_YDISTANCE,192);
   ObjectSetInteger(0,"OrientacaoTopoFundo",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"OrientacaoTopoFundo",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "OrientacaoTopoFundo", OBJPROP_BACK, false);
   
   // Orientacao Compra, Vende ou Aguarda
   if(ObjectFind(0, "OrientacaoCompraVenda")>=0) ObjectDelete(0, "OrientacaoCompraVenda");  
   ObjectCreate(0,"OrientacaoCompraVenda",OBJ_LABEL,0,0,0,0,0,0,0);
   ObjectSetInteger(0,"OrientacaoCompraVenda",OBJPROP_FONTSIZE,FonteBase2);
   ObjectSetString(0,"OrientacaoCompraVenda",OBJPROP_FONT, "Arial Black");
   ObjectSetInteger(0,"OrientacaoCompraVenda",OBJPROP_XDISTANCE,70);
   ObjectSetInteger(0,"OrientacaoCompraVenda",OBJPROP_YDISTANCE,191);
   ObjectSetInteger(0,"OrientacaoCompraVenda",OBJPROP_CORNER,CORNER_LEFT_UPPER);
   ObjectSetInteger(0,"OrientacaoCompraVenda",OBJPROP_COLOR,clrSnow);
   ObjectSetInteger(0, "OrientacaoCompraVenda", OBJPROP_BACK, false);
    
   
   

//+------------------------------------------------------------------+
//| Tamanho para redimensionar o Display                 |
//+------------------------------------------------------------------+ 
   int FonteDistanciaXItem1 = 0;
   if(TamanhoDisplay == 2)
     {
     int AumentoQuadroAltura = 20;
     int AumentoQuadroLargura = 35;
     int FonteAumento = 2;
     FonteDistanciaXItem1 = 5;
     int FonteDistanciaXItem2 = 28;
     int FonteDistanciaY = 3;
     
     
      ObjectSetInteger(0,"Creditos1",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"Creditos1",OBJPROP_XDISTANCE,2+FonteDistanciaXItem1);
      ObjectSetInteger(0,"Creditos1",OBJPROP_YDISTANCE,13);
            
      ObjectSetInteger(0,"LoteUso",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"LoteUso",OBJPROP_XDISTANCE,FontePaddingLeft+FonteDistanciaXItem1);
      ObjectSetInteger(0,"LoteUso",OBJPROP_YDISTANCE,32+FonteDistanciaY);
      
      ObjectSetInteger(0,"ValorLoteUso",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"ValorLoteUso",OBJPROP_XDISTANCE,74+FonteDistanciaXItem2);
      ObjectSetInteger(0,"ValorLoteUso",OBJPROP_YDISTANCE,32+FonteDistanciaY);
      
      ObjectSetInteger(0,"LoteDisponivel",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"LoteDisponivel",OBJPROP_XDISTANCE,FontePaddingLeft+FonteDistanciaXItem1);
      ObjectSetInteger(0,"LoteDisponivel",OBJPROP_YDISTANCE,47+FonteDistanciaY); 
      
      ObjectSetInteger(0,"ValorLoteDisponivel",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"ValorLoteDisponivel",OBJPROP_XDISTANCE,PosicaoDistanciaMediana+FonteDistanciaXItem2);
      ObjectSetInteger(0,"ValorLoteDisponivel",OBJPROP_YDISTANCE,47+FonteDistanciaY); 
      
      ObjectSetInteger(0,"PosicaoAberta",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"PosicaoAberta",OBJPROP_XDISTANCE,FontePaddingLeft+FonteDistanciaXItem1);
      ObjectSetInteger(0,"PosicaoAberta",OBJPROP_YDISTANCE,72+FonteDistanciaY); 
      
      ObjectSetInteger(0,"ValorPosicaoAberta",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"ValorPosicaoAberta",OBJPROP_XDISTANCE,120+FonteDistanciaXItem2);
      ObjectSetInteger(0,"ValorPosicaoAberta",OBJPROP_YDISTANCE,72+FonteDistanciaY); 
      
      ObjectSetInteger(0,"LotesOperadosNoPar",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"LotesOperadosNoPar",OBJPROP_XDISTANCE,FontePaddingLeft+FonteDistanciaXItem1);
      ObjectSetInteger(0,"LotesOperadosNoPar",OBJPROP_YDISTANCE,88+FonteDistanciaY); 
      
      ObjectSetInteger(0,"ValorLotesOperadosNoPar",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"ValorLotesOperadosNoPar",OBJPROP_XDISTANCE,94+FonteDistanciaXItem2);
      ObjectSetInteger(0,"ValorLotesOperadosNoPar",OBJPROP_YDISTANCE,88+FonteDistanciaY);
      
      ObjectSetInteger(0,"DistanciaMediana",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"DistanciaMediana",OBJPROP_XDISTANCE,FontePaddingLeft+FonteDistanciaXItem1);
      ObjectSetInteger(0,"DistanciaMediana",OBJPROP_YDISTANCE,112+FonteDistanciaY);
      
      ObjectSetInteger(0,"ValorDistanciaMediana",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"ValorDistanciaMediana",OBJPROP_XDISTANCE,81+FonteDistanciaXItem2);
      ObjectSetInteger(0,"ValorDistanciaMediana",OBJPROP_YDISTANCE,112+FonteDistanciaY);
      
      ObjectSetInteger(0,"SwapCompra",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"SwapCompra",OBJPROP_XDISTANCE,FontePaddingLeft+FonteDistanciaXItem1);
      ObjectSetInteger(0,"SwapCompra",OBJPROP_YDISTANCE,136+FonteDistanciaY);
      
      ObjectSetInteger(0,"ValorSwapCompra",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"ValorSwapCompra",OBJPROP_XDISTANCE,83+FonteDistanciaXItem2);
      ObjectSetInteger(0,"ValorSwapCompra",OBJPROP_YDISTANCE,136+FonteDistanciaY);
      
      ObjectSetInteger(0,"SwapVenda",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"SwapVenda",OBJPROP_XDISTANCE,FontePaddingLeft+FonteDistanciaXItem1);
      ObjectSetInteger(0,"SwapVenda",OBJPROP_YDISTANCE,152+FonteDistanciaY);
      
      ObjectSetInteger(0,"ValorSwapVenda",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"ValorSwapVenda",OBJPROP_XDISTANCE,78+FonteDistanciaXItem2);
      ObjectSetInteger(0,"ValorSwapVenda",OBJPROP_YDISTANCE,152+FonteDistanciaY);
      
      ObjectSetInteger(0,"Spread",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"Spread",OBJPROP_XDISTANCE,FontePaddingLeft+FonteDistanciaXItem1);
      ObjectSetInteger(0,"Spread",OBJPROP_YDISTANCE,167+FonteDistanciaY);
      
      ObjectSetInteger(0,"ValorSpread",OBJPROP_FONTSIZE,FonteBase1+FonteAumento);
      ObjectSetInteger(0,"ValorSpread",OBJPROP_XDISTANCE,52+FonteDistanciaXItem2);
      ObjectSetInteger(0,"ValorSpread",OBJPROP_YDISTANCE,167+FonteDistanciaY);
      
      ObjectSetInteger(0,"OrientacaoTopoFundo",OBJPROP_FONTSIZE,FonteBase2+FonteAumento);
      ObjectSetInteger(0,"OrientacaoTopoFundo",OBJPROP_XDISTANCE,10+FontePaddingLeft+FonteDistanciaXItem1);
      ObjectSetInteger(0,"OrientacaoTopoFundo",OBJPROP_YDISTANCE,180+AumentoQuadroAltura+FonteDistanciaY);
      
      ObjectSetInteger(0,"OrientacaoCompraVenda",OBJPROP_FONTSIZE,FonteBase2+FonteAumento);
      ObjectSetInteger(0,"OrientacaoCompraVenda",OBJPROP_XDISTANCE,70+FonteDistanciaXItem1);
      ObjectSetInteger(0,"OrientacaoCompraVenda",OBJPROP_YDISTANCE,178+AumentoQuadroAltura+FonteDistanciaY);                    
   
      ObjectSetInteger(0, "Rectangle", OBJPROP_XSIZE, 145+AumentoQuadroLargura);
      ObjectSetInteger(0, "Rectangle", OBJPROP_YSIZE, 197+AumentoQuadroAltura);           
      ObjectSetInteger(0, "Rectangle", OBJPROP_XDISTANCE, 0);
      ObjectSetInteger(0, "Rectangle", OBJPROP_YDISTANCE, 13);
                
      ObjectSetInteger(0, "Moldura1Traz", OBJPROP_XSIZE, 139+AumentoQuadroLargura);
      ObjectSetInteger(0, "Moldura1Traz", OBJPROP_YSIZE, 38+AumentoQuadroAltura);
      ObjectSetInteger(0, "Moldura1Traz",OBJPROP_XDISTANCE,1);
      ObjectSetInteger(0, "Moldura1Traz",OBJPROP_YDISTANCE,28);           
      
      ObjectSetInteger(0, "Moldura1Frente", OBJPROP_XSIZE, 133+AumentoQuadroLargura);
      ObjectSetInteger(0, "Moldura1Frente", OBJPROP_YSIZE, 34+AumentoQuadroAltura);
      ObjectSetInteger(0, "Moldura1Frente",OBJPROP_XDISTANCE,4);
      ObjectSetInteger(0, "Moldura1Frente",OBJPROP_YDISTANCE,30);           
      
      ObjectSetInteger(0, "Moldura2Traz", OBJPROP_XSIZE, 139+AumentoQuadroLargura);
      ObjectSetInteger(0, "Moldura2Traz", OBJPROP_YSIZE, 38+AumentoQuadroAltura);
      ObjectSetInteger(0,"Moldura2Traz",OBJPROP_XDISTANCE,1);
      ObjectSetInteger(0,"Moldura2Traz",OBJPROP_YDISTANCE,68);
      
      ObjectSetInteger(0, "Moldura2Frente", OBJPROP_XSIZE, 133+AumentoQuadroLargura);
      ObjectSetInteger(0, "Moldura2Frente", OBJPROP_YSIZE, 34+AumentoQuadroAltura);
      ObjectSetInteger(0,"Moldura2Frente",OBJPROP_XDISTANCE,4);
      ObjectSetInteger(0,"Moldura2Frente",OBJPROP_YDISTANCE,70);           
      
      ObjectSetInteger(0, "Moldura3Traz", OBJPROP_XSIZE, 139+AumentoQuadroLargura);
      ObjectSetInteger(0, "Moldura3Traz", OBJPROP_YSIZE, 23+AumentoQuadroAltura);
      ObjectSetInteger(0,"Moldura3Traz",OBJPROP_XDISTANCE,1);
      ObjectSetInteger(0,"Moldura3Traz",OBJPROP_YDISTANCE,108);
        
      ObjectSetInteger(0, "Moldura3Frente", OBJPROP_XSIZE, 133+AumentoQuadroLargura);
      ObjectSetInteger(0, "Moldura3Frente", OBJPROP_YSIZE, 19+AumentoQuadroAltura);
      ObjectSetInteger(0,"Moldura3Frente",OBJPROP_XDISTANCE,4);
      ObjectSetInteger(0,"Moldura3Frente",OBJPROP_YDISTANCE,110);           
                  
      ObjectSetInteger(0, "Moldura4Traz", OBJPROP_XSIZE, 139+AumentoQuadroLargura);
      ObjectSetInteger(0, "Moldura4Traz", OBJPROP_YSIZE, 42+AumentoQuadroAltura);
      ObjectSetInteger(0,"Moldura4Traz",OBJPROP_XDISTANCE,1);
      ObjectSetInteger(0,"Moldura4Traz",OBJPROP_YDISTANCE,133);
      
      ObjectSetInteger(0, "Moldura4Frente", OBJPROP_XSIZE, 133+AumentoQuadroLargura);
      ObjectSetInteger(0, "Moldura4Frente", OBJPROP_YSIZE, 38+AumentoQuadroAltura);
      ObjectSetInteger(0,"Moldura4Frente",OBJPROP_XDISTANCE,4);
      ObjectSetInteger(0,"Moldura4Frente",OBJPROP_YDISTANCE,135);
   
      ObjectSetInteger(0, "QuadroOrientacao", OBJPROP_XSIZE, 139+AumentoQuadroLargura);
      ObjectSetInteger(0, "QuadroOrientacao", OBJPROP_YSIZE, 8+AumentoQuadroAltura);
      ObjectSetInteger(0,"QuadroOrientacao",OBJPROP_XDISTANCE,2);
      ObjectSetInteger(0,"QuadroOrientacao",OBJPROP_YDISTANCE,198);
      
     }
    else if(TamanhoDisplay == 3)
     {
      
     }
    else if(TamanhoDisplay == 4)
     {
      
     }
     

//+------------------------------------------------------------------+
//| Localização Painel                 |
//+------------------------------------------------------------------+ 
// Canto Direito Superior     
      if(LocalizacaoDisplay == 4)
       {
       int FontePaddingRight = 130;
       int FonteAjusteRight = 0;
          //modificacoes canto direito com tamanho maior
          if(TamanhoDisplay == 2)
            {
             LarguraBackgroud += 40;
             LarguraMolduraTraz += 40;
             LarguraMolduraFrente += 40;
             FontePaddingRight += 38;
             FonteAjusteRight += 18;
            }
         ObjectSetInteger(0,"Rectangle",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0, "Rectangle", OBJPROP_XDISTANCE, LarguraBackgroud+1);
         
         ObjectSetInteger(0,"Moldura1Traz",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0, "Moldura1Traz", OBJPROP_XDISTANCE, LarguraMolduraTraz+4);
         
         ObjectSetInteger(0,"Moldura1Frente",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0, "Moldura1Frente", OBJPROP_XDISTANCE, LarguraMolduraFrente+7);
              
         ObjectSetInteger(0,"Moldura2Traz",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0, "Moldura2Traz", OBJPROP_XDISTANCE, LarguraMolduraTraz+4);
         
         ObjectSetInteger(0,"Moldura2Frente",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0, "Moldura2Frente", OBJPROP_XDISTANCE, LarguraMolduraFrente+7);
         
         ObjectSetInteger(0,"Moldura3Traz",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0, "Moldura3Traz", OBJPROP_XDISTANCE, LarguraMolduraTraz+4);
         
         ObjectSetInteger(0,"Moldura3Frente",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0, "Moldura3Frente", OBJPROP_XDISTANCE, LarguraMolduraFrente+7);
         
         ObjectSetInteger(0,"Moldura4Traz",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0, "Moldura4Traz", OBJPROP_XDISTANCE, LarguraMolduraTraz+4);
         
         ObjectSetInteger(0,"Moldura4Frente",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0, "Moldura4Frente", OBJPROP_XDISTANCE, LarguraMolduraFrente+7);
         
         ObjectSetInteger(0,"QuadroOrientacao",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0, "QuadroOrientacao", OBJPROP_XDISTANCE, LarguraMolduraTraz+3);        
                        
         // textos ancoragem
         ObjectSetInteger(0,"Creditos1",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"LoteUso",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"ValorLoteUso",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"LoteDisponivel",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"ValorLoteDisponivel",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"PosicaoAberta",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"ValorPosicaoAberta",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"LotesOperadosNoPar",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"ValorLotesOperadosNoPar",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"DistanciaMediana",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"ValorDistanciaMediana",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"SwapCompra",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"ValorSwapCompra",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"SwapVenda",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"ValorSwapVenda",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"Spread",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"ValorSpread",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"OrientacaoTopoFundo",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         ObjectSetInteger(0,"OrientacaoCompraVenda",OBJPROP_CORNER,CORNER_RIGHT_UPPER);
         // ajuste textos
         ObjectSetInteger(0,"Creditos1",OBJPROP_XDISTANCE,12+FontePaddingRight);
         ObjectSetInteger(0,"LoteUso",OBJPROP_XDISTANCE,FontePaddingLeft+FontePaddingRight);
         ObjectSetInteger(0,"ValorLoteUso",OBJPROP_XDISTANCE,64+FonteAjusteRight);
         ObjectSetInteger(0,"LoteDisponivel",OBJPROP_XDISTANCE,FontePaddingLeft+FontePaddingRight);
         ObjectSetInteger(0,"ValorLoteDisponivel",OBJPROP_XDISTANCE,57+FonteAjusteRight);
         ObjectSetInteger(0,"PosicaoAberta",OBJPROP_XDISTANCE,FontePaddingLeft+FontePaddingRight);
         ObjectSetInteger(0,"ValorPosicaoAberta",OBJPROP_XDISTANCE,25+FonteAjusteRight);
         ObjectSetInteger(0,"LotesOperadosNoPar",OBJPROP_XDISTANCE,FontePaddingLeft+FontePaddingRight);
         ObjectSetInteger(0,"ValorLotesOperadosNoPar",OBJPROP_XDISTANCE,50+FonteAjusteRight);
         ObjectSetInteger(0,"DistanciaMediana",OBJPROP_XDISTANCE,FontePaddingLeft+FontePaddingRight);
         ObjectSetInteger(0,"ValorDistanciaMediana",OBJPROP_XDISTANCE,FontePaddingLeft+54+FonteAjusteRight);
         ObjectSetInteger(0,"SwapCompra",OBJPROP_XDISTANCE,FontePaddingLeft+FontePaddingRight);
         ObjectSetInteger(0,"ValorSwapCompra",OBJPROP_XDISTANCE,63+FonteAjusteRight);
         ObjectSetInteger(0,"SwapVenda",OBJPROP_XDISTANCE,FontePaddingLeft+FontePaddingRight);
         ObjectSetInteger(0,"ValorSwapVenda",OBJPROP_XDISTANCE,68+FonteAjusteRight);
         ObjectSetInteger(0,"Spread",OBJPROP_XDISTANCE,FontePaddingLeft+FontePaddingRight);
         ObjectSetInteger(0,"ValorSpread",OBJPROP_XDISTANCE,92+FonteAjusteRight);
         ObjectSetInteger(0,"OrientacaoTopoFundo",OBJPROP_XDISTANCE,FontePaddingLeft+FontePaddingRight);
         ObjectSetInteger(0,"OrientacaoCompraVenda",OBJPROP_XDISTANCE,80+FonteDistanciaXItem1+FonteAjusteRight);

         

       }