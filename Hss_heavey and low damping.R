##
library(readxl)
library(ggplot2)
library(grid)
#
HSS_straight_low <- read_excel("Downloads/test00000.xlsx")
#
chart_1 = qplot(HSS_straight_low$`Time, s`, HSS_straight_low$`LT LOWER TRAP., uV`, data = HSS_straight_low,geom = "line")+
  ggtitle("lulu")+
  xlab('Time')+
  ylab('uV')
chart_1
##
