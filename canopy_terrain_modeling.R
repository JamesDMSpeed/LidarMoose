# TOP ####

require(lidR)
require(raster)
require(rasterVis)


# Import clipped files ----------------------------------------------------
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
didrik_holmsen_b   <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Hedmark_Akershus/clipped_las/didrik_holmsen_b.las')
didrik_holmsen_ub  <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Hedmark_Akershus/clipped_las/didrik_holmsen_ub.las')
eidskog_b          <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Hedmark_Akershus/clipped_las/eidskog_b.las')
eidskog_ub         <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Hedmark_Akershus/clipped_las/eidskog_ub.las')
fet3_b             <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Hedmark_Akershus/clipped_las/fet3_b.las')
fet3_ub            <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Hedmark_Akershus/clipped_las/fet3_ub.las')
h_pramhus_b        <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Hedmark_Akershus/clipped_las/halvard_pramhus_b.las')
h_pramhus_ub       <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Hedmark_Akershus/clipped_las/halvard_pramhus_ub.las')
stangesk_aurskog_b <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Hedmark_Akershus/clipped_las/stangeskovene_aurskog_b.las')
stangesk_aurskog_ub<-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Hedmark_Akershus/clipped_las/stangeskovene_aurskog_ub.las')
stangesk_eidskog_b <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Hedmark_Akershus/clipped_las/stangeskovene_eidskog_b.las')
stangesk_eidskog_ub<-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Hedmark_Akershus/clipped_las/stangeskovene_eidskog_ub.las')
stig_dahlen_b      <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Hedmark_Akershus/clipped_las/stig_dahlen_b.las')
stig_dahlen_ub     <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Hedmark_Akershus/clipped_las/stig_dahlen_ub.las')
truls_holm_b      <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Hedmark_Akershus/clipped_las/truls_holm_b.las')
truls_holm_ub     <-readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose/Hedmark_Akershus/clipped_las/truls_holm_ub.las')



# Threshold ---------------------------------------------------------------


threshold <-7





# Trøndelag ---------------------------------------------------------------


# Bratsberg ---------------------------------------------------------------
 
#Bratsberg_b
terrainmod_bratsberg_b  <-grid_terrain(bratsberg_b, method='knnidw',res=1)
canopymod_bratsberg_b   <-grid_canopy(bratsberg_b,res=1)


#Resample so that they have equal extent, and plot difference
terrainmod_bratsberg_b_resampled <-resample(as.raster(terrainmod_bratsberg_b), as.raster(canopymod_bratsberg_b), method='bilinear')
canopy_diff_bratsberg_b<-(as.raster(canopymod_bratsberg_b)-terrainmod_bratsberg_b_resampled)
plot(canopy_diff_bratsberg_b)

