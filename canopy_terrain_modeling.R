
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
verdal_1vb_b      <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/verdal_1vb_b.las')
verdal_1vb_ub     <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/verdal_1vb_ub.las')
verdal_2vb_b      <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/verdal_2vb_b.las')
verdal_2vb_ub     <- readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Trondelag/clipped_las/verdal_2vb_ub.las')
#Telemark
drangedal1_b       <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Telemark/clipped_las/drangedal1_b.las')
drangedal1_ub      <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Telemark/clipped_las/drangedal1_ub.las')
drangedal3_b       <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Telemark/clipped_las/drangedal3_b.las')
drangedal3_ub      <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Telemark/clipped_las/drangedal3_ub.las')
drangedal4_b       <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Telemark/clipped_las/drangedal4_b.las')
drangedal4_ub      <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Telemark/clipped_las/drangedal4_ub.las')
fritsoe2_b         <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Telemark/clipped_las/fritsoe2_2FR_b.las')
fritsoe2_ub        <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Telemark/clipped_las/fritsoe2_2FR_ub.las')
fritsoe1_b         <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Telemark/clipped_las/fritsoel_1FR_b.las')
fritsoe1_ub        <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Telemark/clipped_las/fritsoel_1FR_ub.las')
fyresdal_b         <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Telemark/clipped_las/Furesdal_b.las')
fyresdal_ub        <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Telemark/clipped_las/Furesdal_ub.las')
kviteseid1_b       <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Telemark/clipped_las/kviteseid1_b.las')
kviteseid1_ub      <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Telemark/clipped_las/kviteseid1_ub.las')
kviteseid2_b       <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Telemark/clipped_las/kviteseid2_b.las')
kviteseid2_ub      <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Telemark/clipped_las/kviteseid2_ub.las')
kviteseid3_b       <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Telemark/clipped_las/kviteseid3_b.las')
kviteseid3_ub      <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Telemark/clipped_las/kviteseid3_ub.las')
n_cappelen1_b      <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Telemark/clipped_las/nome_cappelen_1_b.las')
n_cappelen1_ub     <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Telemark/clipped_las/nome_cappelen_1_ub.las')
n_cappelen2_b      <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Telemark/clipped_las/nome_cappelen_2_b.las')
n_cappelen2_ub     <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Telemark/clipped_las/nome_cappelen_2_ub.las')
notodden3_b        <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Telemark/clipped_las/notodden3_b.las')
notodden3_ub       <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Telemark/clipped_las/notodden3_ub.las')
notodden5_b        <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Telemark/clipped_las/notodden5_b.las')
notodden5_ub       <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Telemark/clipped_las/notodden5_ub.las')
notodden6_b        <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Telemark/clipped_las/notodden6_b.las')
notodden6_ub       <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Telemark/clipped_las/notodden6_ub.las')
#Hedmark and Akershus


#Make canopy and terrain TIN models for each treatment, and plot difference between canopy and terrain model

##################################### Trondelag ###################################
#Bratsberg
terrainmod_bratsberg_b  <-grid_terrain(bratsberg_b, method='knnidw',res=1)
terrainmod_bratsberg_ub <-grid_terrain(bratsberg_ub,method='knnidw',res=1)
canopymod_bratsberg_b   <-grid_canopy(bratsberg_b,res=1)
canopymod_bratsberg_ub   <-grid_canopy(bratsberg_ub,res=1)


#Resample so that they have equal extent, and plot difference
terrainmod_bratsberg_b_resampled <-resample(as.raster(terrainmod_bratsberg_b), as.raster(canopymod_bratsberg_b), method='bilinear')
canopy_diff_bratsberg_b<-(as.raster(canopymod_bratsberg_b)-terrainmod_bratsberg_b_resampled)
plot(canopy_diff_bratsberg_b)

terrainmod_bratsberg_ub_resampeled <- resample(as.raster(terrainmod_bratsberg_ub), as.raster(canopymod_bratsberg_ub, method='bilinear'))
canopy_diff_bratsberg_ub <- (as.raster(canopymod_bratsberg_ub)-terrainmod_bratsberg_ub_resampeled)
plot(canopy_diff_bratsberg_ub)

