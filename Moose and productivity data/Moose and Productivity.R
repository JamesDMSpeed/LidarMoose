#Moose and productivity data
require(raster)
require(rasterVis)
require(sp)
require(rgdal)


norway<-getData('GADM',country='NOR',level=0)

#Sust herb sites
sustherbsites<-read.table('Moose and productivity data/SustHerb Sites Info.csv',header=T,sep=',')
View(sustherbsites)
sustherbsites<-sustherbsites[1:74,]#Removing empty rows

sustherbsites_sp<-SpatialPointsDataFrame(coords=cbind(sustherbsites$Longitude,sustherbsites$Latitude),
                                         sustherbsites,proj4string = crs(norway))


plot(norway)
points(sustherbsites_sp)

#PRoductivity (NPP, July 2016) g/m2/day
proddat<-raster('Moose and productivity data\\MOD17A2_M_PSN_2016-07-01_rgb_3600x1800.FLOAT.tiff')

sustherbsites_sp$NPP_July2016<-extract(proddat,sustherbsites_sp)


#Herbivore data

norwayherbivores<-readOGR('Moose and productivity data','NorwayLargeHerbivores')
norwayherbivoresLL<-spTransform(norwayherbivores,crs(norway))
sustherb_herbivoredens<-over(sustherbsites_sp,norwayherbivoresLL)

sustherbsites_sp$Moose2015<-sustherb_herbivoredens$Ms_2015

write.csv(sustherbsites_sp,'SustHerb_MooseAndProductivity.csv')
