
# TOP / packages ----------------------------------------------------------


require(lidR)
require(raster)
require(rasterVis)
require(rasterVis)
require(sp)
library(rgl)
library(lattice)
library(grid)
library(ggplot2)
library(stringr)
library(readr)
library(rgeos)


# Coordinates -------------------------------------------------------------


plotcoords<-read.csv('data/troendelag_20m_flater_pkt.csv',header=T,sep=';',dec=',')
plotcoords_telemark<-read.csv('data/Koordinater_20x20_Telemark.csv',header=T,sep=';',dec=',')
plotcoords_hedmark_akershus<-read.csv('data/Koordinater_20x20_Hedmark_Akershus.csv',header=T,sep=';',dec=',')
plotcoords$region <- "Trondelag"
plotcoords_telemark$region <- "Telemark"
plotcoords_hedmark_akershus$region <- "Hedmark"

#unique(plotcoords_telemark$flatenavn)
(unique(plotcoords$Name)[1])
unique(plotcoords_telemark$flatenavn)

plotcoords_telemark$flatenavn <- as.character(plotcoords_telemark$flatenavn)
plotcoords_telemark$flatenavn[plotcoords_telemark$flatenavn == "Fritz\xf8e 2 UB"] <- "Fritsoe_2_UB"
plotcoords_telemark$flatenavn[plotcoords_telemark$flatenavn == "Fritz\xf8e 2 B"] <- "Fritsoe_2_B"
plotcoords_telemark$flatenavn[plotcoords_telemark$flatenavn == "Fritz\xf8e 1 UB"] <- "Fritsoe_1_UB"
plotcoords_telemark$flatenavn[plotcoords_telemark$flatenavn == "Fritz\xf8e 1 B"] <- "Fritsoe_1_B"


myCols <- c("Name", "utm32ost", "utm32nord", "region")
myCoords <- rbind(plotcoords[,myCols],
                  setNames(plotcoords_telemark[,c("flatenavn", "utm32east", "utm32north", "region")],myCols),
                  setNames(plotcoords_hedmark_akershus[,c("Uthegningi", "utm32east", "utm32north", "region")],myCols))
# NOTE: files are in data/clipped_las
#length(unique(myCoords$Name))
rm(plotcoords); rm(plotcoords_hedmark_akershus);rm(plotcoords_telemark)
# I need to match the site names with the LAS file names
link <- read_csv("data/LASnamesAndCoordNames.csv")
myCoords$LASname <- link$las[match(myCoords$Name, link$coords)]
rm(link); rm(myCols)


bratsberg_b       <- readLAS('data/clipped_las/bratsberg_b.las')
bratsberg_ub      <- readLAS('data/clipped_las/bratsberg_ub.las')


threshold <-10

myX <- "East, UTM32"
myY <- "North, UTM32"


i <- "bratsberg_ub"


temp <- readLAS(paste0('data/clipped_las/', i, '.las'))

# normalise with tin model
temp <- normalize_height(temp, tin())

# Canopy model for identifying trees
CM <- grid_canopy(temp, 
                  res=1,
                  p2r())

trees <- find_trees(temp,lmf(ws = 8, hmin= 1 , shape = "square"))
# Then 
if(nrow(trees@data[trees@data$Z>threshold,]) !=1){
  trees <- trees[trees$Z>threshold,]
}else{trees <- trees[c(
  which(trees@data$Z == min(trees@data$Z)),
  which(trees@data$Z == max(trees@data$Z))
),]

}

#plot(CM);plot(trees, add=T, pch=1);plot(trees, add=T)

temp <- segment_trees(temp,
                      dalponte2016(
                        chm=CM,
                        treetops=trees,
                        th_tree = 4,
                        th_seed = 0.35,
                        th_cr = 0.55,
                        max_cr = 6,
                        ID = "treeID"
                      )
)