#hi_tydal
terrainmod_hi_tydal_b  <-grid_terrain(hi_tydal_b, method='knnidw',res=1)
terrainmod_hi_tydal_ub <-grid_terrain(hi_tydal_ub,method='knnidw',res=1)
canopymod_hi_tydal_b   <-grid_canopy(hi_tydal_b,res=1)
canopymod_hi_tydal_ub  <-grid_canopy(hi_tydal_ub,res=1)

terrainmod_hi_tydal_b_resampled <-resample(as.raster(terrainmod_hi_tydal_b), as.raster(canopymod_hi_tydal_b), method='bilinear')
canopy_diff_hi_tydal_b<-(as.raster(canopymod_hi_tydal_b)-terrainmod_hi_tydal_b_resampled)
plot(canopy_diff_hi_tydal_b)

terrainmod_hi_tydal_ub_resampled <-resample(as.raster(terrainmod_hi_tydal_ub), as.raster(canopymod_hi_tydal_ub), method='bilinear')
canopy_diff_hi_tydal_ub<-(as.raster(canopymod_hi_tydal_ub)-terrainmod_hi_tydal_ub_resampled)
plot(canopy_diff_hi_tydal_ub)

#Malvik
terrainmod_malvik_b  <-grid_terrain(malvik_b, method='knnidw',res=1)
terrainmod_malvik_ub <-grid_terrain(malvik_ub,method='knnidw',res=1)
canopymod_malvik_b   <-grid_canopy(malvik_b,res=1)
canopymod_malvik_ub  <-grid_canopy(malvik_ub,res=1)

terrainmod_malvik_b_resampled <-resample(as.raster(terrainmod_malvik_b), as.raster(canopymod_malvik_b), method='bilinear')
canopy_diff_malvik_b<-(as.raster(canopymod_malvik_b)-terrainmod_malvik_b_resampled)
plot(canopy_diff_malvik_b)

terrainmod_malvik_ub_resampeled <- resample(as.raster(terrainmod_malvik_ub), as.raster(canopymod_malvik_ub, method='bilinear'))
canopy_diff_malvik_ub <- (as.raster(canopymod_malvik_ub)-terrainmod_malvik_ub_resampeled)
plot(canopy_diff_malvik_ub)

# Namdalseid_1kub
terrainmod_namdalseid_1kub_b  <-grid_terrain(namdalseid_1kub_b, method='knnidw',res=1)
terrainmod_namdalseid_1kub_ub <-grid_terrain(namdalseid_1kub_ub,method='knnidw',res=1)
canopymod_namdalseid_1kub_b   <-grid_canopy(namdalseid_1kub_b,res=1)
canopymod_namdalseid_1kub_ub  <-grid_canopy(namdalseid_1kub_ub,res=1)

terrainmod_namdalseid_1kub_b_resampled <-resample(as.raster(terrainmod_namdalseid_1kub_b), as.raster(canopymod_namdalseid_1kub_b), method='bilinear')
canopy_diff_namdalseid_1kub_b<-(as.raster(canopymod_namdalseid_1kub_b)-terrainmod_namdalseid_1kub_b_resampled)
plot(canopy_diff_namdalseid_1kub_b)

terrainmod_namdalseid_1kub_ub_resampeled <- resample(as.raster(terrainmod_namdalseid_1kub_ub), as.raster(canopymod_namdalseid_1kub_ub, method='bilinear'))
canopy_diff_namdalseid_1kub_ub <- (as.raster(canopymod_namdalseid_1kub_ub)-terrainmod_namdalseid_1kub_ub_resampeled)
plot(canopy_diff_namdalseid_1kub_ub)

# Nsb Verdal
terrainmod_nsb_verdal_b  <-grid_terrain(nsb_verdal_b, method='knnidw',res=1)
terrainmod_nsb_verdal_ub <-grid_terrain(nsb_verdal_ub,method='knnidw',res=1)
canopymod_nsb_verdal_b   <-grid_canopy(nsb_verdal_b,res=1)
canopymod_nsb_verdal_ub  <-grid_canopy(nsb_verdal_ub,res=1)

terrainmod_nsb_verdal_b_resampled <-resample(as.raster(terrainmod_nsb_verdal_b), as.raster(canopymod_nsb_verdal_b), method='bilinear')
canopy_diff_nsb_verdal_b<-(as.raster(canopymod_nsb_verdal_b)-terrainmod_nsb_verdal_b_resampled)
plot(canopy_diff_nsb_verdal_b)

