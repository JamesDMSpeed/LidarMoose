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
#trees<-tree_detection(bb,ws=2,hmin=1)#Detect all trees >5m with moving window of 3m 
#trees_5m<-tree_detection(bb,ws=2,hmin=5)#Detect all trees >5m with moving window of 3m 
#Vary hmin and ws...


#Tree hulls (outlies)
#First need to identify trees - different algorithms for doing this... 
#lastrees_li2(bb,hmin=1)
lastrees_dalponte(bb,canopydiffbb,trees)#Dalponte algorthim... Using the canopy height difference (not canopy model)

#Now make hulls around the trees
treeout<-tree_hulls(bb,type='concave',field='treeID')

plot(canopydiffbb)
plot(treeout,add=T) # These regions seem to be the big trees. Clip these out...
