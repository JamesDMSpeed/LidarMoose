# Simulating point density
# This script starts off similary as 'AutomatedDataSummary...R.'
library(raster)

#List files and read in
lf1<-list.files('data/canopy_height_clipped_raster/',pattern='*canopyheight.grd',full.names = T)
# 90 grd-files found. That means 45 sites, which is more than we have field data for!

canopymods<-lapply(lf1,raster::raster)

mySlash <- "/"   # alt: change to "\"
for(i in 1:length(canopymods)){
  names(canopymods)[[i]] <- sub(
    "_canopyheight.*", "", x = sub(
      paste0(".*clipped_raster", mySlash), "", x = canopymods[[i]]@file@name))
}


# Bratsberg has a resolution of 5 point per m2, so each pixel ehere is made up of about 5 values. 
valBratsbergB <- raster::values(canopymods$bratsberg_b)
valBratsbergUB <- raster::values(canopymods$bratsberg_ub)

valBratsbergB <- valBratsbergB[!is.na(valBratsbergB)]
valBratsbergUB <- valBratsbergUB[!is.na(valBratsbergUB)]

par(mfrow=c(1,2))
plot(valBratsbergB)
plot(valBratsbergUB)

# Steinkjer1BBb has 2 point per m2
valSteinB <- raster::values(canopymods$steinkjer_1BBb_b)
valSteinUB <- raster::values(canopymods$steinkjer_1BBb_ub)

valSteinB <- valSteinB[!is.na(valSteinB)]
valSteinUB <- valSteinUB[!is.na(valSteinUB)]

par(mfrow=c(1,2))
plot(valSteinB)
plot(valSteinUB)

# This site is medium productive, and withthe LiDar data is just 3 years into the experiment. Bratsbeg has 9 years of growth. 
mean(valBratsbergB) #0.4
mean(valBratsbergUB)#2.1
mean(valSteinB)     #0.1
mean(valSteinUB)    #0.2


# let each CV be derived from mean canopy height in 1000 unique simulation/permutations
# Starting with BratsbergB
# Bratsberg ####
CVdat <- data.frame(cells = seq(10, 400, 10))

for(i in 1:1000){
  for(t in seq(10, 400, 10)){
    if(length(valBratsbergB)>t){
      CVdat[CVdat$cells==t,i+1] <- mean(sample(valBratsbergB, t, replace = T))
    }
  }
}


for(i in 1:40){
CVdat[i, "sd"] <- sd(CVdat[i,2:1001])
}

CVdat$cv <- CVdat$sd/mean(valBratsbergB)

plot(CVdat$cv~CVdat$cells, ylab="cv", xlab="number of cells", ylim=c(0,0.6))
text(x=200, y=0.4, "Open plot\nHighly productive site (Bratsberg)")



# Next, BratsbergUB
CVdat2 <- data.frame(cells = seq(10, 400, 10))

for(i in 1:1000){
  for(t in seq(10, 400, 10)){
    if(length(valBratsbergUB)>t){
      CVdat2[CVdat2$cells==t,i+1] <- mean(sample(valBratsbergUB, t, replace = T))
    }
  }
}


for(i in 1:40){
  CVdat2[i, "sd"] <- sd(CVdat2[i,2:1001])
}

CVdat2$cv <- CVdat2$sd/mean(valBratsbergUB)

plot(CVdat2$cv~CVdat2$cells, ylab="cv", xlab="number of cells")
text(x=200, y=0.15, "Exclosed plot\nHighly productive site (Bratsberg)")





ggdat <- data.frame(cells        = rep(seq(10, 400, 10), 2),
                    trt          = rep(c("openPlot", "exclosedPlot"), each=40),
                    cv           = c(CVdat$cv,CVdat2$cv))


ggplot(data = ggdat, aes(x=cells, y=cv, shape = trt, colour=trt))+
  geom_point(size=2)+
  theme_classic()
  



# SITE 2 ####
# Now lets try the same with a less-productive site
CVdat3 <- data.frame(cells = seq(10, 420, 10))

for(i in 1:1000){
  for(t in seq(10, 420, 10)){
    if(length(valSteinB)>t){
      CVdat3[CVdat3$cells==t,i+1] <- mean(sample(valSteinB, t, replace = T))
    }
  }
}


for(i in 1:42){
  CVdat3[i, "sd"] <- sd(CVdat3[i,2:1001])
}

CVdat3$cv <- CVdat3$sd/mean(valSteinB)

plot(CVdat3$cv~CVdat3$cells, ylab="cv", xlab="number of cells", ylim=c(0,0.6))
text(x=200, y=0.4, "Open plot\nMedium productive site (SteinkjerBBB)")



# Next, SteinkjerBBBuB
CVdat4 <- data.frame(cells = seq(10, 420, 10))

for(i in 1:1000){
  for(t in seq(10, 420, 10)){
    if(length(valSteinUB)>t){
      CVdat4[CVdat4$cells==t,i+1] <- mean(sample(valSteinUB, t, replace = T))
    }
  }
}


for(i in 1:42){
  CVdat4[i, "sd"] <- sd(CVdat4[i,2:1001])
}

CVdat4$cv <- CVdat4$sd/mean(valSteinUB)

plot(CVdat4$cv~CVdat4$cells, ylab="cv", xlab="number of cells")
text(x=200, y=0.3, "Exclosed plot\nMedium productive site (SteinkjerBBB)")





ggdat2 <- data.frame(cells        = rep(seq(10, 420, 10), 2),
                    trt          = rep(c("openPlot", "exclosedPlot"), each=42),
                    cv           = c(CVdat3$cv,CVdat4$cv))


ggdat$site <- "Bratsberg"
ggdat2$site <- "SteinskjerBBb"
ggdat3 <- rbind(ggdat, ggdat2)


tiff("simulation.tiff", height=400, width = 400, units="px")
ggplot(data = ggdat3, aes(x=cells, y=cv, shape = trt, colour=trt))+
  geom_point(size=3)+
  theme_classic()+
  theme(legend.title=element_blank())+
  scale_shape_discrete( 
    breaks=c("exclosedPlot", "openPlot"),
    labels=c("Exclosures", "Open plot"))+
  scale_colour_discrete( 
    breaks=c("exclosedPlot", "openPlot"),
    labels=c("Exclosures", "Open plot"))+
  theme(text = element_text(size = 14))+
  theme(legend.justification=c(1,1), legend.position=c(0.9,0.9))+
  facet_wrap(~ site, scales = "fixed", labeller = label_both)
dev.off()