terrainmod_nsb_verdal_ub_resampeled <- resample(as.raster(terrainmod_nsb_verdal_ub), as.raster(canopymod_nsb_verdal_ub, method='bilinear'))
canopy_diff_nsb_verdal_ub <- (as.raster(canopymod_nsb_verdal_ub)-terrainmod_nsb_verdal_ub_resampeled)
plot(canopy_diff_nsb_verdal_ub)

# Selbu flub
terrainmod_selbu_flub_b  <-grid_terrain(selbu_flub_b, method='knnidw',res=1)
terrainmod_selbu_flub_ub <-grid_terrain(selbu_flub_ub,method='knnidw',res=1)
canopymod_selbu_flub_b   <-grid_canopy(selbu_flub_b,res=1)
canopymod_selbu_flub_ub  <-grid_canopy(selbu_flub_ub,res=1)

terrainmod_selbu_flub_b_resampled <-resample(as.raster(terrainmod_selbu_flub_b), as.raster(canopymod_selbu_flub_b), method='bilinear')
canopy_diff_selbu_flub_b<-(as.raster(canopymod_selbu_flub_b)-terrainmod_selbu_flub_b_resampled)
plot(canopy_diff_selbu_flub_b)

terrainmod_selbu_flub_ub_resampeled <- resample(as.raster(terrainmod_selbu_flub_ub), as.raster(canopymod_selbu_flub_ub, method='bilinear'))
canopy_diff_selbu_flub_ub <- (as.raster(canopymod_selbu_flub_ub)-terrainmod_selbu_flub_ub_resampeled)
plot(canopy_diff_selbu_flub_ub)

# Selbu kl
terrainmod_selbu_kl_b  <-grid_terrain(selbu_kl_b, method='knnidw',res=1)
terrainmod_selbu_kl_ub <-grid_terrain(selbu_kl_ub,method='knnidw',res=1)
canopymod_selbu_kl_b   <-grid_canopy(selbu_kl_b,res=1)
canopymod_selbu_kl_ub  <-grid_canopy(selbu_kl_ub,res=1)

terrainmod_selbu_kl_b_resampled <-resample(as.raster(terrainmod_selbu_kl_b), as.raster(canopymod_selbu_kl_b), method='bilinear')
canopy_diff_selbu_kl_b<-(as.raster(canopymod_selbu_kl_b)-terrainmod_selbu_kl_b_resampled)
plot(canopy_diff_selbu_kl_b)

terrainmod_selbu_kl_ub_resampeled <- resample(as.raster(terrainmod_selbu_kl_ub), as.raster(canopymod_selbu_kl_ub, method='bilinear'))
canopy_diff_selbu_kl_ub <- (as.raster(canopymod_selbu_kl_ub)-terrainmod_selbu_kl_ub_resampeled)
plot(canopy_diff_selbu_kl_ub)

# Selbu sl
terrainmod_selbu_sl_b  <-grid_terrain(selbu_sl_b, method='knnidw',res=1)
terrainmod_selbu_sl_ub <-grid_terrain(selbu_sl_ub,method='knnidw',res=1)
canopymod_selbu_sl_b   <-grid_canopy(selbu_sl_b,res=1)
canopymod_selbu_sl_ub  <-grid_canopy(selbu_sl_ub,res=1)

terrainmod_selbu_sl_b_resampled <-resample(as.raster(terrainmod_selbu_sl_b), as.raster(canopymod_selbu_sl_b), method='bilinear')
canopy_diff_selbu_sl_b<-(as.raster(canopymod_selbu_sl_b)-terrainmod_selbu_sl_b_resampled)
plot(canopy_diff_selbu_sl_b)

terrainmod_selbu_sl_ub_resampeled <- resample(as.raster(terrainmod_selbu_sl_ub), as.raster(canopymod_selbu_sl_ub, method='bilinear'))
canopy_diff_selbu_sl_ub <- (as.raster(canopymod_selbu_sl_ub)-terrainmod_selbu_sl_ub_resampeled)
plot(canopy_diff_selbu_sl_ub)

# Singsaas
terrainmod_singsaas_b  <-grid_terrain(singsaas_b, method='knnidw',res=1)
terrainmod_singsaas_ub <-grid_terrain(singsaas_ub,method='knnidw',res=1)
canopymod_singsaas_b   <-grid_canopy(singsaas_b,res=1)
canopymod_singsaas_ub  <-grid_canopy(singsaas_ub,res=1)