#Remove large trees, first detect and create treeID
trees_bratsberg_b<-tree_detection(bratsberg_b,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_bratsberg_b<-extract(canopy_diff_bratsberg_b,trees_bratsberg_b[,1:2])

lastrees_dalponte(bratsberg_b,canopy_diff_bratsberg_b,trees_bratsberg_b[treeheight_bratsberg_b>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

#Make hulls around the trees
treeout_bratsberg_b<-tree_hulls(bratsberg_b,type='convex',field='treeID')
plot(canopy_diff_bratsberg_b)
plot(treeout_bratsberg_b,add=T) 

bigtrees_bratsberg_b<-which(extract(canopy_diff_bratsberg_b,treeout_bratsberg_b,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

bratsberg_b_clip<-lasclip(bratsberg_b,treeout_bratsberg_b@polygons[[bigtrees_bratsberg_b[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_bratsberg_b)){
  print(i)
  bratsberg_b_clip<-lasclip(bratsberg_b_clip,treeout_bratsberg_b@polygons[[bigtrees_bratsberg_b[i]]]@Polygons[[1]],inside=F)}
plot(bratsberg_b_clip) #point cloud without large trees

canopy_diff_bratsberg_b_clip <- (as.raster(grid_canopy(bratsberg_b_clip,res=0.5))-(crop(as.raster(grid_terrain(bratsberg_b_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(bratsberg_b_clip,res=0.5)))))
plot(canopy_diff_bratsberg_b_clip)

writeRaster(canopy_diff_bratsberg_b_clip,'Trondelag/canopy_height_clipped_raster/bratsberg_b_canopyheight')

 #Bratsberg_ub
terrainmod_bratsberg_ub <-grid_terrain(bratsberg_ub,method='knnidw',res=1)
canopymod_bratsberg_ub   <-grid_canopy(bratsberg_ub,res=1)

terrainmod_bratsberg_ub_resampeled <- resample(as.raster(terrainmod_bratsberg_ub), as.raster(canopymod_bratsberg_ub, method='bilinear'))
canopy_diff_bratsberg_ub <- (as.raster(canopymod_bratsberg_ub)-terrainmod_bratsberg_ub_resampeled)
plot(canopy_diff_bratsberg_ub)

#Remove large trees, first detect and create treeID
trees_bratsberg_ub<-tree_detection(bratsberg_ub,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_bratsberg_ub<-extract(canopy_diff_bratsberg_ub,trees_bratsberg_ub[,1:2])

lastrees_dalponte(bratsberg_ub,canopy_diff_bratsberg_ub,trees_bratsberg_ub[treeheight_bratsberg_ub>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

#Make hulls around the trees
treeout_bratsberg_ub<-tree_hulls(bratsberg_ub,type='convex',field='treeID')
plot(canopy_diff_bratsberg_ub)
plot(treeout_bratsberg_ub,add=T) 

bigtrees_bratsberg_ub<-which(extract(canopy_diff_bratsberg_ub,treeout_bratsberg_ub,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

bratsberg_ub_clip<-lasclip(bratsberg_ub,treeout_bratsberg_ub@polygons[[bigtrees_bratsberg_ub[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_bratsberg_ub)){
  print(i)
  bratsberg_ub_clip<-lasclip(bratsberg_ub_clip,treeout_bratsberg_ub@polygons[[bigtrees_bratsberg_ub[i]]]@Polygons[[1]],inside=F)}
plot(bratsberg_ub_clip) #point cloud without large trees

#error when running the for loop here: in is(geometry, "Polygon") : 
#trying to get slot "Polygons" from an object of a basic class ("NULL") with no slots -BUT it looks correct

canopy_diff_bratsberg_ub_clip <- (as.raster(grid_canopy(bratsberg_ub_clip,res=0.5))-(crop(as.raster(grid_terrain(bratsberg_ub_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(bratsberg_ub_clip,res=0.5)))))
plot(canopy_diff_bratsberg_ub_clip)


writeRaster(canopy_diff_bratsberg_ub_clip,'Trondelag/canopy_height_clipped_raster/bratsberg_ub_canopyheight')


# Hi_tydal ----------------------------------------------------------------

#Hi_tydal_b
terrainmod_hi_tydal_b  <-grid_terrain(hi_tydal_b, method='knnidw',res=1)
canopymod_hi_tydal_b   <-grid_canopy(hi_tydal_b,res=1)

terrainmod_hi_tydal_b_resampled <-resample(as.raster(terrainmod_hi_tydal_b), as.raster(canopymod_hi_tydal_b), method='bilinear')
canopy_diff_hi_tydal_b<-(as.raster(canopymod_hi_tydal_b)-terrainmod_hi_tydal_b_resampled)
plot(canopy_diff_hi_tydal_b)
#see that the largest trees are 3,5m high,
#unlikely that they left so small trees standing when clear cutting. Conclude: no old trees standing

writeRaster(canopy_diff_hi_tydal_b,'Trondelag/canopy_height_clipped_raster/hi_tydal_b_canopyheight')


#Hi_tydal_ub
terrainmod_hi_tydal_ub <-grid_terrain(hi_tydal_ub,method='knnidw',res=1)
canopymod_hi_tydal_ub  <-grid_canopy(hi_tydal_ub,res=1)

terrainmod_hi_tydal_ub_resampled <-resample(as.raster(terrainmod_hi_tydal_ub), as.raster(canopymod_hi_tydal_ub), method='bilinear')
canopy_diff_hi_tydal_ub<-(as.raster(canopymod_hi_tydal_ub)-terrainmod_hi_tydal_ub_resampled)
plot(canopy_diff_hi_tydal_ub)

trees_hi_tydal_ub<-tree_detection(hi_tydal_ub,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_hi_tydal_ub<-extract(canopy_diff_hi_tydal_ub,trees_hi_tydal_ub[,1:2])

lastrees_dalponte(hi_tydal_ub,canopy_diff_hi_tydal_ub,trees_hi_tydal_ub[treeheight_hi_tydal_ub>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_hi_tydal_ub<-tree_hulls(hi_tydal_ub,type='convex',field='treeID')
plot(canopy_diff_hi_tydal_ub)
plot(treeout_hi_tydal_ub,add=T) 

bigtrees_hi_tydal_ub<-which(extract(canopy_diff_hi_tydal_ub,treeout_hi_tydal_ub,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

hi_tydal_ub_clip<-lasclip(hi_tydal_ub,treeout_hi_tydal_ub@polygons[[bigtrees_hi_tydal_ub[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_hi_tydal_ub)){
  print(i)
  hi_tydal_ub_clip<-lasclip(hi_tydal_ub_clip,treeout_hi_tydal_ub@polygons[[bigtrees_hi_tydal_ub[i]]]@Polygons[[1]],inside=F)}
plot(hi_tydal_ub_clip) #point cloud without large trees

canopy_diff_hi_tydal_ub_clip <- (as.raster(grid_canopy(hi_tydal_ub_clip,res=0.5))-(crop(as.raster(grid_terrain(hi_tydal_ub_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(hi_tydal_ub_clip,res=0.5)))))
plot(canopy_diff_hi_tydal_ub_clip)

writeRaster(canopy_diff_hi_tydal_ub_clip,'Trondelag/canopy_height_clipped_raster/hi_tydal_ub_canopyheight')


# Malvik ------------------------------------------------------------------

#Malvik_b

terrainmod_malvik_b  <-grid_terrain(malvik_b, method='knnidw',res=1)
canopymod_malvik_b   <-grid_canopy(malvik_b,res=1)

terrainmod_malvik_b_resampled <-resample(as.raster(terrainmod_malvik_b), as.raster(canopymod_malvik_b), method='bilinear')
canopy_diff_malvik_b<-(as.raster(canopymod_malvik_b)-terrainmod_malvik_b_resampled)
plot(canopy_diff_malvik_b)

cellStats(canopy_diff_malvik_b,'max') #no trees over 7 m, so no need remove trees 


writeRaster(canopy_diff_malvik_b,'Trondelag/canopy_height_clipped_raster/malvik_b_canopyheight')



#Malvik_ub
terrainmod_malvik_ub <-grid_terrain(malvik_ub,method='knnidw',res=1)
canopymod_malvik_ub  <-grid_canopy(malvik_ub,res=1)

terrainmod_malvik_ub_resampeled <- resample(as.raster(terrainmod_malvik_ub), as.raster(canopymod_malvik_ub, method='bilinear'))
canopy_diff_malvik_ub <- (as.raster(canopymod_malvik_ub)-terrainmod_malvik_ub_resampeled)
plot(canopy_diff_malvik_ub)

canopy_diff_malvik_ub # no trees over 7 m

writeRaster(canopy_diff_malvik_ub,'Trondelag/canopy_height_clipped_raster/malvik_ub_canopyheight')



# Namdalseid_1kub ---------------------------------------------------------

# Namdalseid_1kub_b
terrainmod_namdalseid_1kub_b  <-grid_terrain(namdalseid_1kub_b, method='knnidw',res=1)
canopymod_namdalseid_1kub_b   <-grid_canopy(namdalseid_1kub_b,res=1)

terrainmod_namdalseid_1kub_b_resampled <-resample(as.raster(terrainmod_namdalseid_1kub_b), as.raster(canopymod_namdalseid_1kub_b), method='bilinear')
canopy_diff_namdalseid_1kub_b<-(as.raster(canopymod_namdalseid_1kub_b)-terrainmod_namdalseid_1kub_b_resampled)
plot(canopy_diff_namdalseid_1kub_b)

trees_namdalseid_1kub_b<-tree_detection(namdalseid_1kub_b,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_namdalseid_1kub_b<-extract(canopy_diff_namdalseid_1kub_b,trees_namdalseid_1kub_b[,1:2])

lastrees_dalponte(namdalseid_1kub_b,canopy_diff_namdalseid_1kub_b,trees_namdalseid_1kub_b[treeheight_namdalseid_1kub_b>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_namdalseid_1kub_b<-tree_hulls(namdalseid_1kub_b,type='convex',field='treeID')
plot(canopy_diff_namdalseid_1kub_b)
plot(treeout_namdalseid_1kub_b,add=T) 

bigtrees_namdalseid_1kub_b<-which(extract(canopy_diff_namdalseid_1kub_b,treeout_namdalseid_1kub_b,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

namdalseid_1kub_b_clip<-lasclip(namdalseid_1kub_b,treeout_namdalseid_1kub_b@polygons[[bigtrees_namdalseid_1kub_b[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_namdalseid_1kub_b)){
  print(i)
  namdalseid_1kub_b_clip<-lasclip(namdalseid_1kub_b_clip,treeout_namdalseid_1kub_b@polygons[[bigtrees_namdalseid_1kub_b[i]]]@Polygons[[1]],inside=F)}
plot(namdalseid_1kub_b_clip) 

canopy_diff_namdalseid_1kub_b_clip <- (as.raster(grid_canopy(namdalseid_1kub_b_clip,res=0.5))-(crop(as.raster(grid_terrain(namdalseid_1kub_b_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(namdalseid_1kub_b_clip,res=0.5)))))
plot(canopy_diff_namdalseid_1kub_b_clip)

writeRaster(canopy_diff_namdalseid_1kub_b_clip,'Trondelag/canopy_height_clipped_raster/namdalseid_1kub_b_canopyheight')




# Namdalseid_1kub_ub
terrainmod_namdalseid_1kub_ub <-grid_terrain(namdalseid_1kub_ub,method='knnidw',res=1)
canopymod_namdalseid_1kub_ub  <-grid_canopy(namdalseid_1kub_ub,res=1)


terrainmod_namdalseid_1kub_ub_resampeled <- resample(as.raster(terrainmod_namdalseid_1kub_ub), as.raster(canopymod_namdalseid_1kub_ub, method='bilinear'))
canopy_diff_namdalseid_1kub_ub <- (as.raster(canopymod_namdalseid_1kub_ub)-terrainmod_namdalseid_1kub_ub_resampeled)
plot(canopy_diff_namdalseid_1kub_ub)

trees_namdalseid_1kub_ub<-tree_detection(namdalseid_1kub_ub,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_namdalseid_1kub_ub<-extract(canopy_diff_namdalseid_1kub_ub,trees_namdalseid_1kub_ub[,1:2])

lastrees_dalponte(namdalseid_1kub_ub,canopy_diff_namdalseid_1kub_ub,trees_namdalseid_1kub_ub[treeheight_namdalseid_1kub_ub>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_namdalseid_1kub_ub<-tree_hulls(namdalseid_1kub_ub,type='convex',field='treeID')
plot(canopy_diff_namdalseid_1kub_ub)
plot(treeout_namdalseid_1kub_ub,add=T) 

bigtrees_namdalseid_1kub_ub<-which(extract(canopy_diff_namdalseid_1kub_ub,treeout_namdalseid_1kub_ub,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

namdalseid_1kub_ub_clip<-lasclip(namdalseid_1kub_ub,treeout_namdalseid_1kub_ub@polygons[[bigtrees_namdalseid_1kub_ub[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_namdalseid_1kub_ub)){
  print(i)
  namdalseid_1kub_ub_clip<-lasclip(namdalseid_1kub_ub_clip,treeout_namdalseid_1kub_ub@polygons[[bigtrees_namdalseid_1kub_ub[i]]]@Polygons[[1]],inside=F)}
plot(namdalseid_1kub_ub_clip) 

canopy_diff_namdalseid_1kub_ub_clip <- (as.raster(grid_canopy(namdalseid_1kub_ub_clip,res=0.5))-(crop(as.raster(grid_terrain(namdalseid_1kub_ub_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(namdalseid_1kub_ub_clip,res=0.5)))))
plot(canopy_diff_namdalseid_1kub_ub_clip)

writeRaster(canopy_diff_namdalseid_1kub_ub_clip,'Trondelag/canopy_height_clipped_raster/namdalseid_1kub_ub_canopyheight')




# Nsb_verdal --------------------------------------------------------------


# Nsb Verdal_b
terrainmod_nsb_verdal_b  <-grid_terrain(nsb_verdal_b, method='knnidw',res=1)
canopymod_nsb_verdal_b   <-grid_canopy(nsb_verdal_b,res=1)

terrainmod_nsb_verdal_b_resampled <-resample(as.raster(terrainmod_nsb_verdal_b), as.raster(canopymod_nsb_verdal_b), method='bilinear')
canopy_diff_nsb_verdal_b<-(as.raster(canopymod_nsb_verdal_b)-terrainmod_nsb_verdal_b_resampled)
plot(canopy_diff_nsb_verdal_b)
canopy_diff_nsb_verdal_b #max value 0,56

writeRaster(canopy_diff_nsb_verdal_b,'Trondelag/canopy_height_clipped_raster/nsb_verdal_b_canopyheight')


# Nsb Verdal_ub
terrainmod_nsb_verdal_ub <-grid_terrain(nsb_verdal_ub,method='knnidw',res=1)
canopymod_nsb_verdal_ub  <-grid_canopy(nsb_verdal_ub,res=1)

terrainmod_nsb_verdal_ub_resampeled <- resample(as.raster(terrainmod_nsb_verdal_ub), as.raster(canopymod_nsb_verdal_ub, method='bilinear'))
canopy_diff_nsb_verdal_ub <- (as.raster(canopymod_nsb_verdal_ub)-terrainmod_nsb_verdal_ub_resampeled)
plot(canopy_diff_nsb_verdal_ub)

trees_nsb_verdal_ub<-tree_detection(nsb_verdal_ub,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_nsb_verdal_ub<-extract(canopy_diff_nsb_verdal_ub,trees_nsb_verdal_ub[,1:2])

lastrees_dalponte(nsb_verdal_ub,canopy_diff_nsb_verdal_ub,trees_nsb_verdal_ub[treeheight_nsb_verdal_ub>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_nsb_verdal_ub<-tree_hulls(nsb_verdal_ub,type='convex',field='treeID')
plot(canopy_diff_nsb_verdal_ub)
plot(treeout_nsb_verdal_ub,add=T) 

bigtrees_nsb_verdal_ub<-which(extract(canopy_diff_nsb_verdal_ub,treeout_nsb_verdal_ub,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

nsb_verdal_ub_clip<-lasclip(nsb_verdal_ub,treeout_nsb_verdal_ub@polygons[[bigtrees_nsb_verdal_ub[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_nsb_verdal_ub)){
  print(i)
  nsb_verdal_ub_clip<-lasclip(nsb_verdal_ub_clip,treeout_nsb_verdal_ub@polygons[[bigtrees_nsb_verdal_ub[i]]]@Polygons[[1]],inside=F)}
plot(nsb_verdal_ub_clip) #point cloud without large trees

canopy_diff_nsb_verdal_ub_clip <- (as.raster(grid_canopy(nsb_verdal_ub_clip,res=0.5))-(crop(as.raster(grid_terrain(nsb_verdal_ub_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(nsb_verdal_ub_clip,res=0.5)))))
plot(canopy_diff_nsb_verdal_ub_clip)

writeRaster(canopy_diff_nsb_verdal_ub_clip,'Trondelag/canopy_height_clipped_raster/nsb_verdal_ub_canopyheight')



# Selbu flub --------------------------------------------------------------


# Selbu flub_b
terrainmod_selbu_flub_b  <-grid_terrain(selbu_flub_b, method='knnidw',res=1)
canopymod_selbu_flub_b   <-grid_canopy(selbu_flub_b,res=1)

terrainmod_selbu_flub_b_resampled <-resample(as.raster(terrainmod_selbu_flub_b), as.raster(canopymod_selbu_flub_b), method='bilinear')
canopy_diff_selbu_flub_b<-(as.raster(canopymod_selbu_flub_b)-terrainmod_selbu_flub_b_resampled)
plot(canopy_diff_selbu_flub_b)
canopy_diff_selbu_flub_b #max value 5,9

writeRaster(canopy_diff_selbu_flub_b,'Trondelag/canopy_height_clipped_raster/selbu_flub_b_canopyheight')



# Selbu flub_ub
terrainmod_selbu_flub_ub <-grid_terrain(selbu_flub_ub,method='knnidw',res=1)
canopymod_selbu_flub_ub  <-grid_canopy(selbu_flub_ub,res=1)

terrainmod_selbu_flub_ub_resampeled <- resample(as.raster(terrainmod_selbu_flub_ub), as.raster(canopymod_selbu_flub_ub, method='bilinear'))
canopy_diff_selbu_flub_ub <- (as.raster(canopymod_selbu_flub_ub)-terrainmod_selbu_flub_ub_resampeled)
plot(canopy_diff_selbu_flub_ub)
canopy_diff_selbu_flub_ub # max value 5,5 m

writeRaster(canopy_diff_selbu_flub_ub,'Trondelag/canopy_height_clipped_raster/selbu_flub_ub_canopyheight')



# Selbu_kl ----------------------------------------------------------------


# Selbu_kl_b
terrainmod_selbu_kl_b  <-grid_terrain(selbu_kl_b, method='knnidw',res=1)
canopymod_selbu_kl_b   <-grid_canopy(selbu_kl_b,res=1)

terrainmod_selbu_kl_b_resampled <-resample(as.raster(terrainmod_selbu_kl_b), as.raster(canopymod_selbu_kl_b), method='bilinear')
canopy_diff_selbu_kl_b<-(as.raster(canopymod_selbu_kl_b)-terrainmod_selbu_kl_b_resampled)
plot(canopy_diff_selbu_kl_b)

trees_selbu_kl_b<-tree_detection(selbu_kl_b,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_selbu_kl_b<-extract(canopy_diff_selbu_kl_b,trees_selbu_kl_b[,1:2])

lastrees_dalponte(selbu_kl_b,canopy_diff_selbu_kl_b,trees_selbu_kl_b[treeheight_selbu_kl_b>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_selbu_kl_b<-tree_hulls(selbu_kl_b,type='convex',field='treeID')
plot(canopy_diff_selbu_kl_b)
plot(treeout_selbu_kl_b,add=T) 

bigtrees_selbu_kl_b<-which(extract(canopy_diff_selbu_kl_b,treeout_selbu_kl_b,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

selbu_kl_b_clip<-lasclip(selbu_kl_b,treeout_selbu_kl_b@polygons[[bigtrees_selbu_kl_b[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_selbu_kl_b)){
  print(i)
  selbu_kl_b_clip<-lasclip(selbu_kl_b_clip,treeout_selbu_kl_b@polygons[[bigtrees_selbu_kl_b[i]]]@Polygons[[1]],inside=F)}
plot(selbu_kl_b_clip) #point cloud without large trees

canopy_diff_selbu_kl_b_clip <- (as.raster(grid_canopy(selbu_kl_b_clip,res=0.5))-(crop(as.raster(grid_terrain(selbu_kl_b_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(selbu_kl_b_clip,res=0.5)))))
plot(canopy_diff_selbu_kl_b_clip)

writeRaster(canopy_diff_selbu_kl_b_clip,'Trondelag/canopy_height_clipped_raster/selbu_kl_b_canopyheight')




# Selbu_kl_ub
terrainmod_selbu_kl_ub <-grid_terrain(selbu_kl_ub,method='knnidw',res=1)
canopymod_selbu_kl_ub  <-grid_canopy(selbu_kl_ub,res=1)

terrainmod_selbu_kl_ub_resampeled <- resample(as.raster(terrainmod_selbu_kl_ub), as.raster(canopymod_selbu_kl_ub, method='bilinear'))
canopy_diff_selbu_kl_ub <- (as.raster(canopymod_selbu_kl_ub)-terrainmod_selbu_kl_ub_resampeled)
plot(canopy_diff_selbu_kl_ub)

trees_selbu_kl_ub<-tree_detection(selbu_kl_ub,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_selbu_kl_ub<-extract(canopy_diff_selbu_kl_ub,trees_selbu_kl_ub[,1:2])

lastrees_dalponte(selbu_kl_ub,canopy_diff_selbu_kl_ub,trees_selbu_kl_ub[treeheight_selbu_kl_ub>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_selbu_kl_ub<-tree_hulls(selbu_kl_ub,type='convex',field='treeID')
plot(canopy_diff_selbu_kl_ub)
plot(treeout_selbu_kl_ub,add=T) 

bigtrees_selbu_kl_ub<-which(extract(canopy_diff_selbu_kl_ub,treeout_selbu_kl_ub,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

selbu_kl_ub_clip<-lasclip(selbu_kl_ub,treeout_selbu_kl_ub@polygons[[bigtrees_selbu_kl_ub[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_selbu_kl_ub)){
  print(i)
  selbu_kl_ub_clip<-lasclip(selbu_kl_ub_clip,treeout_selbu_kl_ub@polygons[[bigtrees_selbu_kl_ub[i]]]@Polygons[[1]],inside=F)}
plot(selbu_kl_ub_clip) #point cloud without large trees

canopy_diff_selbu_kl_ub_clip <- (as.raster(grid_canopy(selbu_kl_ub_clip,res=0.5))-(crop(as.raster(grid_terrain(selbu_kl_ub_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(selbu_kl_ub_clip,res=0.5)))))
plot(canopy_diff_selbu_kl_ub_clip)

writeRaster(canopy_diff_selbu_kl_ub_clip,'Trondelag/canopy_height_clipped_raster/selbu_kl_ub_canopyheight')



# Selbu_sl ----------------------------------------------------------------


# Selbu_sl_b
terrainmod_selbu_sl_b  <-grid_terrain(selbu_sl_b, method='knnidw',res=1)
canopymod_selbu_sl_b   <-grid_canopy(selbu_sl_b,res=1)

terrainmod_selbu_sl_b_resampled <-resample(as.raster(terrainmod_selbu_sl_b), as.raster(canopymod_selbu_sl_b), method='bilinear')
canopy_diff_selbu_sl_b<-(as.raster(canopymod_selbu_sl_b)-terrainmod_selbu_sl_b_resampled)
plot(canopy_diff_selbu_sl_b)

trees_selbu_sl_b<-tree_detection(selbu_sl_b,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_selbu_sl_b<-extract(canopy_diff_selbu_sl_b,trees_selbu_sl_b[,1:2])

lastrees_dalponte(selbu_sl_b,canopy_diff_selbu_sl_b,trees_selbu_sl_b[treeheight_selbu_sl_b>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_selbu_sl_b<-tree_hulls(selbu_sl_b,type='convex',field='treeID')
plot(canopy_diff_selbu_sl_b)
plot(treeout_selbu_sl_b,add=T) 

bigtrees_selbu_sl_b<-which(extract(canopy_diff_selbu_sl_b,treeout_selbu_sl_b,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

selbu_sl_b_clip<-lasclip(selbu_sl_b,treeout_selbu_sl_b@polygons[[bigtrees_selbu_sl_b[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_selbu_sl_b)){
  print(i)
  selbu_sl_b_clip<-lasclip(selbu_sl_b_clip,treeout_selbu_sl_b@polygons[[bigtrees_selbu_sl_b[i]]]@Polygons[[1]],inside=F)}
plot(selbu_sl_b_clip) #point cloud without large trees

canopy_diff_selbu_sl_b_clip <- (as.raster(grid_canopy(selbu_sl_b_clip,res=0.5))-(crop(as.raster(grid_terrain(selbu_sl_b_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(selbu_sl_b_clip,res=0.5)))))
plot(canopy_diff_selbu_sl_b_clip)

writeRaster(canopy_diff_selbu_sl_b_clip,'Trondelag/canopy_height_clipped_raster/selbu_sl_b_canopyheight')



# Selbu_sl_ub
terrainmod_selbu_sl_ub <-grid_terrain(selbu_sl_ub,method='knnidw',res=1)
canopymod_selbu_sl_ub  <-grid_canopy(selbu_sl_ub,res=1)

terrainmod_selbu_sl_ub_resampeled <- resample(as.raster(terrainmod_selbu_sl_ub), as.raster(canopymod_selbu_sl_ub, method='bilinear'))
canopy_diff_selbu_sl_ub <- (as.raster(canopymod_selbu_sl_ub)-terrainmod_selbu_sl_ub_resampeled)
plot(canopy_diff_selbu_sl_ub)
canopy_diff_selbu_sl_ub #max value 3,77 m

writeRaster(canopy_diff_selbu_sl_ub,'Trondelag/canopy_height_clipped_raster/selbu_sl_ub_canopyheight')



# Singsaas ----------------------------------------------------------------


# Singsaas_b
terrainmod_singsaas_b  <-grid_terrain(singsaas_b, method='knnidw',res=1)
canopymod_singsaas_b   <-grid_canopy(singsaas_b,res=1)

terrainmod_singsaas_b_resampled <-resample(as.raster(terrainmod_singsaas_b), as.raster(canopymod_singsaas_b), method='bilinear')
canopy_diff_singsaas_b<-(as.raster(canopymod_singsaas_b)-terrainmod_singsaas_b_resampled)
plot(canopy_diff_singsaas_b)

trees_singsaas_b<-tree_detection(singsaas_b,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_singsaas_b<-extract(canopy_diff_singsaas_b,trees_singsaas_b[,1:2])

lastrees_dalponte(singsaas_b,canopy_diff_singsaas_b,trees_singsaas_b[treeheight_singsaas_b>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_singsaas_b<-tree_hulls(singsaas_b,type='convex',field='treeID')
plot(canopy_diff_singsaas_b)
plot(treeout_singsaas_b,add=T) 

bigtrees_singsaas_b<-which(extract(canopy_diff_singsaas_b,treeout_singsaas_b,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

singsaas_b_clip<-lasclip(singsaas_b,treeout_singsaas_b@polygons[[bigtrees_singsaas_b[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_singsaas_b)){
  print(i)
  singsaas_b_clip<-lasclip(singsaas_b_clip,treeout_singsaas_b@polygons[[bigtrees_singsaas_b[i]]]@Polygons[[1]],inside=F)}
plot(singsaas_b_clip) 

canopy_diff_singsaas_b_clip <- (as.raster(grid_canopy(singsaas_b_clip,res=0.5))-(crop(as.raster(grid_terrain(singsaas_b_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(singsaas_b_clip,res=0.5)))))
plot(canopy_diff_singsaas_b_clip)

writeRaster(canopy_diff_singsaas_b_clip,'Trondelag/canopy_height_clipped_raster/singsaas_b_canopyheight')



# Singsaas_ub
terrainmod_singsaas_ub <-grid_terrain(singsaas_ub,method='knnidw',res=1)
canopymod_singsaas_ub  <-grid_canopy(singsaas_ub,res=1)

terrainmod_singsaas_ub_resampeled <- resample(as.raster(terrainmod_singsaas_ub), as.raster(canopymod_singsaas_ub, method='bilinear'))
canopy_diff_singsaas_ub <- (as.raster(canopymod_singsaas_ub)-terrainmod_singsaas_ub_resampeled)
plot(canopy_diff_singsaas_ub)

trees_singsaas_ub<-tree_detection(singsaas_ub,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_singsaas_ub<-extract(canopy_diff_singsaas_ub,trees_singsaas_ub[,1:2])

lastrees_dalponte(singsaas_ub,canopy_diff_singsaas_ub,trees_singsaas_ub[treeheight_singsaas_ub>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_singsaas_ub<-tree_hulls(singsaas_ub,type='convex',field='treeID')
plot(canopy_diff_singsaas_ub)
plot(treeout_singsaas_ub,add=T) 

bigtrees_singsaas_ub<-which(extract(canopy_diff_singsaas_ub,treeout_singsaas_ub,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

singsaas_ub_clip<-lasclip(singsaas_ub,treeout_singsaas_ub@polygons[[bigtrees_singsaas_ub[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_singsaas_ub)){
  print(i)
  singsaas_ub_clip<-lasclip(singsaas_ub_clip,treeout_singsaas_ub@polygons[[bigtrees_singsaas_ub[i]]]@Polygons[[1]],inside=F)}
plot(singsaas_ub_clip) 

canopy_diff_singsaas_ub_clip <- (as.raster(grid_canopy(singsaas_ub_clip,res=0.5))-(crop(as.raster(grid_terrain(singsaas_ub_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(singsaas_ub_clip,res=0.5)))))
plot(canopy_diff_singsaas_ub_clip)

writeRaster(canopy_diff_singsaas_ub_clip,'Trondelag/canopy_height_clipped_raster/singsaas_ub_canopyheight')



# sl_tydal ----------------------------------------------------------------


# sl_tydal_b
terrainmod_sl_tydal_b  <-grid_terrain(sl_tydal_b, method='knnidw',res=1)
canopymod_sl_tydal_b   <-grid_canopy(sl_tydal_b,res=1)

terrainmod_sl_tydal_b_resampled <-resample(as.raster(terrainmod_sl_tydal_b), as.raster(canopymod_sl_tydal_b), method='bilinear')
canopy_diff_sl_tydal_b<-(as.raster(canopymod_sl_tydal_b)-terrainmod_sl_tydal_b_resampled)
plot(canopy_diff_sl_tydal_b)

trees_sl_tydal_b<-tree_detection(sl_tydal_b,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_sl_tydal_b<-extract(canopy_diff_sl_tydal_b,trees_sl_tydal_b[,1:2])

lastrees_dalponte(sl_tydal_b,canopy_diff_sl_tydal_b,trees_sl_tydal_b[treeheight_sl_tydal_b>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_sl_tydal_b<-tree_hulls(sl_tydal_b,type='convex',field='treeID')
plot(canopy_diff_sl_tydal_b)
plot(treeout_sl_tydal_b,add=T) 

bigtrees_sl_tydal_b<-which(extract(canopy_diff_sl_tydal_b,treeout_sl_tydal_b,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

sl_tydal_b_clip<-lasclip(sl_tydal_b,treeout_sl_tydal_b@polygons[[bigtrees_sl_tydal_b[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_sl_tydal_b)){
  print(i)
  sl_tydal_b_clip<-lasclip(sl_tydal_b_clip,treeout_sl_tydal_b@polygons[[bigtrees_sl_tydal_b[i]]]@Polygons[[1]],inside=F)}
plot(sl_tydal_b_clip) 

canopy_diff_sl_tydal_b_clip <- (as.raster(grid_canopy(sl_tydal_b_clip,res=0.5))-(crop(as.raster(grid_terrain(sl_tydal_b_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(sl_tydal_b_clip,res=0.5)))))
plot(canopy_diff_sl_tydal_b_clip)

writeRaster(canopy_diff_sl_tydal_b_clip,'Trondelag/canopy_height_clipped_raster/sl_tydal_b_canopyheight')


# sl_tydal_ub
terrainmod_sl_tydal_ub <-grid_terrain(sl_tydal_ub,method='knnidw',res=1)
canopymod_sl_tydal_ub  <-grid_canopy(sl_tydal_ub,res=1)

terrainmod_sl_tydal_ub_resampeled <- resample(as.raster(terrainmod_sl_tydal_ub), as.raster(canopymod_sl_tydal_ub, method='bilinear'))
canopy_diff_sl_tydal_ub <- (as.raster(canopymod_sl_tydal_ub)-terrainmod_sl_tydal_ub_resampeled)
plot(canopy_diff_sl_tydal_ub)
canopy_diff_sl_tydal_ub #max value 5,8

writeRaster(canopy_diff_sl_tydal_ub,'Trondelag/canopy_height_clipped_raster/sl_tydal_ub_canopyheight')


# steinkjer_1BBb ----------------------------------------------------------


# Steinkjer_1BBb_b
terrainmod_steinkjer_1BBb_b  <-grid_terrain(steinkjer_1BBb_b, method='knnidw',res=1)
canopymod_steinkjer_1BBb_b   <-grid_canopy(steinkjer_1BBb_b,res=1)

terrainmod_steinkjer_1BBb_b_resampled <-resample(as.raster(terrainmod_steinkjer_1BBb_b), as.raster(canopymod_steinkjer_1BBb_b), method='bilinear')
canopy_diff_steinkjer_1BBb_b<-(as.raster(canopymod_steinkjer_1BBb_b)-terrainmod_steinkjer_1BBb_b_resampled)
plot(canopy_diff_steinkjer_1BBb_b)
canopy_diff_steinkjer_1BBb_b #max value 0,8

writeRaster(canopy_diff_steinkjer_1BBb_b,'Trondelag/canopy_height_clipped_raster/steinkjer_1BBb_b_canopyheight')


# Steinkjer_1BBb_ub
terrainmod_steinkjer_1BBb_ub <-grid_terrain(steinkjer_1BBb_ub,method='knnidw',res=1)
canopymod_steinkjer_1BBb_ub  <-grid_canopy(steinkjer_1BBb_ub,res=1)

terrainmod_steinkjer_1BBb_ub_resampeled <- resample(as.raster(terrainmod_steinkjer_1BBb_ub), as.raster(canopymod_steinkjer_1BBb_ub, method='bilinear'))
canopy_diff_steinkjer_1BBb_ub <- (as.raster(canopymod_steinkjer_1BBb_ub)-terrainmod_steinkjer_1BBb_ub_resampeled)
plot(canopy_diff_steinkjer_1BBb_ub)
canopy_diff_steinkjer_1BBb_ub # max 1.1

writeRaster(canopy_diff_steinkjer_1BBb_ub,'Trondelag/canopy_height_clipped_raster/steinkjer_1BBb_ub_canopyheight')


# Steinkjer_2BBb ----------------------------------------------------------


# Steinkjer_2BBb_b
terrainmod_steinkjer_2BBb_b  <-grid_terrain(steinkjer_2BBb_b, method='knnidw',res=1)
canopymod_steinkjer_2BBb_b   <-grid_canopy(steinkjer_2BBb_b,res=1)

terrainmod_steinkjer_2BBb_b_resampled <-resample(as.raster(terrainmod_steinkjer_2BBb_b), as.raster(canopymod_steinkjer_2BBb_b), method='bilinear')
canopy_diff_steinkjer_2BBb_b<-(as.raster(canopymod_steinkjer_2BBb_b)-terrainmod_steinkjer_2BBb_b_resampled)
plot(canopy_diff_steinkjer_2BBb_b)

trees_steinkjer_2BBb_b<-tree_detection(steinkjer_2BBb_b,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_steinkjer_2BBb_b<-extract(canopy_diff_steinkjer_2BBb_b,trees_steinkjer_2BBb_b[,1:2])

lastrees_dalponte(steinkjer_2BBb_b,canopy_diff_steinkjer_2BBb_b,trees_steinkjer_2BBb_b[treeheight_steinkjer_2BBb_b>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_steinkjer_2BBb_b<-tree_hulls(steinkjer_2BBb_b,type='convex',field='treeID')
plot(canopy_diff_steinkjer_2BBb_b)
plot(treeout_steinkjer_2BBb_b,add=T) 

bigtrees_steinkjer_2BBb_b<-which(extract(canopy_diff_steinkjer_2BBb_b,treeout_steinkjer_2BBb_b,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

steinkjer_2BBb_b_clip<-lasclip(steinkjer_2BBb_b,treeout_steinkjer_2BBb_b@polygons[[bigtrees_steinkjer_2BBb_b[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_steinkjer_2BBb_b)){
  print(i)
  steinkjer_2BBb_b_clip<-lasclip(steinkjer_2BBb_b_clip,treeout_steinkjer_2BBb_b@polygons[[bigtrees_steinkjer_2BBb_b[i]]]@Polygons[[1]],inside=F)}
plot(steinkjer_2BBb_b_clip) 

canopy_diff_steinkjer_2BBb_b_clip <- (as.raster(grid_canopy(steinkjer_2BBb_b_clip,res=0.5))-(crop(as.raster(grid_terrain(steinkjer_2BBb_b_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(steinkjer_2BBb_b_clip,res=0.5)))))
plot(canopy_diff_steinkjer_2BBb_b_clip)

writeRaster(canopy_diff_steinkjer_2BBb_b_clip,'Trondelag/canopy_height_clipped_raster/steinkjer_2BBb_b_canopyheight')


# Steinkjer_2BBb_ub
terrainmod_steinkjer_2BBb_ub <-grid_terrain(steinkjer_2BBb_ub,method='knnidw',res=1)
canopymod_steinkjer_2BBb_ub  <-grid_canopy(steinkjer_2BBb_ub,res=1)

terrainmod_steinkjer_2BBb_ub_resampeled <- resample(as.raster(terrainmod_steinkjer_2BBb_ub), as.raster(canopymod_steinkjer_2BBb_ub, method='bilinear'))
canopy_diff_steinkjer_2BBb_ub <- (as.raster(canopymod_steinkjer_2BBb_ub)-terrainmod_steinkjer_2BBb_ub_resampeled)
plot(canopy_diff_steinkjer_2BBb_ub)

trees_steinkjer_2BBb_ub<-tree_detection(steinkjer_2BBb_ub,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_steinkjer_2BBb_ub<-extract(canopy_diff_steinkjer_2BBb_ub,trees_steinkjer_2BBb_ub[,1:2])

lastrees_dalponte(steinkjer_2BBb_ub,canopy_diff_steinkjer_2BBb_ub,trees_steinkjer_2BBb_ub[treeheight_steinkjer_2BBb_ub>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_steinkjer_2BBb_ub<-tree_hulls(steinkjer_2BBb_ub,type='convex',field='treeID')
plot(canopy_diff_steinkjer_2BBb_ub)
plot(treeout_steinkjer_2BBb_ub,add=T) 

bigtrees_steinkjer_2BBb_ub<-which(extract(canopy_diff_steinkjer_2BBb_ub,treeout_steinkjer_2BBb_ub,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

steinkjer_2BBb_ub_clip<-lasclip(steinkjer_2BBb_ub,treeout_steinkjer_2BBb_ub@polygons[[bigtrees_steinkjer_2BBb_ub[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_steinkjer_2BBb_ub)){
  print(i)
  steinkjer_2BBb_ub_clip<-lasclip(steinkjer_2BBb_ub_clip,treeout_steinkjer_2BBb_ub@polygons[[bigtrees_steinkjer_2BBb_ub[i]]]@Polygons[[1]],inside=F)}
plot(steinkjer_2BBb_ub_clip) 

canopy_diff_steinkjer_2BBb_ub_clip <- (as.raster(grid_canopy(steinkjer_2BBb_ub_clip,res=0.5))-(crop(as.raster(grid_terrain(steinkjer_2BBb_ub_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(steinkjer_2BBb_ub_clip,res=0.5)))))
plot(canopy_diff_steinkjer_2BBb_ub_clip)

writeRaster(canopy_diff_steinkjer_2BBb_ub_clip,'Trondelag/canopy_height_clipped_raster/steinkjer_2BBb_ub_canopyheight')



# Sub_namdalseid ----------------------------------------------------------


# sub_namdalseid_b
terrainmod_sub_namdalseid_b  <-grid_terrain(sub_namdalseid_b, method='knnidw',res=1)
canopymod_sub_namdalseid_b   <-grid_canopy(sub_namdalseid_b,res=1)

terrainmod_sub_namdalseid_b_resampled <-resample(as.raster(terrainmod_sub_namdalseid_b), as.raster(canopymod_sub_namdalseid_b), method='bilinear')
canopy_diff_sub_namdalseid_b<-(as.raster(canopymod_sub_namdalseid_b)-terrainmod_sub_namdalseid_b_resampled)
plot(canopy_diff_sub_namdalseid_b)

trees_sub_namdalseid_b<-tree_detection(sub_namdalseid_b,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_sub_namdalseid_b<-extract(canopy_diff_sub_namdalseid_b,trees_sub_namdalseid_b[,1:2])

lastrees_dalponte(sub_namdalseid_b,canopy_diff_sub_namdalseid_b,trees_sub_namdalseid_b[treeheight_sub_namdalseid_b>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_sub_namdalseid_b<-tree_hulls(sub_namdalseid_b,type='convex',field='treeID')
plot(canopy_diff_sub_namdalseid_b)
plot(treeout_sub_namdalseid_b,add=T) 

bigtrees_sub_namdalseid_b<-which(extract(canopy_diff_sub_namdalseid_b,treeout_sub_namdalseid_b,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

sub_namdalseid_b_clip<-lasclip(sub_namdalseid_b,treeout_sub_namdalseid_b@polygons[[bigtrees_sub_namdalseid_b[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_sub_namdalseid_b)){
  print(i)
  sub_namdalseid_b_clip<-lasclip(sub_namdalseid_b_clip,treeout_sub_namdalseid_b@polygons[[bigtrees_sub_namdalseid_b[i]]]@Polygons[[1]],inside=F)}
plot(sub_namdalseid_b_clip) 

canopy_diff_sub_namdalseid_b_clip <- (as.raster(grid_canopy(sub_namdalseid_b_clip,res=0.5))-(crop(as.raster(grid_terrain(sub_namdalseid_b_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(sub_namdalseid_b_clip,res=0.5)))))
plot(canopy_diff_sub_namdalseid_b_clip)

writeRaster(canopy_diff_sub_namdalseid_b_clip,'Trondelag/canopy_height_clipped_raster/sub_namdalseid_b_canopyheight')


# sub_namdalseid_ub
terrainmod_sub_namdalseid_ub <-grid_terrain(sub_namdalseid_ub,method='knnidw',res=1)
canopymod_sub_namdalseid_ub  <-grid_canopy(sub_namdalseid_ub,res=1)


terrainmod_sub_namdalseid_ub_resampeled <- resample(as.raster(terrainmod_sub_namdalseid_ub), as.raster(canopymod_sub_namdalseid_ub, method='bilinear'))
canopy_diff_sub_namdalseid_ub <- (as.raster(canopymod_sub_namdalseid_ub)-terrainmod_sub_namdalseid_ub_resampeled)
plot(canopy_diff_sub_namdalseid_ub)

trees_sub_namdalseid_ub<-tree_detection(sub_namdalseid_ub,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_sub_namdalseid_ub<-extract(canopy_diff_sub_namdalseid_ub,trees_sub_namdalseid_ub[,1:2])

lastrees_dalponte(sub_namdalseid_ub,canopy_diff_sub_namdalseid_ub,trees_sub_namdalseid_ub[treeheight_sub_namdalseid_ub>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_sub_namdalseid_ub<-tree_hulls(sub_namdalseid_ub,type='convex',field='treeID')
plot(canopy_diff_sub_namdalseid_ub)
plot(treeout_sub_namdalseid_ub,add=T) 

bigtrees_sub_namdalseid_ub<-which(extract(canopy_diff_sub_namdalseid_ub,treeout_sub_namdalseid_ub,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

sub_namdalseid_ub_clip<-lasclip(sub_namdalseid_ub,treeout_sub_namdalseid_ub@polygons[[bigtrees_sub_namdalseid_ub[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_sub_namdalseid_ub)){
  print(i)
  sub_namdalseid_ub_clip<-lasclip(sub_namdalseid_ub_clip,treeout_sub_namdalseid_ub@polygons[[bigtrees_sub_namdalseid_ub[i]]]@Polygons[[1]],inside=F)}
plot(sub_namdalseid_ub_clip) 

canopy_diff_sub_namdalseid_ub_clip <- (as.raster(grid_canopy(sub_namdalseid_ub_clip,res=0.5))-(crop(as.raster(grid_terrain(sub_namdalseid_ub_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(sub_namdalseid_ub_clip,res=0.5)))))
plot(canopy_diff_sub_namdalseid_ub_clip)

writeRaster(canopy_diff_sub_namdalseid_ub_clip,'Trondelag/canopy_height_clipped_raster/sub_namdalseid_ub_canopyheight')



# Verdal_1vb --------------------------------------------------------------


# verdal_1vb_b
terrainmod_verdal_1vb_b  <-grid_terrain(verdal_1vb_b, method='knnidw',res=1)
canopymod_verdal_1vb_b   <-grid_canopy(verdal_1vb_b,res=1)

terrainmod_verdal_1vb_b_resampled <-resample(as.raster(terrainmod_verdal_1vb_b), as.raster(canopymod_verdal_1vb_b), method='bilinear')
canopy_diff_verdal_1vb_b<-(as.raster(canopymod_verdal_1vb_b)-terrainmod_verdal_1vb_b_resampled)
plot(canopy_diff_verdal_1vb_b)
canopy_diff_verdal_1vb_b #max 6,5

writeRaster(canopy_diff_verdal_1vb_b,'Trondelag/canopy_height_clipped_raster/verdal_1vb_b_canopyheight')


# verdal_1vb_ub
terrainmod_verdal_1vb_ub <-grid_terrain(verdal_1vb_ub,method='knnidw',res=1)
canopymod_verdal_1vb_ub  <-grid_canopy(verdal_1vb_ub,res=1)

terrainmod_verdal_1vb_ub_resampeled <- resample(as.raster(terrainmod_verdal_1vb_ub), as.raster(canopymod_verdal_1vb_ub, method='bilinear'))
canopy_diff_verdal_1vb_ub <- (as.raster(canopymod_verdal_1vb_ub)-terrainmod_verdal_1vb_ub_resampeled)
plot(canopy_diff_verdal_1vb_ub)


trees_verdal_1vb_ub<-tree_detection(verdal_1vb_ub,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_verdal_1vb_ub<-extract(canopy_diff_verdal_1vb_ub,trees_verdal_1vb_ub[,1:2])

lastrees_dalponte(verdal_1vb_ub,canopy_diff_verdal_1vb_ub,trees_verdal_1vb_ub[treeheight_verdal_1vb_ub>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_verdal_1vb_ub<-tree_hulls(verdal_1vb_ub,type='convex',field='treeID')
plot(canopy_diff_verdal_1vb_ub)
plot(treeout_verdal_1vb_ub,add=T) 

bigtrees_verdal_1vb_ub<-which(extract(canopy_diff_verdal_1vb_ub,treeout_verdal_1vb_ub,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

verdal_1vb_ub_clip<-lasclip(verdal_1vb_ub,treeout_verdal_1vb_ub@polygons[[bigtrees_verdal_1vb_ub[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_verdal_1vb_ub)){
  print(i)
  verdal_1vb_ub_clip<-lasclip(verdal_1vb_ub_clip,treeout_verdal_1vb_ub@polygons[[bigtrees_verdal_1vb_ub[i]]]@Polygons[[1]],inside=F)}
plot(verdal_1vb_ub_clip) 

canopy_diff_verdal_1vb_ub_clip <- (as.raster(grid_canopy(verdal_1vb_ub_clip,res=0.5))-(crop(as.raster(grid_terrain(verdal_1vb_ub_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(verdal_1vb_ub_clip,res=0.5)))))
plot(canopy_diff_verdal_1vb_ub_clip)

writeRaster(canopy_diff_verdal_1vb_ub_clip,'Trondelag/canopy_height_clipped_raster/verdal_1vb_ub_canopyheight')



# Verdal_2vb --------------------------------------------------------------



# Verdal_2vb_b
terrainmod_verdal_2vb_b  <-grid_terrain(verdal_2vb_b, method='knnidw',res=1)
canopymod_verdal_2vb_b   <-grid_canopy(verdal_2vb_b,res=1)

terrainmod_verdal_2vb_b_resampled <-resample(as.raster(terrainmod_verdal_2vb_b), as.raster(canopymod_verdal_2vb_b), method='bilinear')
canopy_diff_verdal_2vb_b<-(as.raster(canopymod_verdal_2vb_b)-terrainmod_verdal_2vb_b_resampled)
plot(canopy_diff_verdal_2vb_b)
canopy_diff_verdal_2vb_b #max 3,26

writeRaster(canopy_diff_verdal_2vb_b ,'Trondelag/canopy_height_clipped_raster/verdal_2vb_b_canopyheight')

# Verdal_2vb_ub
terrainmod_verdal_2vb_ub <-grid_terrain(verdal_2vb_ub,method='knnidw',res=1)
canopymod_verdal_2vb_ub  <-grid_canopy(verdal_2vb_ub,res=1)

terrainmod_verdal_2vb_ub_resampeled <- resample(as.raster(terrainmod_verdal_2vb_ub), as.raster(canopymod_verdal_2vb_ub, method='bilinear'))
canopy_diff_verdal_2vb_ub <- (as.raster(canopymod_verdal_2vb_ub)-terrainmod_verdal_2vb_ub_resampeled)
plot(canopy_diff_verdal_2vb_ub)

trees_verdal_2vb_ub<-tree_detection(verdal_2vb_ub,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_verdal_2vb_ub<-extract(canopy_diff_verdal_2vb_ub,trees_verdal_2vb_ub[,1:2])

lastrees_dalponte(verdal_2vb_ub,canopy_diff_verdal_2vb_ub,trees_verdal_2vb_ub[treeheight_verdal_2vb_ub>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_verdal_2vb_ub<-tree_hulls(verdal_2vb_ub,type='convex',field='treeID')
plot(canopy_diff_verdal_2vb_ub)
plot(treeout_verdal_2vb_ub,add=T) 

bigtrees_verdal_2vb_ub<-which(extract(canopy_diff_verdal_2vb_ub,treeout_verdal_2vb_ub,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

verdal_2vb_ub_clip<-lasclip(verdal_2vb_ub,treeout_verdal_2vb_ub@polygons[[bigtrees_verdal_2vb_ub[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_verdal_2vb_ub)){
  print(i)
  verdal_2vb_ub_clip<-lasclip(verdal_2vb_ub_clip,treeout_verdal_2vb_ub@polygons[[bigtrees_verdal_2vb_ub[i]]]@Polygons[[1]],inside=F)}
plot(verdal_2vb_ub_clip) 

canopy_diff_verdal_2vb_ub_clip <- (as.raster(grid_canopy(verdal_2vb_ub_clip,res=0.5))-(crop(as.raster(grid_terrain(verdal_2vb_ub_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(verdal_2vb_ub_clip,res=0.5)))))
plot(canopy_diff_verdal_2vb_ub_clip)

writeRaster(canopy_diff_verdal_2vb_ub_clip,'Trondelag/canopy_height_clipped_raster/verdal_2vb_ub_canopyheight')







# Telemark ----------------------------------------------------------------


# Drangedal1 --------------------------------------------------------------


#Drangedal1_b
terrainmod_drangedal1_b  <-grid_terrain(drangedal1_b, method='knnidw',res=1)
canopymod_drangedal1_b   <-grid_canopy(drangedal1_b,res=1)

terrainmod_drangedal1_b_resampled <-resample(as.raster(terrainmod_drangedal1_b), as.raster(canopymod_drangedal1_b), method='bilinear')
canopy_diff_drangedal1_b<-(as.raster(canopymod_drangedal1_b)-terrainmod_drangedal1_b_resampled)
plot(canopy_diff_drangedal1_b)


trees_drangedal1_b<-tree_detection(drangedal1_b,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_drangedal1_b<-extract(canopy_diff_drangedal1_b,trees_drangedal1_b[,1:2])

lastrees_dalponte(drangedal1_b,canopy_diff_drangedal1_b,trees_drangedal1_b[treeheight_drangedal1_b>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_drangedal1_b<-tree_hulls(drangedal1_b,type='convex',field='treeID')
plot(canopy_diff_drangedal1_b)
plot(treeout_drangedal1_b,add=T) 

bigtrees_drangedal1_b<-which(extract(canopy_diff_drangedal1_b,treeout_drangedal1_b,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

drangedal1_b_clip<-lasclip(drangedal1_b,treeout_drangedal1_b@polygons[[bigtrees_drangedal1_b[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_drangedal1_b)){
  print(i)
  drangedal1_b_clip<-lasclip(drangedal1_b_clip,treeout_drangedal1_b@polygons[[bigtrees_drangedal1_b[i]]]@Polygons[[1]],inside=F)}
plot(drangedal1_b_clip) 

canopy_diff_drangedal1_b_clip <- (as.raster(grid_canopy(drangedal1_b_clip,res=0.5))-(crop(as.raster(grid_terrain(drangedal1_b_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(drangedal1_b_clip,res=0.5)))))
plot(canopy_diff_drangedal1_b_clip)

writeRaster(canopy_diff_drangedal1_b_clip,'Telemark/canopy_height_clipped_raster/drangedal1_b_canopyheight')



#Drangedal1_ub
terrainmod_drangedal1_ub <-grid_terrain(drangedal1_ub,method='knnidw',res=1)
canopymod_drangedal1_ub  <-grid_canopy(drangedal1_ub,res=1)

terrainmod_drangedal1_ub_resampeled <- resample(as.raster(terrainmod_drangedal1_ub), as.raster(canopymod_drangedal1_ub, method='bilinear'))
canopy_diff_drangedal1_ub <- (as.raster(canopymod_drangedal1_ub)-terrainmod_drangedal1_ub_resampeled)
plot(canopy_diff_drangedal1_ub)

trees_drangedal1_ub<-tree_detection(drangedal1_ub,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_drangedal1_ub<-extract(canopy_diff_drangedal1_ub,trees_drangedal1_ub[,1:2])

lastrees_dalponte(drangedal1_ub,canopy_diff_drangedal1_ub,trees_drangedal1_ub[treeheight_drangedal1_ub>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_drangedal1_ub<-tree_hulls(drangedal1_ub,type='convex',field='treeID')
plot(canopy_diff_drangedal1_ub)
plot(treeout_drangedal1_ub,add=T) 

bigtrees_drangedal1_ub<-which(extract(canopy_diff_drangedal1_ub,treeout_drangedal1_ub,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

drangedal1_ub_clip<-lasclip(drangedal1_ub,treeout_drangedal1_ub@polygons[[bigtrees_drangedal1_ub[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_drangedal1_ub)){
  print(i)
  drangedal1_ub_clip<-lasclip(drangedal1_ub_clip,treeout_drangedal1_ub@polygons[[bigtrees_drangedal1_ub[i]]]@Polygons[[1]],inside=F)}
plot(drangedal1_ub_clip) 

canopy_diff_drangedal1_ub_clip <- (as.raster(grid_canopy(drangedal1_ub_clip,res=0.5))-(crop(as.raster(grid_terrain(drangedal1_ub_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(drangedal1_ub_clip,res=0.5)))))
plot(canopy_diff_drangedal1_ub_clip)

writeRaster(canopy_diff_drangedal1_ub_clip,'Telemark/canopy_height_clipped_raster/drangedal1_ub_canopyheight')



# Drangedal3 --------------------------------------------------------------


#Drangedal3_b
terrainmod_drangedal3_b  <-grid_terrain(drangedal3_b, method='knnidw',res=1)
canopymod_drangedal3_b   <-grid_canopy(drangedal3_b,res=1)

terrainmod_drangedal3_b_resampled <-resample(as.raster(terrainmod_drangedal3_b), as.raster(canopymod_drangedal3_b), method='bilinear')
canopy_diff_drangedal3_b<-(as.raster(canopymod_drangedal3_b)-terrainmod_drangedal3_b_resampled)
plot(canopy_diff_drangedal3_b)

trees_drangedal3_b<-tree_detection(drangedal3_b,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_drangedal3_b<-extract(canopy_diff_drangedal3_b,trees_drangedal3_b[,1:2])

lastrees_dalponte(drangedal3_b,canopy_diff_drangedal3_b,trees_drangedal3_b[treeheight_drangedal3_b>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_drangedal3_b<-tree_hulls(drangedal3_b,type='convex',field='treeID')
plot(canopy_diff_drangedal3_b)
plot(treeout_drangedal3_b,add=T) 

bigtrees_drangedal3_b<-which(extract(canopy_diff_drangedal3_b,treeout_drangedal3_b,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

drangedal3_b_clip<-lasclip(drangedal3_b,treeout_drangedal3_b@polygons[[bigtrees_drangedal3_b[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_drangedal3_b)){
  print(i)
  drangedal3_b_clip<-lasclip(drangedal3_b_clip,treeout_drangedal3_b@polygons[[bigtrees_drangedal3_b[i]]]@Polygons[[1]],inside=F)}
plot(drangedal3_b_clip) 

canopy_diff_drangedal3_b_clip <- (as.raster(grid_canopy(drangedal3_b_clip,res=0.5))-(crop(as.raster(grid_terrain(drangedal3_b_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(drangedal3_b_clip,res=0.5)))))
plot(canopy_diff_drangedal3_b_clip)

writeRaster(canopy_diff_drangedal3_b_clip,'Telemark/canopy_height_clipped_raster/drangedal3_b_canopyheight')



#Drangedal3_ub
terrainmod_drangedal3_ub <-grid_terrain(drangedal3_ub,method='knnidw',res=1)
canopymod_drangedal3_ub  <-grid_canopy(drangedal3_ub,res=1)

terrainmod_drangedal3_ub_resampeled <- resample(as.raster(terrainmod_drangedal3_ub), as.raster(canopymod_drangedal3_ub, method='bilinear'))
canopy_diff_drangedal3_ub <- (as.raster(canopymod_drangedal3_ub)-terrainmod_drangedal3_ub_resampeled)
plot(canopy_diff_drangedal3_ub)

trees_drangedal3_ub<-tree_detection(drangedal3_ub,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_drangedal3_ub<-extract(canopy_diff_drangedal3_ub,trees_drangedal3_ub[,1:2])

lastrees_dalponte(drangedal3_ub,canopy_diff_drangedal3_ub,trees_drangedal3_ub[treeheight_drangedal3_ub>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_drangedal3_ub<-tree_hulls(drangedal3_ub,type='convex',field='treeID')
plot(canopy_diff_drangedal3_ub)
plot(treeout_drangedal3_ub,add=T) 

bigtrees_drangedal3_ub<-which(extract(canopy_diff_drangedal3_ub,treeout_drangedal3_ub,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

drangedal3_ub_clip<-lasclip(drangedal3_ub,treeout_drangedal3_ub@polygons[[bigtrees_drangedal3_ub[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_drangedal3_ub)){
  print(i)
  drangedal3_ub_clip<-lasclip(drangedal3_ub_clip,treeout_drangedal3_ub@polygons[[bigtrees_drangedal3_ub[i]]]@Polygons[[1]],inside=F)}
plot(drangedal3_ub_clip) 

canopy_diff_drangedal3_ub_clip <- (as.raster(grid_canopy(drangedal3_ub_clip,res=0.5))-(crop(as.raster(grid_terrain(drangedal3_ub_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(drangedal3_ub_clip,res=0.5)))))
plot(canopy_diff_drangedal3_ub_clip)

writeRaster(canopy_diff_drangedal3_ub_clip,'Telemark/canopy_height_clipped_raster/drangedal3_ub_canopyheight')



# Drangedal4 --------------------------------------------------------------


#Drangedal4_b
terrainmod_drangedal4_b  <-grid_terrain(drangedal4_b, method='knnidw',res=1)
canopymod_drangedal4_b   <-grid_canopy(drangedal4_b,res=1)

terrainmod_drangedal4_b_resampled <-resample(as.raster(terrainmod_drangedal4_b), as.raster(canopymod_drangedal4_b), method='bilinear')
canopy_diff_drangedal4_b<-(as.raster(canopymod_drangedal4_b)-terrainmod_drangedal4_b_resampled)
plot(canopy_diff_drangedal4_b)

trees_drangedal4_b<-tree_detection(drangedal4_b,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_drangedal4_b<-extract(canopy_diff_drangedal4_b,trees_drangedal4_b[,1:2])

lastrees_dalponte(drangedal4_b,canopy_diff_drangedal4_b,trees_drangedal4_b[treeheight_drangedal4_b>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_drangedal4_b<-tree_hulls(drangedal4_b,type='convex',field='treeID')
plot(canopy_diff_drangedal4_b)
plot(treeout_drangedal4_b,add=T) 

bigtrees_drangedal4_b<-which(extract(canopy_diff_drangedal4_b,treeout_drangedal4_b,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

drangedal4_b_clip<-lasclip(drangedal4_b,treeout_drangedal4_b@polygons[[bigtrees_drangedal4_b[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_drangedal4_b)){
  print(i)
  drangedal4_b_clip<-lasclip(drangedal4_b_clip,treeout_drangedal4_b@polygons[[bigtrees_drangedal4_b[i]]]@Polygons[[1]],inside=F)}
plot(drangedal4_b_clip) 

canopy_diff_drangedal4_b_clip <- (as.raster(grid_canopy(drangedal4_b_clip,res=0.5))-(crop(as.raster(grid_terrain(drangedal4_b_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(drangedal4_b_clip,res=0.5)))))
plot(canopy_diff_drangedal4_b_clip)

writeRaster(canopy_diff_drangedal4_b_clip,'Telemark/canopy_height_clipped_raster/drangedal4_b_canopyheight')


#Drangedal4_ub
terrainmod_drangedal4_ub <-grid_terrain(drangedal4_ub,method='knnidw',res=1)
canopymod_drangedal4_ub  <-grid_canopy(drangedal4_ub,res=1)

terrainmod_drangedal4_ub_resampeled <- resample(as.raster(terrainmod_drangedal4_ub), as.raster(canopymod_drangedal4_ub, method='bilinear'))
canopy_diff_drangedal4_ub <- (as.raster(canopymod_drangedal4_ub)-terrainmod_drangedal4_ub_resampeled)
plot(canopy_diff_drangedal4_ub)
canopy_diff_drangedal4_ub #max 4,6 

writeRaster(canopy_diff_drangedal4_ub,'Telemark/canopy_height_clipped_raster/drangedal4_ub_canopyheight')



# Fritsoe2 ----------------------------------------------------------------


# Fritsoe2_b
terrainmod_fritsoe2_b  <-grid_terrain(fritsoe2_b, method='knnidw',res=1)
canopymod_fritsoe2_b   <-grid_canopy(fritsoe2_b,res=1)

terrainmod_fritsoe2_b_resampled <-resample(as.raster(terrainmod_fritsoe2_b), as.raster(canopymod_fritsoe2_b), method='bilinear')
canopy_diff_fritsoe2_b<-(as.raster(canopymod_fritsoe2_b)-terrainmod_fritsoe2_b_resampled)
plot(canopy_diff_fritsoe2_b)

trees_fritsoe2_b<-tree_detection(fritsoe2_b,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_fritsoe2_b<-extract(canopy_diff_fritsoe2_b,trees_fritsoe2_b[,1:2])

lastrees_dalponte(fritsoe2_b,canopy_diff_fritsoe2_b,trees_fritsoe2_b[treeheight_fritsoe2_b>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_fritsoe2_b<-tree_hulls(fritsoe2_b,type='convex',field='treeID')
plot(canopy_diff_fritsoe2_b)
plot(treeout_fritsoe2_b,add=T) 

bigtrees_fritsoe2_b<-which(extract(canopy_diff_fritsoe2_b,treeout_fritsoe2_b,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

#ERROR!!
fritsoe2_b_clip<-lasclip(fritsoe2_b,treeout_fritsoe2_b@polygons[[bigtrees_fritsoe2_b[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_fritsoe2_b)){
  print(i)
  fritsoe2_b_clip<-lasclip(fritsoe2_b_clip,treeout_fritsoe2_b@polygons[[bigtrees_fritsoe2_b[i]]]@Polygons[[1]],inside=F)}
plot(fritsoe2_b_clip) 

canopy_diff_fritsoe2_b_clip <- (as.raster(grid_canopy(fritsoe2_b_clip,res=0.5))-(crop(as.raster(grid_terrain(fritsoe2_b_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(fritsoe2_b_clip,res=0.5)))))
plot(canopy_diff_fritsoe2_b_clip)

writeRaster(canopy_diff_fritsoe2_b_clip,'Telemark/canopy_height_clipped_raster/fritsoe2_b_canopyheight')



# Fritsoe2_ub
terrainmod_fritsoe2_ub <-grid_terrain(fritsoe2_ub,method='knnidw',res=1)
canopymod_fritsoe2_ub  <-grid_canopy(fritsoe2_ub,res=1)

terrainmod_fritsoe2_ub_resampeled <- resample(as.raster(terrainmod_fritsoe2_ub), as.raster(canopymod_fritsoe2_ub, method='bilinear'))
canopy_diff_fritsoe2_ub <- (as.raster(canopymod_fritsoe2_ub)-terrainmod_fritsoe2_ub_resampeled)
plot(canopy_diff_fritsoe2_ub)

trees_fritsoe2_ub<-tree_detection(fritsoe2_ub,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_fritsoe2_ub<-extract(canopy_diff_fritsoe2_ub,trees_fritsoe2_ub[,1:2])

lastrees_dalponte(fritsoe2_ub,canopy_diff_fritsoe2_ub,trees_fritsoe2_ub[treeheight_fritsoe2_ub>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_fritsoe2_ub<-tree_hulls(fritsoe2_ub,type='convex',field='treeID')
plot(canopy_diff_fritsoe2_ub)
plot(treeout_fritsoe2_ub,add=T) 

bigtrees_fritsoe2_ub<-which(extract(canopy_diff_fritsoe2_ub,treeout_fritsoe2_ub,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

fritsoe2_ub_clip<-lasclip(fritsoe2_ub,treeout_fritsoe2_ub@polygons[[bigtrees_fritsoe2_ub[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_fritsoe2_ub)){
  print(i)
  fritsoe2_ub_clip<-lasclip(fritsoe2_ub_clip,treeout_fritsoe2_ub@polygons[[bigtrees_fritsoe2_ub[i]]]@Polygons[[1]],inside=F)}
plot(fritsoe2_ub_clip) 

canopy_diff_fritsoe2_ub_clip <- (as.raster(grid_canopy(fritsoe2_ub_clip,res=0.5))-(crop(as.raster(grid_terrain(fritsoe2_ub_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(fritsoe2_ub_clip,res=0.5)))))
plot(canopy_diff_fritsoe2_ub_clip)

writeRaster(canopy_diff_fritsoe2_ub_clip,'Telemark/canopy_height_clipped_raster/fritsoe2_ub_canopyheight')



# Fritsoe1 ----------------------------------------------------------------


# Fritsoe1_b
terrainmod_fritsoe1_b  <-grid_terrain(fritsoe1_b, method='knnidw',res=1)
canopymod_fritsoe1_b   <-grid_canopy(fritsoe1_b,res=1)

terrainmod_fritsoe1_b_resampled <-resample(as.raster(terrainmod_fritsoe1_b), as.raster(canopymod_fritsoe1_b), method='bilinear')
canopy_diff_fritsoe1_b<-(as.raster(canopymod_fritsoe1_b)-terrainmod_fritsoe1_b_resampled)
plot(canopy_diff_fritsoe1_b)
canopy_diff_fritsoe1_b #max 4

writeRaster(canopy_diff_fritsoe1_b,'Telemark/canopy_height_clipped_raster/fritsoe1_b_canopyheight')


# Fritsoe1_ub
terrainmod_fritsoe1_ub <-grid_terrain(fritsoe1_ub,method='knnidw',res=1)
canopymod_fritsoe1_ub  <-grid_canopy(fritsoe1_ub,res=1)


terrainmod_fritsoe1_ub_resampeled <- resample(as.raster(terrainmod_fritsoe1_ub), as.raster(canopymod_fritsoe1_ub, method='bilinear'))
canopy_diff_fritsoe1_ub <- (as.raster(canopymod_fritsoe1_ub)-terrainmod_fritsoe1_ub_resampeled)
plot(canopy_diff_fritsoe1_ub)
canopy_diff_fritsoe1_ub #mac 4,8

writeRaster(canopy_diff_fritsoe1_ub,'Telemark/canopy_height_clipped_raster/fritsoe1_ub_canopyheight')



# Fyresdal ----------------------------------------------------------------


# Fyresdal_b
terrainmod_fyresdal_b  <-grid_terrain(fyresdal_b, method='knnidw',res=1)
canopymod_fyresdal_b   <-grid_canopy(fyresdal_b,res=1)

terrainmod_fyresdal_b_resampled <-resample(as.raster(terrainmod_fyresdal_b), as.raster(canopymod_fyresdal_b), method='bilinear')
canopy_diff_fyresdal_b<-(as.raster(canopymod_fyresdal_b)-terrainmod_fyresdal_b_resampled)
plot(canopy_diff_fyresdal_b)

trees_fyresdal_b<-tree_detection(fyresdal_b,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_fyresdal_b<-extract(canopy_diff_fyresdal_b,trees_fyresdal_b[,1:2])

lastrees_dalponte(fyresdal_b,canopy_diff_fyresdal_b,trees_fyresdal_b[treeheight_fyresdal_b>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_fyresdal_b<-tree_hulls(fyresdal_b,type='convex',field='treeID')
plot(canopy_diff_fyresdal_b)
plot(treeout_fyresdal_b,add=T) 

bigtrees_fyresdal_b<-which(extract(canopy_diff_fyresdal_b,treeout_fyresdal_b,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

fyresdal_b_clip<-lasclip(fyresdal_b,treeout_fyresdal_b@polygons[[bigtrees_fyresdal_b[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_fyresdal_b)){
  print(i)
  fyresdal_b_clip<-lasclip(fyresdal_b_clip,treeout_fyresdal_b@polygons[[bigtrees_fyresdal_b[i]]]@Polygons[[1]],inside=F)}
plot(fyresdal_b_clip) 

canopy_diff_fyresdal_b_clip <- (as.raster(grid_canopy(fyresdal_b_clip,res=0.5))-(crop(as.raster(grid_terrain(fyresdal_b_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(fyresdal_b_clip,res=0.5)))))
plot(canopy_diff_fyresdal_b_clip)

writeRaster(canopy_diff_fyresdal_b_clip,'Telemark/canopy_height_clipped_raster/fyresdal_b_canopyheight')



# Fyresdal_ub
terrainmod_fyresdal_ub <-grid_terrain(fyresdal_ub,method='knnidw',res=1)
canopymod_fyresdal_ub  <-grid_canopy(fyresdal_ub,res=1)

terrainmod_fyresdal_ub_resampeled <- resample(as.raster(terrainmod_fyresdal_ub), as.raster(canopymod_fyresdal_ub, method='bilinear'))
canopy_diff_fyresdal_ub <- (as.raster(canopymod_fyresdal_ub)-terrainmod_fyresdal_ub_resampeled)
plot(canopy_diff_fyresdal_ub)

trees_fyresdal_ub<-tree_detection(fyresdal_ub,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_fyresdal_ub<-extract(canopy_diff_fyresdal_ub,trees_fyresdal_ub[,1:2])

lastrees_dalponte(fyresdal_ub,canopy_diff_fyresdal_ub,trees_fyresdal_ub[treeheight_fyresdal_ub>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_fyresdal_ub<-tree_hulls(fyresdal_ub,type='convex',field='treeID')
plot(canopy_diff_fyresdal_ub)
plot(treeout_fyresdal_ub,add=T) 

bigtrees_fyresdal_ub<-which(extract(canopy_diff_fyresdal_ub,treeout_fyresdal_ub,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

fyresdal_ub_clip<-lasclip(fyresdal_ub,treeout_fyresdal_ub@polygons[[bigtrees_fyresdal_ub[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_fyresdal_ub)){
  print(i)
  fyresdal_ub_clip<-lasclip(fyresdal_ub_clip,treeout_fyresdal_ub@polygons[[bigtrees_fyresdal_ub[i]]]@Polygons[[1]],inside=F)}
plot(fyresdal_ub_clip) 

canopy_diff_fyresdal_ub_clip <- (as.raster(grid_canopy(fyresdal_ub_clip,res=0.5))-(crop(as.raster(grid_terrain(fyresdal_ub_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(fyresdal_ub_clip,res=0.5)))))
plot(canopy_diff_fyresdal_ub_clip)

writeRaster(canopy_diff_fyresdal_ub_clip,'Telemark/canopy_height_clipped_raster/fyresdal_ub_canopyheight')


# Kviteseid1 --------------------------------------------------------------


# kviteseid1_b
terrainmod_kviteseid1_b  <-grid_terrain(kviteseid1_b, method='knnidw',res=1)
canopymod_kviteseid1_b   <-grid_canopy(kviteseid1_b,res=1)

terrainmod_kviteseid1_b_resampled <-resample(as.raster(terrainmod_kviteseid1_b), as.raster(canopymod_kviteseid1_b), method='bilinear')
canopy_diff_kviteseid1_b<-(as.raster(canopymod_kviteseid1_b)-terrainmod_kviteseid1_b_resampled)
plot(canopy_diff_kviteseid1_b)

trees_kviteseid1_b<-tree_detection(kviteseid1_b,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_kviteseid1_b<-extract(canopy_diff_kviteseid1_b,trees_kviteseid1_b[,1:2])

lastrees_dalponte(kviteseid1_b,canopy_diff_kviteseid1_b,trees_kviteseid1_b[treeheight_kviteseid1_b>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_kviteseid1_b<-tree_hulls(kviteseid1_b,type='convex',field='treeID')
plot(canopy_diff_kviteseid1_b)
plot(treeout_kviteseid1_b,add=T) 

bigtrees_kviteseid1_b<-which(extract(canopy_diff_kviteseid1_b,treeout_kviteseid1_b,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

kviteseid1_b_clip<-lasclip(kviteseid1_b,treeout_kviteseid1_b@polygons[[bigtrees_kviteseid1_b[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_kviteseid1_b)){
  print(i)
  kviteseid1_b_clip<-lasclip(kviteseid1_b_clip,treeout_kviteseid1_b@polygons[[bigtrees_kviteseid1_b[i]]]@Polygons[[1]],inside=F)}
plot(kviteseid1_b_clip) 

canopy_diff_kviteseid1_b_clip <- (as.raster(grid_canopy(kviteseid1_b_clip,res=0.5))-(crop(as.raster(grid_terrain(kviteseid1_b_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(kviteseid1_b_clip,res=0.5)))))
plot(canopy_diff_kviteseid1_b_clip)

writeRaster(canopy_diff_kviteseid1_b_clip,'Telemark/canopy_height_clipped_raster/kviteseid1_b_canopyheight')



#kviteseid1_ub
terrainmod_kviteseid1_ub <-grid_terrain(kviteseid1_ub,method='knnidw',res=1)
canopymod_kviteseid1_ub  <-grid_canopy(kviteseid1_ub,res=1)

terrainmod_kviteseid1_ub_resampeled <- resample(as.raster(terrainmod_kviteseid1_ub), as.raster(canopymod_kviteseid1_ub, method='bilinear'))
canopy_diff_kviteseid1_ub <- (as.raster(canopymod_kviteseid1_ub)-terrainmod_kviteseid1_ub_resampeled)
plot(canopy_diff_kviteseid1_ub)
#max 5,525

writeRaster(canopy_diff_kviteseid1_ub,'Telemark/canopy_height_clipped_raster/kviteseid1_ub_canopyheight')


# Kviteseid2 --------------------------------------------------------------


# kviteseid2_b
terrainmod_kviteseid2_b  <-grid_terrain(kviteseid2_b, method='knnidw',res=1)
canopymod_kviteseid2_b   <-grid_canopy(kviteseid2_b,res=1)

terrainmod_kviteseid2_b_resampled <-resample(as.raster(terrainmod_kviteseid2_b), as.raster(canopymod_kviteseid2_b), method='bilinear')
canopy_diff_kviteseid2_b<-(as.raster(canopymod_kviteseid2_b)-terrainmod_kviteseid2_b_resampled)
plot(canopy_diff_kviteseid2_b)

trees_kviteseid2_b<-tree_detection(kviteseid2_b,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_kviteseid2_b<-extract(canopy_diff_kviteseid2_b,trees_kviteseid2_b[,1:2])

lastrees_dalponte(kviteseid2_b,canopy_diff_kviteseid2_b,trees_kviteseid2_b[treeheight_kviteseid2_b>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_kviteseid2_b<-tree_hulls(kviteseid2_b,type='convex',field='treeID')
plot(canopy_diff_kviteseid2_b)
plot(treeout_kviteseid2_b,add=T) 

bigtrees_kviteseid2_b<-which(extract(canopy_diff_kviteseid2_b,treeout_kviteseid2_b,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

kviteseid2_b_clip<-lasclip(kviteseid2_b,treeout_kviteseid2_b@polygons[[bigtrees_kviteseid2_b[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_kviteseid2_b)){
  print(i)
  kviteseid2_b_clip<-lasclip(kviteseid2_b_clip,treeout_kviteseid2_b@polygons[[bigtrees_kviteseid2_b[i]]]@Polygons[[1]],inside=F)}
plot(kviteseid2_b_clip) 

canopy_diff_kviteseid2_b_clip <- (as.raster(grid_canopy(kviteseid2_b_clip,res=0.5))-(crop(as.raster(grid_terrain(kviteseid2_b_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(kviteseid2_b_clip,res=0.5)))))
plot(canopy_diff_kviteseid2_b_clip)

writeRaster(canopy_diff_kviteseid2_b_clip,'Telemark/canopy_height_clipped_raster/kviteseid2_b_canopyheight')


# kviteseid2_ub
terrainmod_kviteseid2_ub <-grid_terrain(kviteseid2_ub,method='knnidw',res=1)
canopymod_kviteseid2_ub  <-grid_canopy(kviteseid2_ub,res=1)

terrainmod_kviteseid2_ub_resampeled <- resample(as.raster(terrainmod_kviteseid2_ub), as.raster(canopymod_kviteseid2_ub, method='bilinear'))
canopy_diff_kviteseid2_ub <- (as.raster(canopymod_kviteseid2_ub)-terrainmod_kviteseid2_ub_resampeled)
plot(canopy_diff_kviteseid2_ub)

trees_kviteseid2_ub<-tree_detection(kviteseid2_ub,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_kviteseid2_ub<-extract(canopy_diff_kviteseid2_ub,trees_kviteseid2_ub[,1:2])

lastrees_dalponte(kviteseid2_ub,canopy_diff_kviteseid2_ub,trees_kviteseid2_ub[treeheight_kviteseid2_ub>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_kviteseid2_ub<-tree_hulls(kviteseid2_ub,type='convex',field='treeID')
plot(canopy_diff_kviteseid2_ub)
plot(treeout_kviteseid2_ub,add=T) 

bigtrees_kviteseid2_ub<-which(extract(canopy_diff_kviteseid2_ub,treeout_kviteseid2_ub,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

kviteseid2_ub_clip<-lasclip(kviteseid2_ub,treeout_kviteseid2_ub@polygons[[bigtrees_kviteseid2_ub[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_kviteseid2_ub)){
  print(i)
  kviteseid2_ub_clip<-lasclip(kviteseid2_ub_clip,treeout_kviteseid2_ub@polygons[[bigtrees_kviteseid2_ub[i]]]@Polygons[[1]],inside=F)}
plot(kviteseid2_ub_clip) 

canopy_diff_kviteseid2_ub_clip <- (as.raster(grid_canopy(kviteseid2_ub_clip,res=0.5))-(crop(as.raster(grid_terrain(kviteseid2_ub_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(kviteseid2_ub_clip,res=0.5)))))
plot(canopy_diff_kviteseid2_ub_clip)

writeRaster(canopy_diff_kviteseid2_ub_clip,'Telemark/canopy_height_clipped_raster/kviteseid2_ub_canopyheight')


# Kviteseid3 --------------------------------------------------------------


# kviteseid3_b
terrainmod_kviteseid3_b  <-grid_terrain(kviteseid3_b, method='knnidw',res=1)
canopymod_kviteseid3_b   <-grid_canopy(kviteseid3_b,res=1)

terrainmod_kviteseid3_b_resampled <-resample(as.raster(terrainmod_kviteseid3_b), as.raster(canopymod_kviteseid3_b), method='bilinear')
canopy_diff_kviteseid3_b<-(as.raster(canopymod_kviteseid3_b)-terrainmod_kviteseid3_b_resampled)
plot(canopy_diff_kviteseid3_b)

trees_kviteseid3_b<-tree_detection(kviteseid3_b,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_kviteseid3_b<-extract(canopy_diff_kviteseid3_b,trees_kviteseid3_b[,1:2])

lastrees_dalponte(kviteseid3_b,canopy_diff_kviteseid3_b,trees_kviteseid3_b[treeheight_kviteseid3_b>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_kviteseid3_b<-tree_hulls(kviteseid3_b,type='convex',field='treeID')
plot(canopy_diff_kviteseid3_b)
plot(treeout_kviteseid3_b,add=T) 

bigtrees_kviteseid3_b<-which(extract(canopy_diff_kviteseid3_b,treeout_kviteseid3_b,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

kviteseid3_b_clip<-lasclip(kviteseid3_b,treeout_kviteseid3_b@polygons[[bigtrees_kviteseid3_b[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_kviteseid3_b)){
  print(i)
  kviteseid3_b_clip<-lasclip(kviteseid3_b_clip,treeout_kviteseid3_b@polygons[[bigtrees_kviteseid3_b[i]]]@Polygons[[1]],inside=F)}
plot(kviteseid3_b_clip) 

canopy_diff_kviteseid3_b_clip <- (as.raster(grid_canopy(kviteseid3_b_clip,res=0.5))-(crop(as.raster(grid_terrain(kviteseid3_b_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(kviteseid3_b_clip,res=0.5)))))
plot(canopy_diff_kviteseid3_b_clip)

writeRaster(canopy_diff_kviteseid3_b_clip,'Telemark/canopy_height_clipped_raster/kviteseid3_b_canopyheight')

# kviteseid3_ub
terrainmod_kviteseid3_ub <-grid_terrain(kviteseid3_ub,method='knnidw',res=1)
canopymod_kviteseid3_ub  <-grid_canopy(kviteseid3_ub,res=1)


terrainmod_kviteseid3_ub_resampeled <- resample(as.raster(terrainmod_kviteseid3_ub), as.raster(canopymod_kviteseid3_ub, method='bilinear'))
canopy_diff_kviteseid3_ub <- (as.raster(canopymod_kviteseid3_ub)-terrainmod_kviteseid3_ub_resampeled)
plot(canopy_diff_kviteseid3_ub)

trees_kviteseid3_ub<-tree_detection(kviteseid3_ub,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_kviteseid3_ub<-extract(canopy_diff_kviteseid3_ub,trees_kviteseid3_ub[,1:2])

lastrees_dalponte(kviteseid3_ub,canopy_diff_kviteseid3_ub,trees_kviteseid3_ub[treeheight_kviteseid3_ub>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_kviteseid3_ub<-tree_hulls(kviteseid3_ub,type='convex',field='treeID')
plot(canopy_diff_kviteseid3_ub)
plot(treeout_kviteseid3_ub,add=T) 

bigtrees_kviteseid3_ub<-which(extract(canopy_diff_kviteseid3_ub,treeout_kviteseid3_ub,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

kviteseid3_ub_clip<-lasclip(kviteseid3_ub,treeout_kviteseid3_ub@polygons[[bigtrees_kviteseid3_ub[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_kviteseid3_ub)){
  print(i)
  kviteseid3_ub_clip<-lasclip(kviteseid3_ub_clip,treeout_kviteseid3_ub@polygons[[bigtrees_kviteseid3_ub[i]]]@Polygons[[1]],inside=F)}
plot(kviteseid3_ub_clip) 

canopy_diff_kviteseid3_ub_clip <- (as.raster(grid_canopy(kviteseid3_ub_clip,res=0.5))-(crop(as.raster(grid_terrain(kviteseid3_ub_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(kviteseid3_ub_clip,res=0.5)))))
plot(canopy_diff_kviteseid3_ub_clip)

writeRaster(canopy_diff_kviteseid3_ub_clip,'Telemark/canopy_height_clipped_raster/kviteseid3_ub_canopyheight')


# Nome Cappelen 1 ---------------------------------------------------------


# n_cappelen1_b
terrainmod_n_cappelen1_b  <-grid_terrain(n_cappelen1_b, method='knnidw',res=1)
canopymod_n_cappelen1_b   <-grid_canopy(n_cappelen1_b,res=1)

terrainmod_n_cappelen1_b_resampled <-resample(as.raster(terrainmod_n_cappelen1_b), as.raster(canopymod_n_cappelen1_b), method='bilinear')
canopy_diff_n_cappelen1_b<-(as.raster(canopymod_n_cappelen1_b)-terrainmod_n_cappelen1_b_resampled)
plot(canopy_diff_n_cappelen1_b)

trees_n_cappelen1_b<-tree_detection(n_cappelen1_b,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_n_cappelen1_b<-extract(canopy_diff_n_cappelen1_b,trees_n_cappelen1_b[,1:2])

lastrees_dalponte(n_cappelen1_b,canopy_diff_n_cappelen1_b,trees_n_cappelen1_b[treeheight_n_cappelen1_b>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_n_cappelen1_b<-tree_hulls(n_cappelen1_b,type='convex',field='treeID')
plot(canopy_diff_n_cappelen1_b)
plot(treeout_n_cappelen1_b,add=T) 

bigtrees_n_cappelen1_b<-which(extract(canopy_diff_n_cappelen1_b,treeout_n_cappelen1_b,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

n_cappelen1_b_clip<-lasclip(n_cappelen1_b,treeout_n_cappelen1_b@polygons[[bigtrees_n_cappelen1_b[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_n_cappelen1_b)){
  print(i)
  n_cappelen1_b_clip<-lasclip(n_cappelen1_b_clip,treeout_n_cappelen1_b@polygons[[bigtrees_n_cappelen1_b[i]]]@Polygons[[1]],inside=F)}
plot(n_cappelen1_b_clip) 

canopy_diff_n_cappelen1_b_clip <- (as.raster(grid_canopy(n_cappelen1_b_clip,res=0.5))-(crop(as.raster(grid_terrain(n_cappelen1_b_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(n_cappelen1_b_clip,res=0.5)))))
plot(canopy_diff_n_cappelen1_b_clip)

writeRaster(canopy_diff_n_cappelen1_b_clip,'Telemark/canopy_height_clipped_raster/n_cappelen1_b_canopyheight')



# n_cappelen1_ub
terrainmod_n_cappelen1_ub <-grid_terrain(n_cappelen1_ub,method='knnidw',res=1)
canopymod_n_cappelen1_ub  <-grid_canopy(n_cappelen1_ub,res=1)

terrainmod_n_cappelen1_ub_resampeled <- resample(as.raster(terrainmod_n_cappelen1_ub), as.raster(canopymod_n_cappelen1_ub, method='bilinear'))
canopy_diff_n_cappelen1_ub <- (as.raster(canopymod_n_cappelen1_ub)-terrainmod_n_cappelen1_ub_resampeled)
plot(canopy_diff_n_cappelen1_ub)

trees_n_cappelen1_ub<-tree_detection(n_cappelen1_ub,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_n_cappelen1_ub<-extract(canopy_diff_n_cappelen1_ub,trees_n_cappelen1_ub[,1:2])

lastrees_dalponte(n_cappelen1_ub,canopy_diff_n_cappelen1_ub,trees_n_cappelen1_ub[treeheight_n_cappelen1_ub>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_n_cappelen1_ub<-tree_hulls(n_cappelen1_ub,type='convex',field='treeID')
plot(canopy_diff_n_cappelen1_ub)
plot(treeout_n_cappelen1_ub,add=T) 

bigtrees_n_cappelen1_ub<-which(extract(canopy_diff_n_cappelen1_ub,treeout_n_cappelen1_ub,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

n_cappelen1_ub_clip<-lasclip(n_cappelen1_ub,treeout_n_cappelen1_ub@polygons[[bigtrees_n_cappelen1_ub[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_n_cappelen1_ub)){
  print(i)
  n_cappelen1_ub_clip<-lasclip(n_cappelen1_ub_clip,treeout_n_cappelen1_ub@polygons[[bigtrees_n_cappelen1_ub[i]]]@Polygons[[1]],inside=F)}
plot(n_cappelen1_ub_clip) 

canopy_diff_n_cappelen1_ub_clip <- (as.raster(grid_canopy(n_cappelen1_ub_clip,res=0.5))-(crop(as.raster(grid_terrain(n_cappelen1_ub_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(n_cappelen1_ub_clip,res=0.5)))))
plot(canopy_diff_n_cappelen1_ub_clip)

writeRaster(canopy_diff_n_cappelen1_ub_clip,'Telemark/canopy_height_clipped_raster/n_cappelen1_ub_canopyheight')



# Nome Cappelen 2 ---------------------------------------------------------


# n_cappelen2_b
terrainmod_n_cappelen2_b  <-grid_terrain(n_cappelen2_b, method='knnidw',res=1)
canopymod_n_cappelen2_b   <-grid_canopy(n_cappelen2_b,res=1)

terrainmod_n_cappelen2_b_resampled <-resample(as.raster(terrainmod_n_cappelen2_b), as.raster(canopymod_n_cappelen2_b), method='bilinear')
canopy_diff_n_cappelen2_b<-(as.raster(canopymod_n_cappelen2_b)-terrainmod_n_cappelen2_b_resampled)
plot(canopy_diff_n_cappelen2_b)

trees_n_cappelen2_b<-tree_detection(n_cappelen2_b,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_n_cappelen2_b<-extract(canopy_diff_n_cappelen2_b,trees_n_cappelen2_b[,1:2])

lastrees_dalponte(n_cappelen2_b,canopy_diff_n_cappelen2_b,trees_n_cappelen2_b[treeheight_n_cappelen2_b>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_n_cappelen2_b<-tree_hulls(n_cappelen2_b,type='convex',field='treeID')
plot(canopy_diff_n_cappelen2_b)
plot(treeout_n_cappelen2_b,add=T) 

bigtrees_n_cappelen2_b<-which(extract(canopy_diff_n_cappelen2_b,treeout_n_cappelen2_b,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

n_cappelen2_b_clip<-lasclip(n_cappelen2_b,treeout_n_cappelen2_b@polygons[[bigtrees_n_cappelen2_b[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_n_cappelen2_b)){
  print(i)
  n_cappelen2_b_clip<-lasclip(n_cappelen2_b_clip,treeout_n_cappelen2_b@polygons[[bigtrees_n_cappelen2_b[i]]]@Polygons[[1]],inside=F)}
plot(n_cappelen2_b_clip) 

canopy_diff_n_cappelen2_b_clip <- (as.raster(grid_canopy(n_cappelen2_b_clip,res=0.5))-(crop(as.raster(grid_terrain(n_cappelen2_b_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(n_cappelen2_b_clip,res=0.5)))))
plot(canopy_diff_n_cappelen2_b_clip)

writeRaster(canopy_diff_n_cappelen2_b_clip,'Telemark/canopy_height_clipped_raster/n_cappelen2_b_canopyheight')


# n_cappelen2_ub
terrainmod_n_cappelen2_ub <-grid_terrain(n_cappelen2_ub,method='knnidw',res=1)
canopymod_n_cappelen2_ub  <-grid_canopy(n_cappelen2_ub,res=1)


terrainmod_n_cappelen2_ub_resampeled <- resample(as.raster(terrainmod_n_cappelen2_ub), as.raster(canopymod_n_cappelen2_ub, method='bilinear'))
canopy_diff_n_cappelen2_ub <- (as.raster(canopymod_n_cappelen2_ub)-terrainmod_n_cappelen2_ub_resampeled)
plot(canopy_diff_n_cappelen2_ub)

trees_n_cappelen2_ub<-tree_detection(n_cappelen2_ub,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_n_cappelen2_ub<-extract(canopy_diff_n_cappelen2_ub,trees_n_cappelen2_ub[,1:2])

lastrees_dalponte(n_cappelen2_ub,canopy_diff_n_cappelen2_ub,trees_n_cappelen2_ub[treeheight_n_cappelen2_ub>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_n_cappelen2_ub<-tree_hulls(n_cappelen2_ub,type='convex',field='treeID')
plot(canopy_diff_n_cappelen2_ub)
plot(treeout_n_cappelen2_ub,add=T) 

bigtrees_n_cappelen2_ub<-which(extract(canopy_diff_n_cappelen2_ub,treeout_n_cappelen2_ub,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

n_cappelen2_ub_clip<-lasclip(n_cappelen2_ub,treeout_n_cappelen2_ub@polygons[[bigtrees_n_cappelen2_ub[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_n_cappelen2_ub)){
  print(i)
  n_cappelen2_ub_clip<-lasclip(n_cappelen2_ub_clip,treeout_n_cappelen2_ub@polygons[[bigtrees_n_cappelen2_ub[i]]]@Polygons[[1]],inside=F)}
plot(n_cappelen2_ub_clip) 

canopy_diff_n_cappelen2_ub_clip <- (as.raster(grid_canopy(n_cappelen2_ub_clip,res=0.5))-(crop(as.raster(grid_terrain(n_cappelen2_ub_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(n_cappelen2_ub_clip,res=0.5)))))
plot(canopy_diff_n_cappelen2_ub_clip)

writeRaster(canopy_diff_n_cappelen2_ub_clip,'Telemark/canopy_height_clipped_raster/n_cappelen2_ub_canopyheight')


# Notodden 3 --------------------------------------------------------------


# notodden3_b
terrainmod_notodden3_b  <-grid_terrain(notodden3_b, method='knnidw',res=1)
canopymod_notodden3_b   <-grid_canopy(notodden3_b,res=1)

terrainmod_notodden3_b_resampled <-resample(as.raster(terrainmod_notodden3_b), as.raster(canopymod_notodden3_b), method='bilinear')
canopy_diff_notodden3_b<-(as.raster(canopymod_notodden3_b)-terrainmod_notodden3_b_resampled)
plot(canopy_diff_notodden3_b)
#max 3,282

writeRaster(canopy_diff_notodden3_b,'Telemark/canopy_height_clipped_raster/notodden3_b_canopyheight')


# notodden3_b
terrainmod_notodden3_ub <-grid_terrain(notodden3_ub,method='knnidw',res=1)
canopymod_notodden3_ub  <-grid_canopy(notodden3_ub,res=1)


terrainmod_notodden3_ub_resampeled <- resample(as.raster(terrainmod_notodden3_ub), as.raster(canopymod_notodden3_ub, method='bilinear'))
canopy_diff_notodden3_ub <- (as.raster(canopymod_notodden3_ub)-terrainmod_notodden3_ub_resampeled)
plot(canopy_diff_notodden3_ub)
#max 4,091

writeRaster(canopy_diff_notodden3_ub,'Telemark/canopy_height_clipped_raster/notodden3_ub_canopyheight')


# Notodden 5 --------------------------------------------------------------


# notodden5_b
terrainmod_notodden5_b  <-grid_terrain(notodden5_b, method='knnidw',res=1)
canopymod_notodden5_b   <-grid_canopy(notodden5_b,res=1)

terrainmod_notodden5_b_resampled <-resample(as.raster(terrainmod_notodden5_b), as.raster(canopymod_notodden5_b), method='bilinear')
canopy_diff_notodden5_b<-(as.raster(canopymod_notodden5_b)-terrainmod_notodden5_b_resampled)
plot(canopy_diff_notodden5_b)

trees_notodden5_b<-tree_detection(notodden5_b,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_notodden5_b<-extract(canopy_diff_notodden5_b,trees_notodden5_b[,1:2])

lastrees_dalponte(notodden5_b,canopy_diff_notodden5_b,trees_notodden5_b[treeheight_notodden5_b>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_notodden5_b<-tree_hulls(notodden5_b,type='convex',field='treeID')
plot(canopy_diff_notodden5_b)
plot(treeout_notodden5_b,add=T) 

bigtrees_notodden5_b<-which(extract(canopy_diff_notodden5_b,treeout_notodden5_b,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

notodden5_b_clip<-lasclip(notodden5_b,treeout_notodden5_b@polygons[[bigtrees_notodden5_b[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_notodden5_b)){
  print(i)
  notodden5_b_clip<-lasclip(notodden5_b_clip,treeout_notodden5_b@polygons[[bigtrees_notodden5_b[i]]]@Polygons[[1]],inside=F)}
plot(notodden5_b_clip) 

canopy_diff_notodden5_b_clip <- (as.raster(grid_canopy(notodden5_b_clip,res=0.5))-(crop(as.raster(grid_terrain(notodden5_b_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(notodden5_b_clip,res=0.5)))))
plot(canopy_diff_notodden5_b_clip)

writeRaster(canopy_diff_notodden5_b_clip,'Telemark/canopy_height_clipped_raster/notodden5_b_canopyheight')

# notodden5_ub
terrainmod_notodden5_ub <-grid_terrain(notodden5_ub,method='knnidw',res=1)
canopymod_notodden5_ub  <-grid_canopy(notodden5_ub,res=1)


terrainmod_notodden5_ub_resampeled <- resample(as.raster(terrainmod_notodden5_ub), as.raster(canopymod_notodden5_ub, method='bilinear'))
canopy_diff_notodden5_ub <- (as.raster(canopymod_notodden5_ub)-terrainmod_notodden5_ub_resampeled)
plot(canopy_diff_notodden5_ub)
#max 3,495

writeRaster(canopy_diff_notodden5_ub,'Telemark/canopy_height_clipped_raster/notodden5_ub_canopyheight')



# Notodden 6 --------------------------------------------------------------


# notodden6_b
terrainmod_notodden6_b  <-grid_terrain(notodden6_b, method='knnidw',res=1)
canopymod_notodden6_b   <-grid_canopy(notodden6_b,res=1)

terrainmod_notodden6_b_resampled <-resample(as.raster(terrainmod_notodden6_b), as.raster(canopymod_notodden6_b), method='bilinear')
canopy_diff_notodden6_b<-(as.raster(canopymod_notodden6_b)-terrainmod_notodden6_b_resampled)
plot(canopy_diff_notodden6_b)
#max 4,725

writeRaster(canopy_diff_notodden6_b,'Telemark/canopy_height_clipped_raster/notodden6_b_canopyheight')


# notodden6_ub
terrainmod_notodden6_ub <-grid_terrain(notodden6_ub,method='knnidw',res=1)
canopymod_notodden6_ub  <-grid_canopy(notodden6_ub,res=1)

terrainmod_notodden6_ub_resampeled <- resample(as.raster(terrainmod_notodden6_ub), as.raster(canopymod_notodden6_ub, method='bilinear'))
canopy_diff_notodden6_ub <- (as.raster(canopymod_notodden6_ub)-terrainmod_notodden6_ub_resampeled)
plot(canopy_diff_notodden6_ub)


trees_notodden6_ub<-tree_detection(notodden6_ub,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_notodden6_ub<-extract(canopy_diff_notodden6_ub,trees_notodden6_ub[,1:2])

lastrees_dalponte(notodden6_ub,canopy_diff_notodden6_ub,trees_notodden6_ub[treeheight_notodden6_ub>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_notodden6_ub<-tree_hulls(notodden6_ub,type='convex',field='treeID')
plot(canopy_diff_notodden6_ub)
plot(treeout_notodden6_ub,add=T) 

bigtrees_notodden6_ub<-which(extract(canopy_diff_notodden6_ub,treeout_notodden6_ub,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

notodden6_ub_clip<-lasclip(notodden6_ub,treeout_notodden6_ub@polygons[[bigtrees_notodden6_ub[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_notodden6_ub)){
  print(i)
  notodden6_ub_clip<-lasclip(notodden6_ub_clip,treeout_notodden6_ub@polygons[[bigtrees_notodden6_ub[i]]]@Polygons[[1]],inside=F)}
plot(notodden6_ub_clip) 

canopy_diff_notodden6_ub_clip <- (as.raster(grid_canopy(notodden6_ub_clip,res=0.5))-(crop(as.raster(grid_terrain(notodden6_ub_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(notodden6_ub_clip,res=0.5)))))
plot(canopy_diff_notodden6_ub_clip)

writeRaster(canopy_diff_notodden6_ub_clip,'Telemark/canopy_height_clipped_raster/notodden6_ub_canopyheight')






# Hedmark og Akershus -----------------------------------------------------


# Didrik Holmsen ----------------------------------------------------------


# Didrik Holmsen_b
terrainmod_didrik_holmsen_b  <-grid_terrain(didrik_holmsen_b, method='knnidw',res=1)
canopymod_didrik_holmsen_b   <-grid_canopy(didrik_holmsen_b,res=1)

terrainmod_didrik_holmsen_b_resampled <-resample(as.raster(terrainmod_didrik_holmsen_b), as.raster(canopymod_didrik_holmsen_b), method='bilinear')
canopy_diff_didrik_holmsen_b<-(as.raster(canopymod_didrik_holmsen_b)-terrainmod_didrik_holmsen_b_resampled)
plot(canopy_diff_didrik_holmsen_b)
canopy_diff_didrik_holmsen_b #max 3

writeRaster(canopy_diff_didrik_holmsen_b,'Hedmark_Akershus/canopy_height_clipped_raster/didrik_holmsen_b_canopyheight')


# Didrik Holmsen_ub
terrainmod_didrik_holmsen_ub <-grid_terrain(didrik_holmsen_ub,method='knnidw',res=1)
canopymod_didrik_holmsen_ub  <-grid_canopy(didrik_holmsen_ub,res=1)


terrainmod_didrik_holmsen_ub_resampeled <- resample(as.raster(terrainmod_didrik_holmsen_ub), as.raster(canopymod_didrik_holmsen_ub, method='bilinear'))
canopy_diff_didrik_holmsen_ub <- (as.raster(canopymod_didrik_holmsen_ub)-terrainmod_didrik_holmsen_ub_resampeled)
plot(canopy_diff_didrik_holmsen_ub)
canopy_diff_didrik_holmsen_ub #max 4,7

writeRaster(canopy_diff_didrik_holmsen_ub,'Hedmark_Akershus/canopy_height_clipped_raster/didrik_holmsen_ub_canopyheight')


# Eidskog -----------------------------------------------------------------


#Eidskog_b
terrainmod_eidskog_b  <-grid_terrain(eidskog_b, method='knnidw',res=1)
canopymod_eidskog_b   <-grid_canopy(eidskog_b,res=1)

terrainmod_eidskog_b_resampled <-resample(as.raster(terrainmod_eidskog_b), as.raster(canopymod_eidskog_b), method='bilinear')
canopy_diff_eidskog_b<-(as.raster(canopymod_eidskog_b)-terrainmod_eidskog_b_resampled)
plot(canopy_diff_eidskog_b)

trees_eidskog_b<-tree_detection(eidskog_b,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_eidskog_b<-extract(canopy_diff_eidskog_b,trees_eidskog_b[,1:2])

lastrees_dalponte(eidskog_b,canopy_diff_eidskog_b,trees_eidskog_b[treeheight_eidskog_b>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_eidskog_b<-tree_hulls(eidskog_b,type='convex',field='treeID')
plot(canopy_diff_eidskog_b)
plot(treeout_eidskog_b,add=T) 

bigtrees_eidskog_b<-which(extract(canopy_diff_eidskog_b,treeout_eidskog_b,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

eidskog_b_clip<-lasclip(eidskog_b,treeout_eidskog_b@polygons[[bigtrees_eidskog_b[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_eidskog_b)){
  print(i)
  eidskog_b_clip<-lasclip(eidskog_b_clip,treeout_eidskog_b@polygons[[bigtrees_eidskog_b[i]]]@Polygons[[1]],inside=F)}
plot(eidskog_b_clip) 

canopy_diff_eidskog_b_clip <- (as.raster(grid_canopy(eidskog_b_clip,res=0.5))-(crop(as.raster(grid_terrain(eidskog_b_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(eidskog_b_clip,res=0.5)))))
plot(canopy_diff_eidskog_b_clip)

writeRaster(canopy_diff_eidskog_b_clip,'Hedmark_Akershus/canopy_height_clipped_raster/eidskog_b_canopyheight')



#Eidskog_ub
terrainmod_eidskog_ub <-grid_terrain(eidskog_ub,method='knnidw',res=1)
canopymod_eidskog_ub  <-grid_canopy(eidskog_ub,res=1)

terrainmod_eidskog_ub_resampeled <- resample(as.raster(terrainmod_eidskog_ub), as.raster(canopymod_eidskog_ub, method='bilinear'))
canopy_diff_eidskog_ub <- (as.raster(canopymod_eidskog_ub)-terrainmod_eidskog_ub_resampeled)
plot(canopy_diff_eidskog_ub)


trees_eidskog_ub<-tree_detection(eidskog_ub,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_eidskog_ub<-extract(canopy_diff_eidskog_ub,trees_eidskog_ub[,1:2])

lastrees_dalponte(eidskog_ub,canopy_diff_eidskog_ub,trees_eidskog_ub[treeheight_eidskog_ub>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_eidskog_ub<-tree_hulls(eidskog_ub,type='convex',field='treeID')
plot(canopy_diff_eidskog_ub)
plot(treeout_eidskog_ub,add=T) 

bigtrees_eidskog_ub<-which(extract(canopy_diff_eidskog_ub,treeout_eidskog_ub,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

eidskog_ub_clip<-lasclip(eidskog_ub,treeout_eidskog_ub@polygons[[bigtrees_eidskog_ub[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_eidskog_ub)){
  print(i)
  eidskog_ub_clip<-lasclip(eidskog_ub_clip,treeout_eidskog_ub@polygons[[bigtrees_eidskog_ub[i]]]@Polygons[[1]],inside=F)}
plot(eidskog_ub_clip) 

canopy_diff_eidskog_ub_clip <- (as.raster(grid_canopy(eidskog_ub_clip,res=0.5))-(crop(as.raster(grid_terrain(eidskog_ub_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(eidskog_ub_clip,res=0.5)))))
plot(canopy_diff_eidskog_ub_clip)

writeRaster(canopy_diff_eidskog_ub_clip,'Hedmark_Akershus/canopy_height_clipped_raster/eidskog_ub_canopyheight')


# Fet3 --------------------------------------------------------------------


# Fet3_b
terrainmod_fet3_b  <-grid_terrain(fet3_b, method='knnidw',res=1)
canopymod_fet3_b   <-grid_canopy(fet3_b,res=1)

terrainmod_fet3_b_resampled <-resample(as.raster(terrainmod_fet3_b), as.raster(canopymod_fet3_b), method='bilinear')
canopy_diff_fet3_b<-(as.raster(canopymod_fet3_b)-terrainmod_fet3_b_resampled)
plot(canopy_diff_fet3_b)
canopy_diff_fet3_b# max 2

writeRaster(canopy_diff_fet3_b,'Hedmark_Akershus/canopy_height_clipped_raster/fet3_b_canopyheight')



# Fet3_ub
terrainmod_fet3_ub <-grid_terrain(fet3_ub,method='knnidw',res=1)
canopymod_fet3_ub  <-grid_canopy(fet3_ub,res=1)


terrainmod_fet3_ub_resampeled <- resample(as.raster(terrainmod_fet3_ub), as.raster(canopymod_fet3_ub, method='bilinear'))
canopy_diff_fet3_ub <- (as.raster(canopymod_fet3_ub)-terrainmod_fet3_ub_resampeled)
plot(canopy_diff_fet3_ub)
canopy_diff_fet3_ub #max 6,6

writeRaster(canopy_diff_fet3_ub,'Hedmark_Akershus/canopy_height_clipped_raster/fet3_ub_canopyheight')



# h_pramhus ---------------------------------------------------------------


# h_pramhus_b
terrainmod_h_pramhus_b  <-grid_terrain(h_pramhus_b, method='knnidw',res=1)
canopymod_h_pramhus_b   <-grid_canopy(h_pramhus_b,res=1)

terrainmod_h_pramhus_b_resampled <-resample(as.raster(terrainmod_h_pramhus_b), as.raster(canopymod_h_pramhus_b), method='bilinear')
canopy_diff_h_pramhus_b<-(as.raster(canopymod_h_pramhus_b)-terrainmod_h_pramhus_b_resampled)
plot(canopy_diff_h_pramhus_b)
#max 4,5
writeRaster(canopy_diff_h_pramhus_b,'Hedmark_Akershus/canopy_height_clipped_raster/h_pramhus_b_canopyheight')


# h_pramhus_ub
terrainmod_h_pramhus_ub <-grid_terrain(h_pramhus_ub,method='knnidw',res=1)
canopymod_h_pramhus_ub  <-grid_canopy(h_pramhus_ub,res=1)

terrainmod_h_pramhus_ub_resampeled <- resample(as.raster(terrainmod_h_pramhus_ub), as.raster(canopymod_h_pramhus_ub, method='bilinear'))
canopy_diff_h_pramhus_ub <- (as.raster(canopymod_h_pramhus_ub)-terrainmod_h_pramhus_ub_resampeled)
plot(canopy_diff_h_pramhus_ub)

#1 outlying very high point (like a bird?)
cellStats(canopy_diff_h_pramhus_ub,stat='max')
canopy_diff_h_pramhus_ub[canopy_diff_h_pramhus_ub>300] <- NA
canopy_diff_h_pramhus_ub #max 6,3
plot(canopy_diff_h_pramhus_ub)

writeRaster(canopy_diff_h_pramhus_ub,'Hedmark_Akershus/canopy_height_clipped_raster/h_pramhus_ub_canopyheight')


# Stangeskovene Aurskog ---------------------------------------------------


# stangeskovene aurskog_b
terrainmod_stangesk_aurskog_b  <-grid_terrain(stangesk_aurskog_b, method='knnidw',res=1)
canopymod_stangesk_aurskog_b   <-grid_canopy(stangesk_aurskog_b,res=1)

terrainmod_stangesk_aurskog_b_resampled <-resample(as.raster(terrainmod_stangesk_aurskog_b), as.raster(canopymod_stangesk_aurskog_b), method='bilinear')
canopy_diff_stangesk_aurskog_b<-(as.raster(canopymod_stangesk_aurskog_b)-terrainmod_stangesk_aurskog_b_resampled)
plot(canopy_diff_stangesk_aurskog_b)

trees_stangesk_aurskog_b<-tree_detection(stangesk_aurskog_b,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_stangesk_aurskog_b<-extract(canopy_diff_stangesk_aurskog_b,trees_stangesk_aurskog_b[,1:2])

lastrees_dalponte(stangesk_aurskog_b,canopy_diff_stangesk_aurskog_b,trees_stangesk_aurskog_b[treeheight_stangesk_aurskog_b>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_stangesk_aurskog_b<-tree_hulls(stangesk_aurskog_b,type='convex',field='treeID')
plot(canopy_diff_stangesk_aurskog_b)
plot(treeout_stangesk_aurskog_b,add=T) 

bigtrees_stangesk_aurskog_b<-which(extract(canopy_diff_stangesk_aurskog_b,treeout_stangesk_aurskog_b,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

stangesk_aurskog_b_clip<-lasclip(stangesk_aurskog_b,treeout_stangesk_aurskog_b@polygons[[bigtrees_stangesk_aurskog_b[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_stangesk_aurskog_b)){
  print(i)
  stangesk_aurskog_b_clip<-lasclip(stangesk_aurskog_b_clip,treeout_stangesk_aurskog_b@polygons[[bigtrees_stangesk_aurskog_b[i]]]@Polygons[[1]],inside=F)}
plot(stangesk_aurskog_b_clip) 

canopy_diff_stangesk_aurskog_b_clip <- (as.raster(grid_canopy(stangesk_aurskog_b_clip,res=0.5))-(crop(as.raster(grid_terrain(stangesk_aurskog_b_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(stangesk_aurskog_b_clip,res=0.5)))))
plot(canopy_diff_stangesk_aurskog_b_clip)

writeRaster(canopy_diff_stangesk_aurskog_b_clip,'Hedmark_Akershus/canopy_height_clipped_raster/stangesk_aurskog_b_canopyheight')


# stangeskovene aurskog_ub
terrainmod_stangesk_aurskog_ub <-grid_terrain(stangesk_aurskog_ub,method='knnidw',res=1)
canopymod_stangesk_aurskog_ub  <-grid_canopy(stangesk_aurskog_ub,res=1)

terrainmod_stangesk_aurskog_ub_resampeled <- resample(as.raster(terrainmod_stangesk_aurskog_ub), as.raster(canopymod_stangesk_aurskog_ub, method='bilinear'))
canopy_diff_stangesk_aurskog_ub <- (as.raster(canopymod_stangesk_aurskog_ub)-terrainmod_stangesk_aurskog_ub_resampeled)
plot(canopy_diff_stangesk_aurskog_ub)
#max 5

writeRaster(canopy_diff_stangesk_aurskog_ub,'Hedmark_Akershus/canopy_height_clipped_raster/stangesk_aurskog_ub_canopyheight')



# Stangeskovene eidskog ---------------------------------------------------


# stangeskovene eidskog_b
terrainmod_stangesk_eidskog_b  <-grid_terrain(stangesk_eidskog_b, method='knnidw',res=1)
canopymod_stangesk_eidskog_b   <-grid_canopy(stangesk_eidskog_b,res=1)

terrainmod_stangesk_eidskog_b_resampled <-resample(as.raster(terrainmod_stangesk_eidskog_b), as.raster(canopymod_stangesk_eidskog_b), method='bilinear')
canopy_diff_stangesk_eidskog_b<-(as.raster(canopymod_stangesk_eidskog_b)-terrainmod_stangesk_eidskog_b_resampled)
plot(canopy_diff_stangesk_eidskog_b)
#Max 3

writeRaster(canopy_diff_stangesk_eidskog_b,'Hedmark_Akershus/canopy_height_clipped_raster/stangesk_eidskog_b_canopyheight')


# stangeskovene eidskog_ub
terrainmod_stangesk_eidskog_ub <-grid_terrain(stangesk_eidskog_ub,method='knnidw',res=1)
canopymod_stangesk_eidskog_ub  <-grid_canopy(stangesk_eidskog_ub,res=1)

terrainmod_stangesk_eidskog_ub_resampeled <- resample(as.raster(terrainmod_stangesk_eidskog_ub), as.raster(canopymod_stangesk_eidskog_ub, method='bilinear'))
canopy_diff_stangesk_eidskog_ub <- (as.raster(canopymod_stangesk_eidskog_ub)-terrainmod_stangesk_eidskog_ub_resampeled)
plot(canopy_diff_stangesk_eidskog_ub)

trees_stangesk_eidskog_ub<-tree_detection(stangesk_eidskog_ub,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_stangesk_eidskog_ub<-extract(canopy_diff_stangesk_eidskog_ub,trees_stangesk_eidskog_ub[,1:2])

lastrees_dalponte(stangesk_eidskog_ub,canopy_diff_stangesk_eidskog_ub,trees_stangesk_eidskog_ub[treeheight_stangesk_eidskog_ub>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_stangesk_eidskog_ub<-tree_hulls(stangesk_eidskog_ub,type='convex',field='treeID')
plot(canopy_diff_stangesk_eidskog_ub)
plot(treeout_stangesk_eidskog_ub,add=T) 

bigtrees_stangesk_eidskog_ub<-which(extract(canopy_diff_stangesk_eidskog_ub,treeout_stangesk_eidskog_ub,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

stangesk_eidskog_ub_clip<-lasclip(stangesk_eidskog_ub,treeout_stangesk_eidskog_ub@polygons[[bigtrees_stangesk_eidskog_ub[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_stangesk_eidskog_ub)){
  print(i)
  stangesk_eidskog_ub_clip<-lasclip(stangesk_eidskog_ub_clip,treeout_stangesk_eidskog_ub@polygons[[bigtrees_stangesk_eidskog_ub[i]]]@Polygons[[1]],inside=F)}
plot(stangesk_eidskog_ub_clip) 

canopy_diff_stangesk_eidskog_ub_clip <- (as.raster(grid_canopy(stangesk_eidskog_ub_clip,res=0.5))-(crop(as.raster(grid_terrain(stangesk_eidskog_ub_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(stangesk_eidskog_ub_clip,res=0.5)))))
plot(canopy_diff_stangesk_eidskog_ub_clip)

writeRaster(canopy_diff_stangesk_eidskog_ub_clip,'Hedmark_Akershus/canopy_height_clipped_raster/stangesk_eidskog_ub_canopyheight')


# Stig Dahlen -------------------------------------------------------------


# stig_dahlen_b
terrainmod_stig_dahlen_b  <-grid_terrain(stig_dahlen_b, method='knnidw',res=1)
canopymod_stig_dahlen_b   <-grid_canopy(stig_dahlen_b,res=1)

terrainmod_stig_dahlen_b_resampled <-resample(as.raster(terrainmod_stig_dahlen_b), as.raster(canopymod_stig_dahlen_b), method='bilinear')
canopy_diff_stig_dahlen_b<-(as.raster(canopymod_stig_dahlen_b)-terrainmod_stig_dahlen_b_resampled)
plot(canopy_diff_stig_dahlen_b)
#max2,9

writeRaster(canopy_diff_stig_dahlen_b,'Hedmark_Akershus/canopy_height_clipped_raster/stig_dahlen_b_canopyheight')

# stig_dahlen_ub
terrainmod_stig_dahlen_ub <-grid_terrain(stig_dahlen_ub,method='knnidw',res=1)
canopymod_stig_dahlen_ub  <-grid_canopy(stig_dahlen_ub,res=1)

terrainmod_stig_dahlen_ub_resampeled <- resample(as.raster(terrainmod_stig_dahlen_ub), as.raster(canopymod_stig_dahlen_ub, method='bilinear'))
canopy_diff_stig_dahlen_ub <- (as.raster(canopymod_stig_dahlen_ub)-terrainmod_stig_dahlen_ub_resampeled)
plot(canopy_diff_stig_dahlen_ub)
#max 6,6

writeRaster(canopy_diff_stig_dahlen_ub,'Hedmark_Akershus/canopy_height_clipped_raster/stig_dahlen_ub_canopyheight')



# Truls Holm --------------------------------------------------------------


# truls_holm_b
terrainmod_truls_holm_b  <-grid_terrain(truls_holm_b, method='knnidw',res=1)
canopymod_truls_holm_b   <-grid_canopy(truls_holm_b,res=1)

terrainmod_truls_holm_b_resampled <-resample(as.raster(terrainmod_truls_holm_b), as.raster(canopymod_truls_holm_b), method='bilinear')
canopy_diff_truls_holm_b<-(as.raster(canopymod_truls_holm_b)-terrainmod_truls_holm_b_resampled)
plot(canopy_diff_truls_holm_b)
#max 3,3

writeRaster(canopy_diff_truls_holm_b,'Hedmark_Akershus/canopy_height_clipped_raster/truls_holm_b_canopyheight')


# truls_holm_ub
terrainmod_truls_holm_ub <-grid_terrain(truls_holm_ub,method='knnidw',res=1)
canopymod_truls_holm_ub  <-grid_canopy(truls_holm_ub,res=1)


terrainmod_truls_holm_ub_resampeled <- resample(as.raster(terrainmod_truls_holm_ub), as.raster(canopymod_truls_holm_ub, method='bilinear'))
canopy_diff_truls_holm_ub <- (as.raster(canopymod_truls_holm_ub)-terrainmod_truls_holm_ub_resampeled)
plot(canopy_diff_truls_holm_ub)
#max 4,028

writeRaster(canopy_diff_truls_holm_ub,'Hedmark_Akershus/canopy_height_clipped_raster/truls_holm_ub_canopyheight')








# Test --------------------------------------------------------------------


# remove tall trees -see tree identification and masking
#test_list <- c(canopy_diff_bratsberg_b, canopy_diff_bratsberg_ub, canopy_diff_didrik_holmsen_b, canopy_diff_didrik_holmsen_ub)
#for (i in test_list) {
  
#}
#Funker det å lage for loop når trefjerningsalgoritmen tar inn både lasfila b eller ub og canopy difference fila? 

  
#calculate mean canopy height?
cellStats(canopy_diff_bratsberg_b, stat = 'mean')
cellStats(canopy_diff_bratsberg_ub, stat = 'mean')
cellStats(canopy_diff_bratsberg_b, stat = 'sd')
cellStats(canopy_diff_bratsberg_ub, stat = 'sd')


#Test: work flow: las -> canopy diff -> clip out big trees -> make new las without big trees -> canopy diff
#Bratsberg
terrainmod_bratsberg_b  <-grid_terrain(bratsberg_b, method='knnidw',res=1)
canopymod_bratsberg_b   <-grid_canopy(bratsberg_b,res=1)


terrainmod_bratsberg_b_resampled <-resample(as.raster(terrainmod_bratsberg_b), as.raster(canopymod_bratsberg_b), method='bilinear')
canopy_diff_bratsberg_b<-(as.raster(canopymod_bratsberg_b)-terrainmod_bratsberg_b_resampled)
plot(canopy_diff_bratsberg_b)

#Tree detection
trees_bratsberg_b<-tree_detection(bratsberg_b,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_bratsberg_b<-extract(canopy_diff_bratsberg_b,trees_bratsberg_b[,1:2])

lastrees_dalponte(bratsberg_b,canopy_diff_bratsberg_b,trees_bratsberg_b[treeheight_bratsberg_b>=4,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)
#Lastrees_dalponte seems to be the best method as it allows use of a canopy model.
#need to look further into arguments to ensure that whole tree is segmented


#Now make hulls around the trees
treeout<-tree_hulls(bratsberg_b,type='convex',field='treeID')

plot(canopy_diff_bratsberg_b)
plot(treeout,add=T) # These regions seem to be the big trees. Clip these out...

#Those greater than 7m
bigtrees<-which(extract(canopy_diff_bratsberg_b,treeout,fun=max,na.rm=T)>4)

#Clip out trees
bclip<-lasclip(bratsberg_b,treeout@polygons[[bigtrees[1]]]@Polygons[[1]],inside=F)
for(i in 2:length(bigtrees)){
  print(i)
  bclip<-lasclip(bclip,treeout@polygons[[bigtrees[i]]]@Polygons[[1]],inside=F)}
plot(bclip) 

plot(as.raster(grid_canopy(bclip,res=0.5))-(crop(as.raster(grid_terrain(bclip,method='knnidw',res=0.5)),as.raster(grid_canopy(bclip,res=0.5)))))


##Reading raster

test <- raster('Trondelag/canopy_height_clipped_raster/bratsberg_b_canopyheight')
plot(test)