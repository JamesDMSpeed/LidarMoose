
require(lidR)
require(raster)
require(rasterVis)

#Import clipped files
#Trondelag
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
selbu_flub_b      <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/selbu_flub_b.las')
selbu_flub_ub     <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/selbu_flub_ub.las')
selbu_kl_b        <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/selbu_kl_b.las')
selbu_kl_ub       <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/selbu_kl_ub.las')
selbu_sl_b        <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/selbu_sl_b.las')
selbu_sl_ub       <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/selbu_sl_ub.las')
singsaas_b        <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/singsaas_b.las')
singsaas_ub       <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/singsaas_ub.las')
sl_tydal_b        <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/sl_tydal_b.las')
sl_tydal_ub       <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/sl_tydal_ub.las')
steinkjer_1BBb_b  <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/steinkjer_1BBb_b.las')
steinkjer_1BBb_ub <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/steinkjer_1BBb_ub.las')
steinkjer_2BBb_b  <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/steinkjer_2BBb_b.las')
steinkjer_2BBb_ub <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/steinkjer_2BBb_ub.las')
sub_namdalseid_b  <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/sub_namdalseid_b.las')
sub_namdalseid_ub <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/sub_namdalseid_ub.las')
verdal_1vb_b <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/verdal_1vb_b.las')
verdal_1vb_ub <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/verdal_1vb_ub.las')
verdal_2vb_b <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/verdal_2vb_b.las')
verdal_2vb_ub <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/verdal_2vb_ub.las')




#Make canopy and terrain TIN models for each treatment. TIN:representation of a continous surface.

terrainmod_bratsberg_b  <-grid_terrain(bratsberg_b, method='knnidw',res=1)
terrainmod_bratsberg_ub <-grid_terrain(bratsberg_ub,method='knnidw',res=1)
plot(terrainmod_bratsberg_b)
plot(terrainmod_bratsberg_ub)
canopymod_bratsberg_b   <-grid_canopy(bratsberg_b,res=1)
canopymod_bratsberg_ub   <-grid_canopy(bratsberg_ub,res=1)
plot(canopymod_bratsberg_b)
plot(canopymo_bratsberg_ub)
