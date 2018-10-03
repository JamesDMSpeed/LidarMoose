
require(lidR)
require(raster)
require(rasterVis)

#Import clipped files
bratsberg_b <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/bratsberg_b.las')
bratsberg_ub <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/bratsberg_ub.las')

#Make canopy and terrain TIN models for each treatment. TIN:representation if a continous surface.


MySites <- c("bratsberg_b", 
             "bratsberg_ub")
MySites <- as.factor(MySites)
unique(MySites)

for(i in levels(MySites)){
  terrainmod <- grid_terrain(i,method='knnidw',res=1)
}

terrainmod <- grid_terrain(paste(bratsberg_b),                method='knnidw',res=1)
terrainmod <- grid_terrain(paste(bratsberg_b),                method='knnidw',res=1)
terrainmod <- grid_terrain(paste(bratsberg_b),                method='knnidw',res=1)
terrainmod <- grid_terrain(paste(bratsberg_gygyb),            method='knnidw',res=1)
terrainmod <- grid_terrain(paste(bratsbegugugugukukgukurg_b), method='knnidw',res=1)



canopymod<-grid_canopy(lidexclosure,res=1)