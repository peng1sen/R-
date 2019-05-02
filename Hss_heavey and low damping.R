##
library(readxl)
library(ggplot2)
library(grid)
#
HSS_straight_low <- read_excel("Downloads/test00000.xlsx")
#
set.seed(5)
HSS_straight_low.subset <- HSS_straight_low[sample(nrow(HSS_straight_low),1000),] 
chart_1 = qplot(HSS_straight_low.subset$`Time, s`, HSS_straight_low.subset$`LT LOWER TRAP., uV`, data = HSS_straight_low.subset,alpha = I(1/10))+
  ggtitle("lulu")+
  xlab('Time')+
  ylab('uV')
chart_1
##