terrainmod_singsaas_b_resampled <-resample(as.raster(terrainmod_singsaas_b), as.raster(canopymod_singsaas_b), method='bilinear')
canopy_diff_singsaas_b<-(as.raster(canopymod_singsaas_b)-terrainmod_singsaas_b_resampled)
plot(canopy_diff_singsaas_b)

terrainmod_singsaas_ub_resampeled <- resample(as.raster(terrainmod_singsaas_ub), as.raster(canopymod_singsaas_ub, method='bilinear'))
canopy_diff_singsaas_ub <- (as.raster(canopymod_singsaas_ub)-terrainmod_singsaas_ub_resampeled)
plot(canopy_diff_singsaas_ub)

# sl_tydal
terrainmod_sl_tydal_b  <-grid_terrain(sl_tydal_b, method='knnidw',res=1)
terrainmod_sl_tydal_ub <-grid_terrain(sl_tydal_ub,method='knnidw',res=1)
canopymod_sl_tydal_b   <-grid_canopy(sl_tydal_b,res=1)
canopymod_sl_tydal_ub  <-grid_canopy(sl_tydal_ub,res=1)

terrainmod_sl_tydal_b_resampled <-resample(as.raster(terrainmod_sl_tydal_b), as.raster(canopymod_sl_tydal_b), method='bilinear')
canopy_diff_sl_tydal_b<-(as.raster(canopymod_sl_tydal_b)-terrainmod_sl_tydal_b_resampled)
plot(canopy_diff_sl_tydal_b)

terrainmod_sl_tydal_ub_resampeled <- resample(as.raster(terrainmod_sl_tydal_ub), as.raster(canopymod_sl_tydal_ub, method='bilinear'))
canopy_diff_sl_tydal_ub <- (as.raster(canopymod_sl_tydal_ub)-terrainmod_sl_tydal_ub_resampeled)
plot(canopy_diff_sl_tydal_ub)

# Steinkjer 1BBb
terrainmod_steinkjer_1BBb_b  <-grid_terrain(steinkjer_1BBb_b, method='knnidw',res=1)
terrainmod_steinkjer_1BBb_ub <-grid_terrain(steinkjer_1BBb_ub,method='knnidw',res=1)
canopymod_steinkjer_1BBb_b   <-grid_canopy(steinkjer_1BBb_b,res=1)
canopymod_steinkjer_1BBb_ub  <-grid_canopy(steinkjer_1BBb_ub,res=1)

terrainmod_steinkjer_1BBb_b_resampled <-resample(as.raster(terrainmod_steinkjer_1BBb_b), as.raster(canopymod_steinkjer_1BBb_b), method='bilinear')
canopy_diff_steinkjer_1BBb_b<-(as.raster(canopymod_steinkjer_1BBb_b)-terrainmod_steinkjer_1BBb_b_resampled)
plot(canopy_diff_steinkjer_1BBb_b)

terrainmod_steinkjer_1BBb_ub_resampeled <- resample(as.raster(terrainmod_steinkjer_1BBb_ub), as.raster(canopymod_steinkjer_1BBb_ub, method='bilinear'))
canopy_diff_steinkjer_1BBb_ub <- (as.raster(canopymod_steinkjer_1BBb_ub)-terrainmod_steinkjer_1BBb_ub_resampeled)
plot(canopy_diff_steinkjer_1BBb_ub)

# Steinkjer 2BBb
terrainmod_steinkjer_2BBb_b  <-grid_terrain(steinkjer_2BBb_b, method='knnidw',res=1)
terrainmod_steinkjer_2BBb_ub <-grid_terrain(steinkjer_2BBb_ub,method='knnidw',res=1)
canopymod_steinkjer_2BBb_b   <-grid_canopy(steinkjer_2BBb_b,res=1)
canopymod_steinkjer_2BBb_ub  <-grid_canopy(steinkjer_2BBb_ub,res=1)

terrainmod_steinkjer_2BBb_b_resampled <-resample(as.raster(terrainmod_steinkjer_2BBb_b), as.raster(canopymod_steinkjer_2BBb_b), method='bilinear')
canopy_diff_steinkjer_2BBb_b<-(as.raster(canopymod_steinkjer_2BBb_b)-terrainmod_steinkjer_2BBb_b_resampled)
plot(canopy_diff_steinkjer_2BBb_b)

