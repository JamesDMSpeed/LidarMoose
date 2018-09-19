#Detecting trees
#Testing with Bratsberg browsed

bb<-readLAS('Trondelag/clipped_las/bratsberg_b.las')
plot(bb)

#Models for canopy and terrain
gridcanopybb<-as.raster(grid_canopy(bb,res=0.5))
gridterrainbb<-as.raster(grid_terrain(bb,method='knnidw',res=0.5))

#Difference between canopy and terrain = canopy height from ground
canopydiffbb<-gridcanopybb-(crop(gridterrainbb,gridcanopybb))
plot(canopydiffbb)

#Tree detection
trees<-tree_detection(bb,ws=5,hmin=5)#Detect all trees >5m with moving window of 3m 
treeheight<-extract(canopydiffbb,trees[,1:2])
#trees_5m<-tree_detection(bb,ws=2,hmin=5)#Detect all trees >5m with moving window of 3m 
#Vary hmin and ws...


#Tree hulls (outlies)
#First need to identify trees - different algorithms for doing this... 
#lastrees_li2(bb,hmin=1)
lastrees_dalponte(bb,canopydiffbb,trees[treeheight>=4,],th_seed=0.05,th_cr=0.1)#Dalponte algorthim... Using the canopy height difference (not canopy model)
#Lastrees_dalponte seems to be the best method as it allows use of a canopy model.
#need to look further into arguments to ensure that whole tree is segmented


#Now make hulls around the trees
treeout<-tree_hulls(bb,type='convex',field='treeID')

plot(canopydiffbb)
plot(treeout,add=T) # These regions seem to be the big trees. Clip these out...

#Those greater than 7m
bigtrees<-which(extract(canopydiffbb,treeout,fun=max,na.rm=T)>4)

#Clip out trees
bclip<-lasclip(bb,treeout@polygons[[bigtrees[1]]]@Polygons[[1]],inside=F)
for(i in 2:length(bigtrees)){
print(i)
bclip<-lasclip(bclip,treeout@polygons[[bigtrees[i]]]@Polygons[[1]],inside=F)}
plot(bclip)#Didnt quite work... 

plot(as.raster(grid_canopy(bclip,res=0.5))-(crop(as.raster(grid_terrain(bclip,method='knnidw',res=0.5)),as.raster(grid_canopy(bclip,res=0.5)))))

####################################################
#Unbrowsed
bu<-readLAS('Trondelag/clipped_las/bratsberg_ub.las')
plot(bu)

#Models for canopy and terrain
gridcanopybu<-as.raster(grid_canopy(bu,res=0.5))
gridterrainbu<-as.raster(grid_terrain(bu,method='knnidw',res=0.5))

#Difference between canopy and terrain = canopy height from ground
canopydiffbu<-gridcanopybu-(crop(gridterrainbu,gridcanopybu))
plot(canopydiffbu)
treesub<-tree_detection(bu,ws=2,hmin=7)
lastrees_dalponte(bu,canopydiffbu,treesub)#Dalponte algorthim... Using the canopy height difference (not canopy model)

#Now make hulls around the trees
treeoutub<-tree_hulls(bu,type='concave',field='treeID')

plot(canopydiffbu)
plot(treeoutub,add=T) # Not all of these are preexisting trees. Only some should be clipped..
