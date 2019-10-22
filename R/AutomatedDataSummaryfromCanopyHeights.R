#Autmoated table generation

#List files and read in
lf1<-list.files('data/canopy_height_clipped_raster/',pattern='*canopyheight.grd',full.names = T)
canopymods<-lapply(lf1,raster)

#Give name (extract site)
for(i in 1:length(canopymods)){
names(canopymods)[[i]]<-gsub(pattern="(.*canopy_height_clipped_raster\\\\)(.*)(_canopyheight.grd)",replacement = "\\2",x=canopymods[[i]]@file@name)
}

MySummary <- function(i) c(mn = mean(getValues(i), na.rm=T), md = median(getValues(i), na.rm=T), sd= cellStats(i, stat='sd', na.rm=T), min= min(getValues(i), na.rm=T),max= max(getValues(i), na.rm=T), first_qu= quantile(i, 0.25, na.rm=T), third_qu= quantile(i, 0.75, na.rm=T),
                           mad=mad(getValues(i),na.rm=T))


dat1<-data.frame(t(sapply(canopymods,MySummary,USE.NAMES = T)))
dat1