#Make hulls around the trees for plotting
#if(any(!is.na(temp@data$treeID))){
#treeout <- delineate_crowns(temp, type='convex', attribute='treeID')
#}
#plot(CM); plot(treeout, add=T)

# remove points that are part of these trees
temp <- filter_poi(temp,
                   is.na(temp@data$treeID))

# Prepare for cutting extent
tempCoords <- myCoords[myCoords$LASname==i,c('utm32ost', "utm32nord")]
tempCoords <- tempCoords[!is.na(tempCoords$utm32ost),]

myHull<-chull(as.matrix(tempCoords))
myPoly<-Polygon(as.matrix(tempCoords[myHull,]))


# Calculate 2m buffen inn from the fence
p <-  Polygon(myPoly@coords)
ps = Polygons(list(p),1)
sps = SpatialPolygons(list(ps))
sps2 <- gBuffer(sps, width = -2)

# clip
temp <- clip_roi(temp, sps2)


# create column 'pulseID'
temp <- retrieve_pulses(temp)


myMin <- aggregate(data=temp@data, ReturnNumber~pulseID, FUN = min)

myMin$ID <- paste(myMin$pulseID, myMin$ReturnNumber, sep="-")
temp@data$ID <- paste(temp@data$pulseID, temp@data$ReturnNumber, sep="-")

singleOrFirstOfMany <- temp@data$Z[temp@data$ID %in% myMin$ID]


# let each CV be derived from 95percentil  1000 unique simulation/permutations
# Starting with BratsbergB
# Bratsberg ####
m <- 5000
b <- (m-100)/30
CVdat <- data.frame(cells = seq(100, m, 100))

for(i in 1:1000){
  for(t in seq(100, m, 100)){
    if(length(singleOrFirstOfMany)>t){
      CVdat[CVdat$cells==t,i+1] <- stats::quantile(sample(singleOrFirstOfMany, t, replace = T), .95)
    }
  }
}


for(i in 1:50){
  CVdat[i, "sd"] <- sd(CVdat[i,2:1001])
}

CVdat$cv <- CVdat$sd/stats::quantile(singleOrFirstOfMany, .95)

plot(CVdat$cv~CVdat$cells, ylab="cv", xlab="number of points")
text(x=200, y=0.4, "Open plot\nHighly productive site (Bratsberg)")



# Next, BratsbergUB
m <- 5000
b <- (m-100)/30
CVdat2 <- data.frame(cells = seq(100, m, 100))

for(i in 1:1000){
  for(t in seq(100, m, 100)){
    if(length(singleOrFirstOfMany)>t){
      CVdat2[CVdat2$cells==t,i+1] <- stats::quantile(sample(singleOrFirstOfMany, t, replace = T), .95)
    }
  }
}


for(i in 1:50){
  CVdat2[i, "sd"] <- sd(CVdat2[i,2:1001])
}

CVdat2$cv <- CVdat2$sd/mean(singleOrFirstOfMany)

plot(CVdat2$cv~CVdat2$cells, ylab="cv", xlab="number of points")

text(x=200, y=0.15, "Exclosed plot\nHighly productive site (Bratsberg)")





ggdat <- data.frame(cells        = rep(seq(100, m, 100), 2),
                    trt          = rep(c("openPlot", "exclosedPlot"), each=50),
                    cv           = c(CVdat$cv,CVdat2$cv))


cvPlot <- ggplot(data = ggdat, aes(x=cells, y=cv, shape = trt, shape=trt))+
  geom_point(size=2)+
  theme_classic()+
  xlim(c(0,4000))+
  scale_shape_manual(values=c(16,21), 
                     name="",
                     breaks=c("exclosedPlot", "openPlot"),
                     labels=c("Exclosure", "Open plot"))+
  theme(legend.justification=c(1,1), legend.position=c(1,1))+
  xlab("Number of points in a random sample")

tiff("/home/anders/Documents/lidar ms/cvPlot.tiff", height = 3, width=5, units="in", res=600)
cvPlot
dev.off()


