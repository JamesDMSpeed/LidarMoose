#Automated table generation
library(raster)

#List files and read in
lf1<-list.files('data/canopy_height_clipped_raster/',pattern='*canopyheight.grd',full.names = T)
# 90 grd-files found. That means 45 sites, which is too many!

canopymods<-lapply(lf1,raster::raster)

#Give name (extract site)
# ALK: This doesn't work for me...

  #     for(i in 1:length(canopymods)){
  #     names(canopymods)[[i]] <- gsub(
  #       pattern="(.*canopy_height_clipped_raster\\\\)(.*)(_canopyheight.grd)",
  #       replacement = "\\2",x=canopymods[[i]]@file@name)
  #     }

# ... so I made this:
mySlash <- "/"   # alt: change to "\"
for(i in 1:length(canopymods)){
names(canopymods)[[i]] <- sub(
  "_canopyheight.*", "", x = sub(
       paste0(".*clipped_raster", mySlash), "", x = canopymods[[i]]@file@name))
}


MySummary <- function(i) c(mn = mean(getValues(i), na.rm=T), md = median(getValues(i), na.rm=T), sd= cellStats(i, stat='sd', na.rm=T), min= min(getValues(i), na.rm=T),max= max(getValues(i), na.rm=T), first_qu= quantile(i, 0.25, na.rm=T), third_qu= quantile(i, 0.75, na.rm=T),
                           mad=mad(getValues(i),na.rm=T))


dat1<-data.frame(t(sapply(canopymods,MySummary,USE.NAMES = T)))
dat1

