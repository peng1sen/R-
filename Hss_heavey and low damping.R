##
library(ggplot2)
library(grid)
#
HSS_straight_low <- read_excel("Downloads/test00000.xlsx")
#
set.seed(5)
HSS_straight_low.subset <- HSS_straight_low[sample(nrow(HSS_straight_low), 10000),] 
chart_1 = qplot(Time, f, data = HSS_straight_low.subset,alpha = I(1/100))+
  ggtitle("low damping")+
  xlab('Time')+
  ylab('uV')
##
