#Script with best possible resolution for h_pramhus and verdal_1vb

#h_pramhus 5 pkt/m^2, verdal_1vb 2 pkt/mm^2 --> resolution 0.5



# Making canopy height model ----------------------------------------------

# h_pramhus_b
terrainmod_h_pramhus_b  <-grid_terrain(h_pramhus_b, method='knnidw',res=0.5)
canopymod_h_pramhus_b   <-grid_canopy(h_pramhus_b,res=0.5)

terrainmod_h_pramhus_b_resampled <-resample(as.raster(terrainmod_h_pramhus_b), as.raster(canopymod_h_pramhus_b), method='bilinear')
canopy_diff_h_pramhus_b<-(as.raster(canopymod_h_pramhus_b)-terrainmod_h_pramhus_b_resampled)
plot(canopy_diff_h_pramhus_b)

#1 outlying very high point (like a bird?)
cellStats(canopy_diff_h_pramhus_b,stat='max')
canopy_diff_h_pramhus_b[canopy_diff_h_pramhus_b>300] <- NA
canopy_diff_h_pramhus_b #max 4.802
plot(canopy_diff_h_pramhus_b)

#Cutting the 32x32m square(with big trees removed) to 20x20 m
halvard_pramhus_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Hedmark_Akershus/Halvard_Pramhus.las') 
h_pramhus_b_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='HP1',15:14]))
h_pramhus_b_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='HP1',15:14][h_pramhus_b_order,]))
h_pramhus_b_cut<-lasclip(halvard_pramhus_las,h_pramhus_b_poly)
plot(h_pramhus_b_cut) #20x20 m area as point cloud

#Make new canopy height model for 20x20 m square
terrainmod_h_pramhus_b_20x20 <-grid_terrain(h_pramhus_b_cut,method='knnidw',res=0.5)
canopymod_h_pramhus_b_20x20  <-grid_canopy(h_pramhus_b_cut,res=0.5)

terrainmod_h_pramhus_b_resampeled_20x20 <- resample(as.raster(terrainmod_h_pramhus_b_20x20), as.raster(canopymod_h_pramhus_b_20x20, method='bilinear'))
canopy_diff_h_pramhus_b_20x20 <- (as.raster(canopymod_h_pramhus_b_20x20)-terrainmod_h_pramhus_b_resampeled_20x20)
plot(canopy_diff_h_pramhus_b_20x20)

writeRaster(canopy_diff_h_pramhus_b_20x20,'Hedmark_Akershus/canopy_height_clipped_raster/h_pramhus_b_canopyheight05', overwrite=TRUE)


# h_pramhus_ub 
terrainmod_h_pramhus_ub <-grid_terrain(h_pramhus_ub,method='knnidw',res=0.5)
canopymod_h_pramhus_ub  <-grid_canopy(h_pramhus_ub,res=0.5)

terrainmod_h_pramhus_ub_resampeled <- resample(as.raster(terrainmod_h_pramhus_ub), as.raster(canopymod_h_pramhus_ub, method='bilinear'))
canopy_diff_h_pramhus_ub <- (as.raster(canopymod_h_pramhus_ub)-terrainmod_h_pramhus_ub_resampeled)
plot(canopy_diff_h_pramhus_ub)

#h_pramhus_ub@data[h_pramhus_ub@data$Z>300] <- NA
#plot(h_pramhus_ub)

#Cutting the 32x32m square(with big trees removed) to 20x20 m
halvard_pramhus_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Hedmark_Akershus/Halvard_Pramhus.las') 
h_pramhus_ub_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='HP2',15:14]))
h_pramhus_ub_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='HP2',15:14][h_pramhus_ub_order,]))
h_pramhus_ub_cut<-lasclip(halvard_pramhus_las,h_pramhus_ub_poly)
plot(h_pramhus_ub_cut) #20x20 m area as point cloud


#Make new canopy height model for 20x20 m square
terrainmod_h_pramhus_ub_20x20 <-grid_terrain(h_pramhus_ub_cut,method='knnidw',res=0.5)
canopymod_h_pramhus_ub_20x20  <-grid_canopy(h_pramhus_ub_cut,res=0.5)

