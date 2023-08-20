//+------------------------------------------------------------------+
//|                                                          VPP.mq5 |
//|                                  Copyright 2023, MetaQuotes Ltd. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
inline bool IsNewBar(ENUM_TIMEFRAMES timeframe = PERIOD_CURRENT)
   {
      static datetime lastBar;
      return lastBar != (lastBar = iTime(_Symbol, timeframe, 0)
      );
   }
int OnInit()
  {
//---
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
   bool newBar = IsNewBar(PERIOD_CURRENT);
  if(newBar)
    {
      bool conditionUpTrend = false;
      bool conditionDownTrend = false;
      
      double nowBarlow = iLow(_Symbol,PERIOD_CURRENT,1);
      double nowBarHigh = iHigh(_Symbol,PERIOD_CURRENT,1);
      double preBarlow = iLow(_Symbol,PERIOD_CURRENT,2);
      double preBarHigh = iHigh(_Symbol,PERIOD_CURRENT,2);
      Print("nowBarlow = ",nowBarlow," nowBarHigh = ",nowBarHigh," preBarlow = ",preBarlow," preBarHigh = ",preBarHigh);
      if(nowBarlow>preBarlow)
        {
         conditionUpTrend = true;
         conditionDownTrend = false;
        }else if(nowBarlow<preBarlow)
                {
                  conditionUpTrend = false;
                  conditionDownTrend = true;
                }
                
         Print("Up = ",conditionUpTrend ," - Down = ",conditionDownTrend);  
    }  
      while()          
   
   //ObjectCreate(0, "TrendLine", OBJ_TREND, 0, TimeStart, today_price, TimeEnd, future_price);
  }
//+------------------------------------------------------------------+
