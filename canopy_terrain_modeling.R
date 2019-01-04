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







# Trøndelag ---------------------------------------------------------------
#Make canopy and terrain TIN models for each treatment, and plot difference between canopy and terrain model


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

bigtrees_bratsberg_b<-which(extract(canopy_diff_bratsberg_b,treeout_bratsberg_b,fun=max,na.rm=T)>7) #identify trees larger than 7m

bratsberg_b_clip<-lasclip(bratsberg_b,treeout_bratsberg_b@polygons[[bigtrees_bratsberg_b[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_bratsberg_b)){
  print(i)
  bratsberg_b_clip<-lasclip(bratsberg_b_clip,treeout_bratsberg_b@polygons[[bigtrees_bratsberg_b[i]]]@Polygons[[1]],inside=F)}
plot(bratsberg_b_clip) #point cloud without large trees

canopy_diff_bratsberg_b_clip <- (as.raster(grid_canopy(bratsberg_b_clip,res=0.5))-(crop(as.raster(grid_terrain(bratsberg_b_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(bratsberg_b_clip,res=0.5)))))
plot(canopy_diff_bratsberg_b_clip)

 #Bratsberg_ub
terrainmod_bratsberg_ub <-grid_terrain(bratsberg_ub,method='knnidw',res=1)
canopymod_bratsberg_ub   <-grid_canopy(bratsberg_ub,res=1)

terrainmod_bratsberg_ub_resampeled <- resample(as.raster(terrainmod_bratsberg_ub), as.raster(canopymod_bratsberg_ub, method='bilinear'))
canopy_diff_bratsberg_ub <- (as.raster(canopymod_bratsberg_ub)-terrainmod_bratsberg_ub_resampeled)
plot(canopy_diff_bratsberg_ub)

#Remove large trees, first detect and create treeID
trees_bratsberg_ub<-tree_detection(bratsberg_ub,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_bratsberg_ub<-extract(canopy_diff_bratsberg_ub,trees_bratsberg_ub[,1:2])

lastrees_dalponte(bratsberg_ub,canopy_diff_bratsberg_ub,trees_bratsberg_ub[treeheight_bratsberg_ub>=4,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

#Make hulls around the trees
treeout_bratsberg_ub<-tree_hulls(bratsberg_ub,type='convex',field='treeID')
plot(canopy_diff_bratsberg_ub)
plot(treeout_bratsberg_ub,add=T) 

bigtrees_bratsberg_ub<-which(extract(canopy_diff_bratsberg_ub,treeout_bratsberg_ub,fun=max,na.rm=T)>8) #identify trees larger than 8m

bratsberg_ub_clip<-lasclip(bratsberg_ub,treeout_bratsberg_ub@polygons[[bigtrees_bratsberg_ub[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_bratsberg_ub)){
  print(i)
  bratsberg_ub_clip<-lasclip(bratsberg_ub_clip,treeout_bratsberg_ub@polygons[[bigtrees_bratsberg_ub[i]]]@Polygons[[1]],inside=F)}
plot(bratsberg_ub_clip) #point cloud without large trees

#error when running the for loop here: in is(geometry, "Polygon") : 
#trying to get slot "Polygons" from an object of a basic class ("NULL") with no slots -BUT it looks correct

canopy_diff_bratsberg_ub_clip <- (as.raster(grid_canopy(bratsberg_ub_clip,res=0.5))-(crop(as.raster(grid_terrain(bratsberg_ub_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(bratsberg_ub_clip,res=0.5)))))
plot(canopy_diff_bratsberg_ub_clip)




# Hi_tydal ----------------------------------------------------------------

#Hi_tydal_b
terrainmod_hi_tydal_b  <-grid_terrain(hi_tydal_b, method='knnidw',res=1)
canopymod_hi_tydal_b   <-grid_canopy(hi_tydal_b,res=1)

terrainmod_hi_tydal_b_resampled <-resample(as.raster(terrainmod_hi_tydal_b), as.raster(canopymod_hi_tydal_b), method='bilinear')
canopy_diff_hi_tydal_b<-(as.raster(canopymod_hi_tydal_b)-terrainmod_hi_tydal_b_resampled)
plot(canopy_diff_hi_tydal_b)
#see that the largest trees are 3,5m high,
#unlikely that they left so small trees standing when clear cutting. Conclude: no old trees standing

#Hi_tydal_ub
terrainmod_hi_tydal_ub <-grid_terrain(hi_tydal_ub,method='knnidw',res=1)
canopymod_hi_tydal_ub  <-grid_canopy(hi_tydal_ub,res=1)

terrainmod_hi_tydal_ub_resampled <-resample(as.raster(terrainmod_hi_tydal_ub), as.raster(canopymod_hi_tydal_ub), method='bilinear')
canopy_diff_hi_tydal_ub<-(as.raster(canopymod_hi_tydal_ub)-terrainmod_hi_tydal_ub_resampled)
plot(canopy_diff_hi_tydal_ub)

trees_hi_tydal_ub<-tree_detection(hi_tydal_ub,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_hi_tydal_ub<-extract(canopy_diff_hi_tydal_ub,trees_hi_tydal_ub[,1:2])

lastrees_dalponte(hi_tydal_ub,canopy_diff_hi_tydal_ub,trees_hi_tydal_ub[treeheight_hi_tydal_ub>=4,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_hi_tydal_ub<-tree_hulls(hi_tydal_ub,type='convex',field='treeID')
plot(canopy_diff_hi_tydal_ub)
plot(treeout_hi_tydal_ub,add=T) 

bigtrees_hi_tydal_ub<-which(extract(canopy_diff_hi_tydal_ub,treeout_hi_tydal_ub,fun=max,na.rm=T)>8) #identify trees larger than 8m

hi_tydal_ub_clip<-lasclip(hi_tydal_ub,treeout_hi_tydal_ub@polygons[[bigtrees_hi_tydal_ub[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_hi_tydal_ub)){
  print(i)
  hi_tydal_ub_clip<-lasclip(hi_tydal_ub_clip,treeout_hi_tydal_ub@polygons[[bigtrees_hi_tydal_ub[i]]]@Polygons[[1]],inside=F)}
plot(hi_tydal_ub_clip) #point cloud without large trees

canopy_diff_hi_tydal_ub_clip <- (as.raster(grid_canopy(hi_tydal_ub_clip,res=0.5))-(crop(as.raster(grid_terrain(hi_tydal_ub_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(hi_tydal_ub_clip,res=0.5)))))
plot(canopy_diff_hi_tydal_ub_clip)


# Malvik ------------------------------------------------------------------

#Malvik_b

terrainmod_malvik_b  <-grid_terrain(malvik_b, method='knnidw',res=1)
canopymod_malvik_b   <-grid_canopy(malvik_b,res=1)

terrainmod_malvik_b_resampled <-resample(as.raster(terrainmod_malvik_b), as.raster(canopymod_malvik_b), method='bilinear')
canopy_diff_malvik_b<-(as.raster(canopymod_malvik_b)-terrainmod_malvik_b_resampled)
plot(canopy_diff_malvik_b)



#Malvik_ub
terrainmod_malvik_ub <-grid_terrain(malvik_ub,method='knnidw',res=1)
canopymod_malvik_ub  <-grid_canopy(malvik_ub,res=1)

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

#Drangedal1
terrainmod_drangedal1_b  <-grid_terrain(drangedal1_b, method='knnidw',res=1)
terrainmod_drangedal1_ub <-grid_terrain(drangedal1_ub,method='knnidw',res=1)
canopymod_drangedal1_b   <-grid_canopy(drangedal1_b,res=1)
canopymod_drangedal1_ub  <-grid_canopy(drangedal1_ub,res=1)

terrainmod_drangedal1_b_resampled <-resample(as.raster(terrainmod_drangedal1_b), as.raster(canopymod_drangedal1_b), method='bilinear')
canopy_diff_drangedal1_b<-(as.raster(canopymod_drangedal1_b)-terrainmod_drangedal1_b_resampled)
plot(canopy_diff_drangedal1_b)

terrainmod_drangedal1_ub_resampeled <- resample(as.raster(terrainmod_drangedal1_ub), as.raster(canopymod_drangedal1_ub, method='bilinear'))
canopy_diff_drangedal1_ub <- (as.raster(canopymod_drangedal1_ub)-terrainmod_drangedal1_ub_resampeled)
plot(canopy_diff_drangedal1_ub)


#Drangedal3
terrainmod_drangedal3_b  <-grid_terrain(drangedal3_b, method='knnidw',res=1)
terrainmod_drangedal3_ub <-grid_terrain(drangedal3_ub,method='knnidw',res=1)
canopymod_drangedal3_b   <-grid_canopy(drangedal3_b,res=1)
canopymod_drangedal3_ub  <-grid_canopy(drangedal3_ub,res=1)

terrainmod_drangedal3_b_resampled <-resample(as.raster(terrainmod_drangedal3_b), as.raster(canopymod_drangedal3_b), method='bilinear')
canopy_diff_drangedal3_b<-(as.raster(canopymod_drangedal3_b)-terrainmod_drangedal3_b_resampled)
plot(canopy_diff_drangedal3_b)

terrainmod_drangedal3_ub_resampeled <- resample(as.raster(terrainmod_drangedal3_ub), as.raster(canopymod_drangedal3_ub, method='bilinear'))
canopy_diff_drangedal3_ub <- (as.raster(canopymod_drangedal3_ub)-terrainmod_drangedal3_ub_resampeled)
plot(canopy_diff_drangedal3_ub)


#Drangedal4
terrainmod_drangedal4_b  <-grid_terrain(drangedal4_b, method='knnidw',res=1)
terrainmod_drangedal4_ub <-grid_terrain(drangedal4_ub,method='knnidw',res=1)
canopymod_drangedal4_b   <-grid_canopy(drangedal4_b,res=1)
canopymod_drangedal4_ub  <-grid_canopy(drangedal4_ub,res=1)

terrainmod_drangedal4_b_resampled <-resample(as.raster(terrainmod_drangedal4_b), as.raster(canopymod_drangedal4_b), method='bilinear')
canopy_diff_drangedal4_b<-(as.raster(canopymod_drangedal4_b)-terrainmod_drangedal4_b_resampled)
plot(canopy_diff_drangedal4_b)

terrainmod_drangedal4_ub_resampeled <- resample(as.raster(terrainmod_drangedal4_ub), as.raster(canopymod_drangedal4_ub, method='bilinear'))
canopy_diff_drangedal4_ub <- (as.raster(canopymod_drangedal4_ub)-terrainmod_drangedal4_ub_resampeled)
plot(canopy_diff_drangedal4_ub)


# Fritsoe2
terrainmod_fritsoe2_b  <-grid_terrain(fritsoe2_b, method='knnidw',res=1)
terrainmod_fritsoe2_ub <-grid_terrain(fritsoe2_ub,method='knnidw',res=1)
canopymod_fritsoe2_b   <-grid_canopy(fritsoe2_b,res=1)
canopymod_fritsoe2_ub  <-grid_canopy(fritsoe2_ub,res=1)

terrainmod_fritsoe2_b_resampled <-resample(as.raster(terrainmod_fritsoe2_b), as.raster(canopymod_fritsoe2_b), method='bilinear')
canopy_diff_fritsoe2_b<-(as.raster(canopymod_fritsoe2_b)-terrainmod_fritsoe2_b_resampled)
plot(canopy_diff_fritsoe2_b)

terrainmod_fritsoe2_ub_resampeled <- resample(as.raster(terrainmod_fritsoe2_ub), as.raster(canopymod_fritsoe2_ub, method='bilinear'))
canopy_diff_fritsoe2_ub <- (as.raster(canopymod_fritsoe2_ub)-terrainmod_fritsoe2_ub_resampeled)
plot(canopy_diff_fritsoe2_ub)



# Fritsoe1
terrainmod_fritsoe1_b  <-grid_terrain(fritsoe1_b, method='knnidw',res=1)
terrainmod_fritsoe1_ub <-grid_terrain(fritsoe1_ub,method='knnidw',res=1)
canopymod_fritsoe1_b   <-grid_canopy(fritsoe1_b,res=1)
canopymod_fritsoe1_ub  <-grid_canopy(fritsoe1_ub,res=1)

terrainmod_fritsoe1_b_resampled <-resample(as.raster(terrainmod_fritsoe1_b), as.raster(canopymod_fritsoe1_b), method='bilinear')
canopy_diff_fritsoe1_b<-(as.raster(canopymod_fritsoe1_b)-terrainmod_fritsoe1_b_resampled)
plot(canopy_diff_fritsoe1_b)

terrainmod_fritsoe1_ub_resampeled <- resample(as.raster(terrainmod_fritsoe1_ub), as.raster(canopymod_fritsoe1_ub, method='bilinear'))
canopy_diff_fritsoe1_ub <- (as.raster(canopymod_fritsoe1_ub)-terrainmod_fritsoe1_ub_resampeled)
plot(canopy_diff_fritsoe1_ub)


# Fyresdal
terrainmod_fyresdal_b  <-grid_terrain(fyresdal_b, method='knnidw',res=1)
terrainmod_fyresdal_ub <-grid_terrain(fyresdal_ub,method='knnidw',res=1)
canopymod_fyresdal_b   <-grid_canopy(fyresdal_b,res=1)
canopymod_fyresdal_ub  <-grid_canopy(fyresdal_ub,res=1)

terrainmod_fyresdal_b_resampled <-resample(as.raster(terrainmod_fyresdal_b), as.raster(canopymod_fyresdal_b), method='bilinear')
canopy_diff_fyresdal_b<-(as.raster(canopymod_fyresdal_b)-terrainmod_fyresdal_b_resampled)
plot(canopy_diff_fyresdal_b)

terrainmod_fyresdal_ub_resampeled <- resample(as.raster(terrainmod_fyresdal_ub), as.raster(canopymod_fyresdal_ub, method='bilinear'))
canopy_diff_fyresdal_ub <- (as.raster(canopymod_fyresdal_ub)-terrainmod_fyresdal_ub_resampeled)
plot(canopy_diff_fyresdal_ub)


# kviteseid1
terrainmod_kviteseid1_b  <-grid_terrain(kviteseid1_b, method='knnidw',res=1)
terrainmod_kviteseid1_ub <-grid_terrain(kviteseid1_ub,method='knnidw',res=1)
canopymod_kviteseid1_b   <-grid_canopy(kviteseid1_b,res=1)
canopymod_kviteseid1_ub  <-grid_canopy(kviteseid1_ub,res=1)

terrainmod_kviteseid1_b_resampled <-resample(as.raster(terrainmod_kviteseid1_b), as.raster(canopymod_kviteseid1_b), method='bilinear')
canopy_diff_kviteseid1_b<-(as.raster(canopymod_kviteseid1_b)-terrainmod_kviteseid1_b_resampled)
plot(canopy_diff_kviteseid1_b)

terrainmod_kviteseid1_ub_resampeled <- resample(as.raster(terrainmod_kviteseid1_ub), as.raster(canopymod_kviteseid1_ub, method='bilinear'))
canopy_diff_kviteseid1_ub <- (as.raster(canopymod_kviteseid1_ub)-terrainmod_kviteseid1_ub_resampeled)
plot(canopy_diff_kviteseid1_ub)


# kviteseid2
terrainmod_kviteseid2_b  <-grid_terrain(kviteseid2_b, method='knnidw',res=1)
terrainmod_kviteseid2_ub <-grid_terrain(kviteseid2_ub,method='knnidw',res=1)
canopymod_kviteseid2_b   <-grid_canopy(kviteseid2_b,res=1)
canopymod_kviteseid2_ub  <-grid_canopy(kviteseid2_ub,res=1)

terrainmod_kviteseid2_b_resampled <-resample(as.raster(terrainmod_kviteseid2_b), as.raster(canopymod_kviteseid2_b), method='bilinear')
canopy_diff_kviteseid2_b<-(as.raster(canopymod_kviteseid2_b)-terrainmod_kviteseid2_b_resampled)
plot(canopy_diff_kviteseid2_b)

terrainmod_kviteseid2_ub_resampeled <- resample(as.raster(terrainmod_kviteseid2_ub), as.raster(canopymod_kviteseid2_ub, method='bilinear'))
canopy_diff_kviteseid2_ub <- (as.raster(canopymod_kviteseid2_ub)-terrainmod_kviteseid2_ub_resampeled)
plot(canopy_diff_kviteseid2_ub)


# kviteseid3
terrainmod_kviteseid3_b  <-grid_terrain(kviteseid3_b, method='knnidw',res=1)
terrainmod_kviteseid3_ub <-grid_terrain(kviteseid3_ub,method='knnidw',res=1)
canopymod_kviteseid3_b   <-grid_canopy(kviteseid3_b,res=1)
canopymod_kviteseid3_ub  <-grid_canopy(kviteseid3_ub,res=1)

terrainmod_kviteseid3_b_resampled <-resample(as.raster(terrainmod_kviteseid3_b), as.raster(canopymod_kviteseid3_b), method='bilinear')
canopy_diff_kviteseid3_b<-(as.raster(canopymod_kviteseid3_b)-terrainmod_kviteseid3_b_resampled)
plot(canopy_diff_kviteseid3_b)

terrainmod_kviteseid3_ub_resampeled <- resample(as.raster(terrainmod_kviteseid3_ub), as.raster(canopymod_kviteseid3_ub, method='bilinear'))
canopy_diff_kviteseid3_ub <- (as.raster(canopymod_kviteseid3_ub)-terrainmod_kviteseid3_ub_resampeled)
plot(canopy_diff_kviteseid3_ub)


# n_cappelen1
terrainmod_n_cappelen1_b  <-grid_terrain(n_cappelen1_b, method='knnidw',res=1)
terrainmod_n_cappelen1_ub <-grid_terrain(n_cappelen1_ub,method='knnidw',res=1)
canopymod_n_cappelen1_b   <-grid_canopy(n_cappelen1_b,res=1)
canopymod_n_cappelen1_ub  <-grid_canopy(n_cappelen1_ub,res=1)

terrainmod_n_cappelen1_b_resampled <-resample(as.raster(terrainmod_n_cappelen1_b), as.raster(canopymod_n_cappelen1_b), method='bilinear')
canopy_diff_n_cappelen1_b<-(as.raster(canopymod_n_cappelen1_b)-terrainmod_n_cappelen1_b_resampled)
plot(canopy_diff_n_cappelen1_b)

terrainmod_n_cappelen1_ub_resampeled <- resample(as.raster(terrainmod_n_cappelen1_ub), as.raster(canopymod_n_cappelen1_ub, method='bilinear'))
canopy_diff_n_cappelen1_ub <- (as.raster(canopymod_n_cappelen1_ub)-terrainmod_n_cappelen1_ub_resampeled)
plot(canopy_diff_n_cappelen1_ub)


# n_cappelen2
terrainmod_n_cappelen2_b  <-grid_terrain(n_cappelen2_b, method='knnidw',res=1)
terrainmod_n_cappelen2_ub <-grid_terrain(n_cappelen2_ub,method='knnidw',res=1)
canopymod_n_cappelen2_b   <-grid_canopy(n_cappelen2_b,res=1)
canopymod_n_cappelen2_ub  <-grid_canopy(n_cappelen2_ub,res=1)

terrainmod_n_cappelen2_b_resampled <-resample(as.raster(terrainmod_n_cappelen2_b), as.raster(canopymod_n_cappelen2_b), method='bilinear')
canopy_diff_n_cappelen2_b<-(as.raster(canopymod_n_cappelen2_b)-terrainmod_n_cappelen2_b_resampled)
plot(canopy_diff_n_cappelen2_b)

terrainmod_n_cappelen2_ub_resampeled <- resample(as.raster(terrainmod_n_cappelen2_ub), as.raster(canopymod_n_cappelen2_ub, method='bilinear'))
canopy_diff_n_cappelen2_ub <- (as.raster(canopymod_n_cappelen2_ub)-terrainmod_n_cappelen2_ub_resampeled)
plot(canopy_diff_n_cappelen2_ub)


# notodden3
terrainmod_notodden3_b  <-grid_terrain(notodden3_b, method='knnidw',res=1)
terrainmod_notodden3_ub <-grid_terrain(notodden3_ub,method='knnidw',res=1)
canopymod_notodden3_b   <-grid_canopy(notodden3_b,res=1)
canopymod_notodden3_ub  <-grid_canopy(notodden3_ub,res=1)

terrainmod_notodden3_b_resampled <-resample(as.raster(terrainmod_notodden3_b), as.raster(canopymod_notodden3_b), method='bilinear')
canopy_diff_notodden3_b<-(as.raster(canopymod_notodden3_b)-terrainmod_notodden3_b_resampled)
plot(canopy_diff_notodden3_b)

terrainmod_notodden3_ub_resampeled <- resample(as.raster(terrainmod_notodden3_ub), as.raster(canopymod_notodden3_ub, method='bilinear'))
canopy_diff_notodden3_ub <- (as.raster(canopymod_notodden3_ub)-terrainmod_notodden3_ub_resampeled)
plot(canopy_diff_notodden3_ub)


# notodden5
terrainmod_notodden5_b  <-grid_terrain(notodden5_b, method='knnidw',res=1)
terrainmod_notodden5_ub <-grid_terrain(notodden5_ub,method='knnidw',res=1)
canopymod_notodden5_b   <-grid_canopy(notodden5_b,res=1)
canopymod_notodden5_ub  <-grid_canopy(notodden5_ub,res=1)

terrainmod_notodden5_b_resampled <-resample(as.raster(terrainmod_notodden5_b), as.raster(canopymod_notodden5_b), method='bilinear')
canopy_diff_notodden5_b<-(as.raster(canopymod_notodden5_b)-terrainmod_notodden5_b_resampled)
plot(canopy_diff_notodden5_b)

terrainmod_notodden5_ub_resampeled <- resample(as.raster(terrainmod_notodden5_ub), as.raster(canopymod_notodden5_ub, method='bilinear'))
canopy_diff_notodden5_ub <- (as.raster(canopymod_notodden5_ub)-terrainmod_notodden5_ub_resampeled)
plot(canopy_diff_notodden5_ub)



# notodden6
terrainmod_notodden6_b  <-grid_terrain(notodden6_b, method='knnidw',res=1)
terrainmod_notodden6_ub <-grid_terrain(notodden6_ub,method='knnidw',res=1)
canopymod_notodden6_b   <-grid_canopy(notodden6_b,res=1)
canopymod_notodden6_ub  <-grid_canopy(notodden6_ub,res=1)

terrainmod_notodden6_b_resampled <-resample(as.raster(terrainmod_notodden6_b), as.raster(canopymod_notodden6_b), method='bilinear')
canopy_diff_notodden6_b<-(as.raster(canopymod_notodden6_b)-terrainmod_notodden6_b_resampled)
plot(canopy_diff_notodden6_b)

terrainmod_notodden6_ub_resampeled <- resample(as.raster(terrainmod_notodden6_ub), as.raster(canopymod_notodden6_ub, method='bilinear'))
canopy_diff_notodden6_ub <- (as.raster(canopymod_notodden6_ub)-terrainmod_notodden6_ub_resampeled)
plot(canopy_diff_notodden6_ub)


############################### Hedmark og Akershus ###############################

# Didrik Holmsen
terrainmod_didrik_holmsen_b  <-grid_terrain(didrik_holmsen_b, method='knnidw',res=1)
terrainmod_didrik_holmsen_ub <-grid_terrain(didrik_holmsen_ub,method='knnidw',res=1)
canopymod_didrik_holmsen_b   <-grid_canopy(didrik_holmsen_b,res=1)
canopymod_didrik_holmsen_ub  <-grid_canopy(didrik_holmsen_ub,res=1)

terrainmod_didrik_holmsen_b_resampled <-resample(as.raster(terrainmod_didrik_holmsen_b), as.raster(canopymod_didrik_holmsen_b), method='bilinear')
canopy_diff_didrik_holmsen_b<-(as.raster(canopymod_didrik_holmsen_b)-terrainmod_didrik_holmsen_b_resampled)
plot(canopy_diff_didrik_holmsen_b)

terrainmod_didrik_holmsen_ub_resampeled <- resample(as.raster(terrainmod_didrik_holmsen_ub), as.raster(canopymod_didrik_holmsen_ub, method='bilinear'))
canopy_diff_didrik_holmsen_ub <- (as.raster(canopymod_didrik_holmsen_ub)-terrainmod_didrik_holmsen_ub_resampeled)
plot(canopy_diff_didrik_holmsen_ub)


#Eidskog
terrainmod_eidskog_b  <-grid_terrain(eidskog_b, method='knnidw',res=1)
terrainmod_eidskog_ub <-grid_terrain(eidskog_ub,method='knnidw',res=1)
canopymod_eidskog_b   <-grid_canopy(eidskog_b,res=1)
canopymod_eidskog_ub  <-grid_canopy(eidskog_ub,res=1)

terrainmod_eidskog_b_resampled <-resample(as.raster(terrainmod_eidskog_b), as.raster(canopymod_eidskog_b), method='bilinear')
canopy_diff_eidskog_b<-(as.raster(canopymod_eidskog_b)-terrainmod_eidskog_b_resampled)
plot(canopy_diff_eidskog_b)

terrainmod_eidskog_ub_resampeled <- resample(as.raster(terrainmod_eidskog_ub), as.raster(canopymod_eidskog_ub, method='bilinear'))
canopy_diff_eidskog_ub <- (as.raster(canopymod_eidskog_ub)-terrainmod_eidskog_ub_resampeled)
plot(canopy_diff_eidskog_ub)


# Fet3
terrainmod_fet3_b  <-grid_terrain(fet3_b, method='knnidw',res=1)
terrainmod_fet3_ub <-grid_terrain(fet3_ub,method='knnidw',res=1)
canopymod_fet3_b   <-grid_canopy(fet3_b,res=1)
canopymod_fet3_ub  <-grid_canopy(fet3_ub,res=1)

terrainmod_fet3_b_resampled <-resample(as.raster(terrainmod_fet3_b), as.raster(canopymod_fet3_b), method='bilinear')
canopy_diff_fet3_b<-(as.raster(canopymod_fet3_b)-terrainmod_fet3_b_resampled)
plot(canopy_diff_fet3_b)

terrainmod_fet3_ub_resampeled <- resample(as.raster(terrainmod_fet3_ub), as.raster(canopymod_fet3_ub, method='bilinear'))
canopy_diff_fet3_ub <- (as.raster(canopymod_fet3_ub)-terrainmod_fet3_ub_resampeled)
plot(canopy_diff_fet3_ub)


# h_pramhus Noe galt i clipping script enda, derfor blir ub plot rart her og
terrainmod_h_pramhus_b  <-grid_terrain(h_pramhus_b, method='knnidw',res=1)
terrainmod_h_pramhus_ub <-grid_terrain(h_pramhus_ub,method='knnidw',res=1)
canopymod_h_pramhus_b   <-grid_canopy(h_pramhus_b,res=1)
canopymod_h_pramhus_ub  <-grid_canopy(h_pramhus_ub,res=1)

terrainmod_h_pramhus_b_resampled <-resample(as.raster(terrainmod_h_pramhus_b), as.raster(canopymod_h_pramhus_b), method='bilinear')
canopy_diff_h_pramhus_b<-(as.raster(canopymod_h_pramhus_b)-terrainmod_h_pramhus_b_resampled)
plot(canopy_diff_h_pramhus_b)

terrainmod_h_pramhus_ub_resampeled <- resample(as.raster(terrainmod_h_pramhus_ub), as.raster(canopymod_h_pramhus_ub, method='bilinear'))
canopy_diff_h_pramhus_ub <- (as.raster(canopymod_h_pramhus_ub)-terrainmod_h_pramhus_ub_resampeled)
plot(canopy_diff_h_pramhus_ub)

#1 outlying very high point (like a bird?)
cellStats(canopy_diff_h_pramhus_ub,stat='max')
canopy_diff_h_pramhus_ub[canopy_diff_h_pramhus_ub>300] <- NA
canopy_diff_h_pramhus_ub
plot(canopy_diff_h_pramhus_ub)


# stangeskovene aurskog
terrainmod_stangesk_aurskog_b  <-grid_terrain(stangesk_aurskog_b, method='knnidw',res=1)
terrainmod_stangesk_aurskog_ub <-grid_terrain(stangesk_aurskog_ub,method='knnidw',res=1)
canopymod_stangesk_aurskog_b   <-grid_canopy(stangesk_aurskog_b,res=1)
canopymod_stangesk_aurskog_ub  <-grid_canopy(stangesk_aurskog_ub,res=1)

terrainmod_stangesk_aurskog_b_resampled <-resample(as.raster(terrainmod_stangesk_aurskog_b), as.raster(canopymod_stangesk_aurskog_b), method='bilinear')
canopy_diff_stangesk_aurskog_b<-(as.raster(canopymod_stangesk_aurskog_b)-terrainmod_stangesk_aurskog_b_resampled)
plot(canopy_diff_stangesk_aurskog_b)

terrainmod_stangesk_aurskog_ub_resampeled <- resample(as.raster(terrainmod_stangesk_aurskog_ub), as.raster(canopymod_stangesk_aurskog_ub, method='bilinear'))
canopy_diff_stangesk_aurskog_ub <- (as.raster(canopymod_stangesk_aurskog_ub)-terrainmod_stangesk_aurskog_ub_resampeled)
plot(canopy_diff_stangesk_aurskog_ub)


# stangeskovene eidskog
terrainmod_stangesk_eidskog_b  <-grid_terrain(stangesk_eidskog_b, method='knnidw',res=1)
terrainmod_stangesk_eidskog_ub <-grid_terrain(stangesk_eidskog_ub,method='knnidw',res=1)
canopymod_stangesk_eidskog_b   <-grid_canopy(stangesk_eidskog_b,res=1)
canopymod_stangesk_eidskog_ub  <-grid_canopy(stangesk_eidskog_ub,res=1)

terrainmod_stangesk_eidskog_b_resampled <-resample(as.raster(terrainmod_stangesk_eidskog_b), as.raster(canopymod_stangesk_eidskog_b), method='bilinear')
canopy_diff_stangesk_eidskog_b<-(as.raster(canopymod_stangesk_eidskog_b)-terrainmod_stangesk_eidskog_b_resampled)
plot(canopy_diff_stangesk_eidskog_b)

terrainmod_stangesk_eidskog_ub_resampeled <- resample(as.raster(terrainmod_stangesk_eidskog_ub), as.raster(canopymod_stangesk_eidskog_ub, method='bilinear'))
canopy_diff_stangesk_eidskog_ub <- (as.raster(canopymod_stangesk_eidskog_ub)-terrainmod_stangesk_eidskog_ub_resampeled)
plot(canopy_diff_stangesk_eidskog_ub)


# stig_dahlen
terrainmod_stig_dahlen_b  <-grid_terrain(stig_dahlen_b, method='knnidw',res=1)
terrainmod_stig_dahlen_ub <-grid_terrain(stig_dahlen_ub,method='knnidw',res=1)
canopymod_stig_dahlen_b   <-grid_canopy(stig_dahlen_b,res=1)
canopymod_stig_dahlen_ub  <-grid_canopy(stig_dahlen_ub,res=1)

terrainmod_stig_dahlen_b_resampled <-resample(as.raster(terrainmod_stig_dahlen_b), as.raster(canopymod_stig_dahlen_b), method='bilinear')
canopy_diff_stig_dahlen_b<-(as.raster(canopymod_stig_dahlen_b)-terrainmod_stig_dahlen_b_resampled)
plot(canopy_diff_stig_dahlen_b)

terrainmod_stig_dahlen_ub_resampeled <- resample(as.raster(terrainmod_stig_dahlen_ub), as.raster(canopymod_stig_dahlen_ub, method='bilinear'))
canopy_diff_stig_dahlen_ub <- (as.raster(canopymod_stig_dahlen_ub)-terrainmod_stig_dahlen_ub_resampeled)
plot(canopy_diff_stig_dahlen_ub)


# truls_holm
terrainmod_truls_holm_b  <-grid_terrain(truls_holm_b, method='knnidw',res=1)
terrainmod_truls_holm_ub <-grid_terrain(truls_holm_ub,method='knnidw',res=1)
canopymod_truls_holm_b   <-grid_canopy(truls_holm_b,res=1)
canopymod_truls_holm_ub  <-grid_canopy(truls_holm_ub,res=1)

terrainmod_truls_holm_b_resampled <-resample(as.raster(terrainmod_truls_holm_b), as.raster(canopymod_truls_holm_b), method='bilinear')
canopy_diff_truls_holm_b<-(as.raster(canopymod_truls_holm_b)-terrainmod_truls_holm_b_resampled)
plot(canopy_diff_truls_holm_b)

terrainmod_truls_holm_ub_resampeled <- resample(as.raster(terrainmod_truls_holm_ub), as.raster(canopymod_truls_holm_ub, method='bilinear'))
canopy_diff_truls_holm_ub <- (as.raster(canopymod_truls_holm_ub)-terrainmod_truls_holm_ub_resampeled)
plot(canopy_diff_truls_holm_ub)



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