terrainmod_h_pramhus_ub_resampeled_20x20 <- resample(as.raster(terrainmod_h_pramhus_ub_20x20), as.raster(canopymod_h_pramhus_ub_20x20, method='bilinear'))
canopy_diff_h_pramhus_ub_20x20 <- (as.raster(canopymod_h_pramhus_ub_20x20)-terrainmod_h_pramhus_ub_resampeled_20x20)

#1 outlying very high point (like a bird?)
cellStats(canopy_diff_h_pramhus_ub_20x20,stat='max')
canopy_diff_h_pramhus_ub_20x20[canopy_diff_h_pramhus_ub_20x20>300] <- NA
canopy_diff_h_pramhus_ub_20x20 
plot(canopy_diff_h_pramhus_ub_20x20)

writeRaster(canopy_diff_h_pramhus_ub_20x20,'Hedmark_Akershus/canopy_height_clipped_raster/h_pramhus_ub_canopyheight05', overwrite=TRUE)


#Verdal_1vb

# verdal_1vb_b
terrainmod_verdal_1vb_b  <-grid_terrain(verdal_1vb_b, method='knnidw',res=0.5)
canopymod_verdal_1vb_b   <-grid_canopy(verdal_1vb_b,res=0.5)

terrainmod_verdal_1vb_b_resampled <-resample(as.raster(terrainmod_verdal_1vb_b), as.raster(canopymod_verdal_1vb_b), method='bilinear')
canopy_diff_verdal_1vb_b<-(as.raster(canopymod_verdal_1vb_b)-terrainmod_verdal_1vb_b_resampled)
plot(canopy_diff_verdal_1vb_b)

trees_verdal_1vb_b<-tree_detection(verdal_1vb_b,ws=5,hmin=5)#Detect all trees >5m with moving window of 5m 
treeheight_verdal_1vb_b<-extract(canopy_diff_verdal_1vb_b,trees_verdal_1vb_b[,1:2])

lastrees_dalponte(verdal_1vb_b,canopy_diff_verdal_1vb_b,trees_verdal_1vb_b[treeheight_verdal_1vb_b>=5,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)

treeout_verdal_1vb_b<-tree_hulls(verdal_1vb_b,type='convex',field='treeID')
plot(canopy_diff_verdal_1vb_b)
plot(treeout_verdal_1vb_b,add=T) 

bigtrees_verdal_1vb_b<-which(extract(canopy_diff_verdal_1vb_b,treeout_verdal_1vb_b,fun=max,na.rm=T)>threshold) #identify trees larger than 7m

verdal_1vb_b_clip<-lasclip(verdal_1vb_b,treeout_verdal_1vb_b@polygons[[bigtrees_verdal_1vb_b[1]]]@Polygons[[1]],inside=F) #remove trees larger than 7m
for(i in 2:length(bigtrees_verdal_1vb_b)){
  print(i)
  verdal_1vb_b_clip<-lasclip(verdal_1vb_b_clip,treeout_verdal_1vb_b@polygons[[bigtrees_verdal_1vb_b[i]]]@Polygons[[1]],inside=F)}
plot(verdal_1vb_b_clip) 

canopy_diff_verdal_1vb_b_clip <- (as.raster(grid_canopy(verdal_1vb_b_clip,res=0.5))-(crop(as.raster(grid_terrain(verdal_1vb_b_clip,method='knnidw',res=0.5)),as.raster(grid_canopy(verdal_1vb_b_clip,res=0.5)))))
plot(canopy_diff_verdal_1vb_b_clip)

#Cutting the 32x32m square(with big trees removed) to 20x20 m
verdal_1vb_b_order<-chull(as.matrix(plotcoords[plotcoords$Name=='1Vbb',4:5]))
verdal_1vb_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='1Vbb',4:5][verdal_1vb_b_order,]))
verdal_1vb_b_cut<-lasclip(verdal_1vb_b_clip,verdal_1vb_b_poly)
plot(verdal_1vb_b_cut) #20x20 m area as point cloud

#Make new canopy height model for 20x20 m square
terrainmod_verdal_1vb_b_20x20 <-grid_terrain(verdal_1vb_b_cut,method='knnidw',res=0.5)
canopymod_verdal_1vb_b_20x20  <-grid_canopy(verdal_1vb_b_cut,res=0.5)

