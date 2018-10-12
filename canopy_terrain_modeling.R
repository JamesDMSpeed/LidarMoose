
require(lidR)
require(raster)
require(rasterVis)

#Import clipped files
bratsberg_b <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/bratsberg_b.las')
bratsberg_ub <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/bratsberg_ub.las')

#Make canopy and terrain TIN models for each treatment. TIN:representation of a continous surface.


#MySites <- c("bratsberg_b", 
             "bratsberg_ub")
#MySites <- as.factor(MySites)
#unique(MySites)

#for(i in levels(MySites)){
#  terrainmod <- grid_terrain(i,method='knnidw',res=1)
#}

#Manuelt for hvert område
terrainmod_bratsberg_b  <-grid_terrain(bratsberg_b, method='knnidw',res=1)
terrainmod_bratsberg_ub <-grid_terrain(bratsberg_ub,method='knnidw',res=1)


canopymod_bratsberg_b   <-grid_canopy(bratsberg_b,res=1)
canopymo_bratsberg_ub   <-grid_canopy(bratsberg_ub,res=1)

