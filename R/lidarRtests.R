#LidR
#install.packages("lidR")
#installed.packages("raster")
#install.packages("rasterVis")

require(lidR)
require(raster)
require(rasterVis)


#Import data
#Clips of area around Bratsberg exclosure sites. Converted from laz to las using laszip.exe
#Trondheim 2010 data
#lidtest<-readLAS('S:\\Anders Kolstad\\lidar\\225\\data\\32-2-511-213-22.las')
#lidtest
#plot(lidtest)
#lasground(lidtest,'pmf')

#Exclosure site - 2014 data
#lidtest2<-readLAS('S:\\Anders Kolstad\\lidar\\Trondheim2014\\data\\32-1-511-213-45.las')
#lidtest2<-readLAS('LidarTest\\32-1-511-213-45.las')
# plot(lidtest2)
# plot(lidtest2,trim=0.9)#Omit highest 10% of records in colour scheme (birds)
# 
# #Test Clip
# lidclip<-lasclipRectangle(lidtest2,573600,7025400,574000,7026000)
# lidclip<-lasclipRectangle(lidtest2,573600,7025660,573800,7025800)
# plot(lidclip)
# #Remove erroneous points far below surface
# lidclip@data$Z[lidclip@data$clip<226]<-NA
# plot(lidclip,colorPalette = heat.colors(50))
# 
#writeLAS(lidclip,'LidarTest\\ClippedBratsberg.las')
lidclip<-readLAS('LidarTest\\ClippedBratsberg.las')
lidclip
#Set coordinate reference system
crs(lidclip)<-'+init=epsg:25832 +proj=utm +zone=32 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs' 
lidclip
plot(lidclip)

#Clip to exclosure and open plots
#lidexclosure<-lasclipRectangle(lidtest2,573675,7025681,573695,7025701)
lidexclosure<-lasclipRectangle(lidclip,573675,7025681,573695,7025701)
plot(lidexclosure)
#plot(lidexclosure,trim=0.9)
#lidopen<-lasclipRectangle(lidtest2,573751,7025718,573771,7025738)
lidopen<-lasclipRectangle(lidclip,573751,7025718,573771,7025738)
plot(lidopen)

#Remove the tallest trees, but this is done only for exclosure here? 
lidex1<-lidexclosure
hist(lidexclosure@data$Z)
#Does the line above extract the z-coordinate data from lidexclosure? 
lidex1@data[lidex1@data$Z>245]<-NA
#Make all of the tree heights larger than 245 NA?
plot(lidex1)

#Make canopy and terrain TIN models for each treatment. TIN:representation if a continous surface.
terrainmod<-grid_terrain(lidexclosure,method='knnidw',res=1)
canopymod<-grid_canopy(lidexclosure,res=1)
plot(canopymod-terrainmod)#Error
#Merge together based on X and Y coordinates
mergedf<-merge(terrainmod,canopymod,by=c('X','Y'))
mergedf$Canopy<-mergedf$Z.y-mergedf$Z.x
plot3d(mergedf$X,mergedf$Y,mergedf$Canopy) #error: object not supported

gfex<-grid_metrics3d(lidexclosure,func=max(Z)-min(Z),res=1)
gfopen<-grid_metrics3d(lidopen,func=max(Z)-min(Z),res=1)

plot(grid_terrain(lidclip,method='knnidw',res=1))
plot(grid_canopy(lidclip,res=1))

#Higher resolution
rterr<-as.raster(grid_terrain(lidclip,method='knnidw',res=0.5))
rcan<-as.raster(grid_canopy(lidclip,res=0.5))
plot(rcan-crop(rterr,rcan))
rtrees<-rcan-crop(rterr,rcan)
plot3d(rtrees)

#Exclosure
rterrex<-as.raster(grid_terrain(lidexclosure,method='knnidw',res=0.5))
rcanex<-as.raster(grid_canopy(lidexclosure,res=0.5))
plot(rcanex-crop(rterrex,rcanex))
rtreesex<-rcanex-crop(rterrex,rcanex)
plot3d(rtreesex)

#Open plot
rterropen<-as.raster(grid_terrain(lidopen,method='knnidw',res=0.5))
rcanopen<-as.raster(grid_canopy(lidopen,res=0.5))
plot(rcanopen-crop(rterropen,rcanopen))
rtreesopen<-rcanopen-crop(rterropen,rcanopen)
plot3d(rtreesopen)

#Remove preexisting trees (>7m)
rtreesex[rtreesex>7]<-NA
rtreesopen[rtreesopen>7]<-NA
plot(rtreesex)
plot(rtreesopen)
cellStats(rtreesex,median)
cellStats(rtreesopen,median)
par(mfrow=c(1,2))
par(mar=c(5,5,3,1))
boxplot(rtreesex,ylim=c(0,7),main='Exclosure',ylab='Canopy height at 0.5m resolution')
boxplot(rtreesopen,ylim=c(0,7),main='Open')

rex<-rtreesex
rop<-rtreesopen
extent(rex)<-c(0,20,0,20)
extent(rop)<-c(0,20,0,20)
rex
rop
r2 <- extend(rex,rop)
r2
stack1<-stack(rex,rop)
names(stack1)<-c('Exclosure','Open')
mytheme #whats mytheme? Error: object mytheme not found
levelplot(stack1,par.settings='viridisTheme')
bwplot(stack1,ylab='Canopy height (m) at 0.5m resoltion')