terrainmod_steinkjer_2BBb_ub_resampeled <- resample(as.raster(terrainmod_steinkjer_2BBb_ub), as.raster(canopymod_steinkjer_2BBb_ub, method='bilinear'))
canopy_diff_steinkjer_2BBb_ub <- (as.raster(canopymod_steinkjer_2BBb_ub)-terrainmod_steinkjer_2BBb_ub_resampeled)
plot(canopy_diff_steinkjer_2BBb_ub)

# sub_namdalseid
terrainmod_sub_namdalseid_b  <-grid_terrain(sub_namdalseid_b, method='knnidw',res=1)
terrainmod_sub_namdalseid_ub <-grid_terrain(sub_namdalseid_ub,method='knnidw',res=1)
canopymod_sub_namdalseid_b   <-grid_canopy(sub_namdalseid_b,res=1)
canopymod_sub_namdalseid_ub  <-grid_canopy(sub_namdalseid_ub,res=1)

terrainmod_sub_namdalseid_b_resampled <-resample(as.raster(terrainmod_sub_namdalseid_b), as.raster(canopymod_sub_namdalseid_b), method='bilinear')
canopy_diff_sub_namdalseid_b<-(as.raster(canopymod_sub_namdalseid_b)-terrainmod_sub_namdalseid_b_resampled)
plot(canopy_diff_sub_namdalseid_b)

terrainmod_sub_namdalseid_ub_resampeled <- resample(as.raster(terrainmod_sub_namdalseid_ub), as.raster(canopymod_sub_namdalseid_ub, method='bilinear'))
canopy_diff_sub_namdalseid_ub <- (as.raster(canopymod_sub_namdalseid_ub)-terrainmod_sub_namdalseid_ub_resampeled)
plot(canopy_diff_sub_namdalseid_ub)

# verdal_1vb
terrainmod_verdal_1vb_b  <-grid_terrain(verdal_1vb_b, method='knnidw',res=1)
terrainmod_verdal_1vb_ub <-grid_terrain(verdal_1vb_ub,method='knnidw',res=1)
canopymod_verdal_1vb_b   <-grid_canopy(verdal_1vb_b,res=1)
canopymod_verdal_1vb_ub  <-grid_canopy(verdal_1vb_ub,res=1)

terrainmod_verdal_1vb_b_resampled <-resample(as.raster(terrainmod_verdal_1vb_b), as.raster(canopymod_verdal_1vb_b), method='bilinear')
canopy_diff_verdal_1vb_b<-(as.raster(canopymod_verdal_1vb_b)-terrainmod_verdal_1vb_b_resampled)
plot(canopy_diff_verdal_1vb_b)

terrainmod_verdal_1vb_ub_resampeled <- resample(as.raster(terrainmod_verdal_1vb_ub), as.raster(canopymod_verdal_1vb_ub, method='bilinear'))
canopy_diff_verdal_1vb_ub <- (as.raster(canopymod_verdal_1vb_ub)-terrainmod_verdal_1vb_ub_resampeled)
plot(canopy_diff_verdal_1vb_ub)

# Verdal_2vb
terrainmod_verdal_2vb_b  <-grid_terrain(verdal_2vb_b, method='knnidw',res=1)
terrainmod_verdal_2vb_ub <-grid_terrain(verdal_2vb_ub,method='knnidw',res=1)
canopymod_verdal_2vb_b   <-grid_canopy(verdal_2vb_b,res=1)
canopymod_verdal_2vb_ub  <-grid_canopy(verdal_2vb_ub,res=1)

terrainmod_verdal_2vb_b_resampled <-resample(as.raster(terrainmod_verdal_2vb_b), as.raster(canopymod_verdal_2vb_b), method='bilinear')
canopy_diff_verdal_2vb_b<-(as.raster(canopymod_verdal_2vb_b)-terrainmod_verdal_2vb_b_resampled)
plot(canopy_diff_verdal_2vb_b)

terrainmod_verdal_2vb_ub_resampeled <- resample(as.raster(terrainmod_verdal_2vb_ub), as.raster(canopymod_verdal_2vb_ub, method='bilinear'))
canopy_diff_verdal_2vb_ub <- (as.raster(canopymod_verdal_2vb_ub)-terrainmod_verdal_2vb_ub_resampeled)
plot(canopy_diff_verdal_2vb_ub)


################################## Telemark #############################


