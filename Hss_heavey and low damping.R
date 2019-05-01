##多圖組合
multiplot <- function(..., plotlist=NULL, file, cols=1, layout=NULL) {
  library(grid)
  
  # Make a list from the ... arguments and plotlist
  plots <- c(list(...), plotlist)
  
  numPlots = length(plots)
  
  # If layout is NULL, then use 'cols' to determine layout
  if (is.null(layout)) {
    # Make the panel
    # ncol: Number of columns of plots
    # nrow: Number of rows needed, calculated from # of cols
    layout <- matrix(seq(1, cols * ceiling(numPlots/cols)),
                     ncol = cols, nrow = ceiling(numPlots/cols))
  }
  
  if (numPlots==1) {
    print(plots[[1]])
    
  } else {
    # Set up the page
    grid.newpage()
    pushViewport(viewport(layout = grid.layout(nrow(layout), ncol(layout))))
    
    # Make each plot, in the correct location
    for (i in 1:numPlots) {
      # Get the i,j matrix positions of the regions that contain this subplot
      matchidx <- as.data.frame(which(layout == i, arr.ind = TRUE))
      
      print(plots[[i]], vp = viewport(layout.pos.row = matchidx$row,
                                      layout.pos.col = matchidx$col))
    }
  }
}
##
library(ggplot2)
library(grid)
#呼叫方法
#（檔案位置,工作表。默認為1）
HSS_straight_low <- read_excel("Downloads/HSS_straight.xlsx",sheet = 2)
HSS_straight_heavey <- read_excel("Downloads/HSS_straight.xlsx",sheet = 1)

set.seed(5)#隨機種子5號
#sample(取樣位置, 個數, 數否重複取樣。默認為不重複取樣)
HSS_straight_low.subset <- HSS_straight_low[sample(nrow(HSS_straight_low), 10000),]#對row取樣，儲存到subset裡面。
#
set.seed(3)#隨機種子3號
HSS_straight_heavey.subset <- HSS_straight_heavey[sample(nrow(HSS_straight_heavey), 10000),] 
#
#繪圖
chart_1 = qplot(Time, f, data = HSS_straight_low.subset,alpha = I(1/100))+ #alpha標點透明化
  ggtitle("low damping")+ #題目
  xlab('Time')+ #x標題
  ylab('Amp') #y標題
chart_2 = qplot(Time, f, data = HSS_straight_heavey.subset,alpha = I(1/100))+
  ggtitle("heavey damping")+
  xlab('Time')+
  ylab('Amp')
  
##組合圖面
multiplot(chart_1, chart_2) 
