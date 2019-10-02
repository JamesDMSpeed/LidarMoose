#LidR
#install.packages("lidR")
#installed.packages("raster")
#install.packages("rasterVis")

require(lidR)
require(raster)
require(rasterVis)

#Import data
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


#Make canopy and terrain TIN models for each treatment. TIN:representation if a continous surface.
terrainmod<-grid_terrain(lidexclosure,method='knnidw',res=1)
canopymod<-grid_canopy(lidexclosure,res=1)

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
rcan<-as.raster(grid_canopy(lidclip,method='knnidw',res=0.5))
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
cellStats(rtreesex, mean)
cellStats(rtreesopen, mean)
cellStats(rtreesex, var)
cellStats(rtreesopen, var)
hist(rtreesex)
hist(rtreesopen)
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
mytheme #what is mytheme? Error: object mytheme not found
levelplot(stack1,par.settings='viridisTheme')
bwplot(stack1,ylab='Canopy height (m) at 0.5m resoltion')
