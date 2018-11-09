
require(lidR)
require(raster)
require(rasterVis)

#Import clipped files
bratsberg_b       <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/bratsberg_b.las')
bratsberg_ub      <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/bratsberg_ub.las')
hi_tydal_b        <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/hi_tydal_b.las')
hi_tydal_ub       <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/hi_tydal_ub.las')
malvik_b          <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/malvik_b.las')
malvik_ub         <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/malvik_ub.las')
namdalseid_1kub_b <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/namdalseid_1kub_b.las')
namdalseid_1kub_ub<- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/namdalseid_1kub_ub.las')
nsb_verdal_b      <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/nsb_verdal_b.las')
nsb_verdal_ub     <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/nsb_verdal_ub.las')






#Make canopy and terrain TIN models for each treatment. TIN:representation of a continous surface.

terrainmod_bratsberg_b  <-grid_terrain(bratsberg_b_plot, method='knnidw',res=1)
terrainmod_bratsberg_ub <-grid_terrain(bratsberg_ub_plot,method='knnidw',res=1)
plot(terrainmod_bratsberg_b)
plot(terrainmod_bratsberg_ub)
canopymod_bratsberg_b   <-grid_canopy(bratsberg_b_plot,res=1)
canopymod_bratsberg_ub   <-grid_canopy(bratsberg_ub_plot,res=1)
plot(canopymod_bratsberg_b)
plot(canopymo_bratsberg_ub)
