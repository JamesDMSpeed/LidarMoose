# run canopy_terrain_modeling.R with i == maarud1

myLAS <- singleOrFirstOfMany # open
myLAS2 <- singleOrFirstOfMany # exclosed


q1 <- stats::quantile(myLAS,0.95)
q2 <- stats::quantile(myLAS2, 0.95)
m1 <- median(myLAS) #0.1
m2 <- median(myLAS2) # 2.9
#sd1 <- sd(myLAS) #0.69
#sd2 <- sd(myLAS2) # 1.8
#mad1 <- mad(myLAS) #0.16
#mad2 <- mad(myLAS2) #0.1.82
#rmad1 <- mad1/m1 #1.63
#rmad2 <- mad2/m2 #0.6

myLAS <- as.data.frame(myLAS)
names(myLAS) <- "relHeight"
myLAS2 <- as.data.frame(myLAS2)
names(myLAS2) <- "relHeight"

tempdat <- rbind(
  myLAS, myLAS2
)
tempdat$Treatment <- c(rep("Open Plots", nrow(myLAS)), 
                       rep("Exclosure", nrow(myLAS2)))
library(ggplot2)
(vertTransect <- ggplot(tempdat, aes(relHeight, stat(density), group=Treatment, lty=Treatment)) +
    geom_freqpoly(binwidth = 0.3, lwd=1)+
    coord_flip()+
    theme_classic()+
    xlim(c(-0.2,9))+
    ylim(c(0,1))+
    xlab("Height (m)") + ylab("Density")+
    geom_segment(aes(y = 0.25, x = q1, yend = 0.25, xend = q1),show.legend=FALSE, linetype=1,
                 arrow = arrow(length = unit(0.5, "cm")))+
    geom_segment(aes(y = 0.75, x = q1, yend = 0.25, xend = q1),show.legend=FALSE, linetype=2)+
    geom_segment(aes(y = 0.75, x = q2, yend = 0.25, xend = q2),show.legend=FALSE,
                 arrow = arrow(length = unit(0.5, "cm")))+
    annotate(geom="text", x=q2+0.2, y=.6, label="95th percentile",
             color="black")+
    annotate(geom="text", x=q1+0.2, y=.6, label="95th percentile",
             color="black")+
    
  #  geom_segment(aes(y = 0.5, x = m1, yend = 0.25, xend = m1),show.legend=FALSE, linetype=1,
  #               arrow = arrow(length = unit(0.5, "cm")))+
  #  geom_segment(aes(y = 0.75, x = m1, yend = 0.25, xend = q1),show.legend=FALSE, linetype=2)+
  #  geom_segment(aes(y = 0.75, x = q2, yend = 0.25, xend = q2),show.legend=FALSE,
  #               arrow = arrow(length = unit(0.5, "cm")))+
  #  annotate(geom="text", x=q2+0.2, y=.6, label="95th percentile",
  #           color="black")+
  #  annotate(geom="text", x=q1+0.2, y=.6, label="95th percentile",
  #           color="black")+
    
    
    theme(legend.justification=c(1,1), 
          legend.position=c(1,1),
          legend.title = element_blank())
)


#tiff("/home/anders/Documents/lidar ms/Figures/verticalTransect.tif", res = 300, units = "in", width = 3, height = 5)
vertTransect
#dev.off()