terrainmod_verdal_1vb_b_resampeled_20x20 <- resample(as.raster(terrainmod_verdal_1vb_b_20x20), as.raster(canopymod_verdal_1vb_b_20x20, method='bilinear'))
canopy_diff_verdal_1vb_b_20x20 <- (as.raster(canopymod_verdal_1vb_b_20x20)-terrainmod_verdal_1vb_b_resampeled_20x20)
plot(canopy_diff_verdal_1vb_b_20x20)

writeRaster(canopy_diff_verdal_1vb_b_20x20,'Trondelag/canopy_height_clipped_raster/verdal_1vb_b_canopyheight05', overwrite=TRUE)



# verdal_1vb_ub
terrainmod_verdal_1vb_ub <-grid_terrain(verdal_1vb_ub,method='knnidw',res=0.5)
canopymod_verdal_1vb_ub  <-grid_canopy(verdal_1vb_ub,res=0.5)

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

#Cutting the 32x32m square(with big trees removed) to 20x20 m
verdal_1vb_ub_order<-chull(as.matrix(plotcoords[plotcoords$Name=='1Vbub',4:5]))
verdal_1vb_ub_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='1Vbub',4:5][verdal_1vb_ub_order,]))
verdal_1vb_ub_cut<-lasclip(verdal_1vb_ub_clip,verdal_1vb_ub_poly)
plot(verdal_1vb_ub_cut) #20x20 m area as point cloud

#Make new canopy height model for 20x20 m square
terrainmod_verdal_1vb_ub_20x20 <-grid_terrain(verdal_1vb_ub_cut,method='knnidw',res=0.5)
canopymod_verdal_1vb_ub_20x20  <-grid_canopy(verdal_1vb_ub_cut,res=0.5)

terrainmod_verdal_1vb_ub_resampeled_20x20 <- resample(as.raster(terrainmod_verdal_1vb_ub_20x20), as.raster(canopymod_verdal_1vb_ub_20x20, method='bilinear'))
canopy_diff_verdal_1vb_ub_20x20 <- (as.raster(canopymod_verdal_1vb_ub_20x20)-terrainmod_verdal_1vb_ub_resampeled_20x20)
plot(canopy_diff_verdal_1vb_ub_20x20)

writeRaster(canopy_diff_verdal_1vb_ub_20x20,'Trondelag/canopy_height_clipped_raster/verdal_1vb_ub_canopyheight05', overwrite=TRUE)



# Make table --------------------------------------------------------------
h_pramhus_b_canopyheight05           <-  raster('Hedmark_Akershus/canopy_height_clipped_raster/h_pramhus_b_canopyheight05')
h_pramhus_ub_canopyheight05         <-  raster('Hedmark_Akershus/canopy_height_clipped_raster/h_pramhus_ub_canopyheight05')
verdal1_b_canopyheight05          <-  raster('Trondelag/canopy_height_clipped_raster/verdal_1vb_b_canopyheight05')
verdal1_ub_canopyheight05         <-  raster('Trondelag/canopy_height_clipped_raster/verdal_1vb_ub_canopyheight05')


h_pramhus_b_val05<-getValues(h_pramhus_b_canopyheight05)
h_pramhus_ub_val05<-getValues(h_pramhus_ub_canopyheight05)
verdal1_b_val05<-getValues(verdal1_b_canopyheight05)
verdal1_ub_val05<-getValues(verdal1_ub_canopyheight05)

df<-data.frame(matrix(nrow=4,ncol=3))
rownames(df)<-c('Hpram_b','Hpram_ub',"verdal_b","verdal_ub")
colnames(df)<-c('Median','MAD','RMAD') 

MySummary <- function(i) c(md = median(getValues(i), na.rm=T), mad= mad(getValues(i),na.rm=T)   )

df['Hpram_b', 1:2] <- MySummary(h_pramhus_b_canopyheight05)
df['Hpram_ub', 1:2] <- MySummary(h_pramhus_ub_canopyheight05)
df['verdal_b', 1:2] <- MySummary(verdal1_b_canopyheight05)
df['verdal_ub', 1:2] <- MySummary(verdal1_ub_canopyheight05)

df$RMAD <- df$MAD/df$Median





