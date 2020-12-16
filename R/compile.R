# compile the comple dataset for numerical analyses

# There's been a bit of a mess with many similarly names datasets. This script collects all the
# variables we are going to use, and write it to the file compDat.csv.

library(readr)
library(readxl)
library(dplyr)
library(sp)
library(raster)
library(rgdal)

# there is a file 'Metadata_stats.csv' made in 'Merge_script.R' which takes data from 
# sites_info_new.csv. This file doesn't exist and there's no mention of it on gitHub. 
# I think James made it by updating data/SustHerb Sites Info.csv with 2019 data. 
# I have to assume it's correct, but I can make some test.
sustherbsites<-read.table('Metadata_stats.csv',header=T,sep=',')
names(sustherbsites)
# I'm just keeping the meta data, and importing the LiDAR summary stats later
sustherbsites <-   dplyr::select(sustherbsites,
                          LocalityCode,
                          LocalityName,
                          Treatment,
                          Longitude,
                          Latitude,
                          Clear.cut,
                          Year.initiated,
                          LiDAR.data.from.year,
                          plot_density_m2        = Point.density...m.2.,
                          resolution_m           = Resolution..m.,
                          region                 = Region.y,
                          locality_and_treatment = X1.y)

# This next part is from James's script 'AnalysisNov2019.R'
#Correct coordinates
sustherbsites$Longitude <- as.numeric(ifelse(substr(sustherbsites$Longitude,1,1)==1,
    paste0(substr(sustherbsites$Longitude,1,2),'.',substr(sustherbsites$Longitude,3,nchar(sustherbsites$Longitude))),
    paste0(substr(sustherbsites$Longitude,1,1),'.',substr(sustherbsites$Longitude,2,nchar(sustherbsites$Longitude)))))


sustherbsites$Latitude <- as.numeric(paste0(substr(sustherbsites$Latitude,1,2),
                                            '.',
                                            substr(sustherbsites$Latitude,3,nchar(sustherbsites$Latitude))))

#Set clear cut year to autumns
sustherbsites$Clear.cut <- as.numeric(substr(sustherbsites$Clear.cut,1,4))

#Extract herbivore data
#norway<-getData('GADM',country='NOR',level=0)
norway           <- readRDS('data/gadm36_NOR_0_sp.rds')
sustherbsites_sp <- sp::SpatialPointsDataFrame(coords=cbind(sustherbsites$Longitude,sustherbsites$Latitude),
                                         sustherbsites,proj4string = raster::crs(norway))
raster::plot(sustherbsites_sp)

norwayherbivores             <- rgdal::readOGR('data/HerbivoreBiomass','NorwayLargeHerbivores')
norwayherbivoresLL           <- spTransform(norwayherbivores,crs(norway))
sustherb_herbivoredens       <- over(sustherbsites_sp,norwayherbivoresLL)
sustherbsites_sp$Moose2015   <- sustherb_herbivoredens$Ms_2015
sustherbsites_sp$Reddeer2015 <- sustherb_herbivoredens$Rd__2015
sustherbsites_sp$Roedeer2015 <- sustherb_herbivoredens$R_d_2015

#Age of expt at lidar sampling
sustherbsites_sp$YrsSinceExclosure <- sustherbsites_sp$LiDAR.data.from.year-sustherbsites_sp$Year.initiated

sites <- as.data.frame(sustherbsites_sp)
head(sites)
sites <- dplyr::select(sites,
                -coords.x1,
                -coords.x2)
rm(norway, norwayherbivores, norwayherbivoresLL, sustherb_herbivoredens, sustherbsites, sustherbsites_sp)

# Get field data (made in Field_data.R)  ------------------------------------------------------
field <- read_csv("data/treeHeightsFieldData.csv")

comDat <- sites
comDat$field_mean <- field$mean_height[match(comDat$LocalityCode, field$localityCode)]
summary(comDat$field_mean) #  No NA's and no zeros
comDat$field_median <- field$median_height[match(comDat$LocalityCode, field$localityCode)]
summary(comDat$field_median) #  No NA's and no zeros
# OK


# Here I used to get get LiDAR summary data (made in AutomatedDataSummaryfromc.....R) ----------------------------
#LiDAR_values <- read_csv("data/LiDAR_values.csv")
# Now we're using this other datset made in canopy_terrain_modelling.R
LASstats <- readRDS('data/LASstats.R')
# The site identifyer is 'plot' which is similar to comDat$locality_and_treatment
# Checking that comDat$locality_and_treatment is correct:
 # View(comDat[,c("LocalityName", "Treatment", "locality_and_treatment")])
# Seems like it.

comDat <- merge(comDat, LASstats, 
                 by.x = "locality_and_treatment",
                 by.y = "plot")



# Get site productivity (made in site_prod_all_regions_2.R) -----------------------------------
prod <- read_csv("data/Site_prod_all_regions_new.csv", 
                                  locale = locale(encoding = "ISO-8859-1"))
#plot(prod$Productivity) # Two outliers
#prod$LocalityName
comDat$prod <- prod$Productivity[match(comDat$LocalityName, prod$LocalityName)]
summary(comDat$prod) # 10 NA's
comDat$LocalityName[is.na(comDat$prod)]
# the comDat used oe instead of ø, and aa instad of å ...
prod$LocalityName2 <- sub('æ', 'a', prod$LocalityName)
prod$LocalityName2 <- sub('ø', 'o', prod$LocalityName2)
prod$LocalityName2 <- sub('å', 'aa', prod$LocalityName2)
comDat$prod <- prod$Productivity[match(comDat$LocalityName, prod$LocalityName2)]
summary(comDat$prod) # 2 NA's
comDat$LocalityName[is.na(comDat$prod)]
prod$LocalityName2
prod$LocalityName2[prod$LocalityName2 == "Sorum 1"] <- "Soerum"
comDat$prod <- prod$Productivity[match(comDat$LocalityName, prod$LocalityName2)]
summary(comDat$prod)
# Ok


# site metadata ---------------------------------------------------------------------------
# not updatet for 2019: 
# data/trash/HedmarkTroendelagTelemarkSustherbSites.xlsx"
# SustHerb_Sites_Info <- read_csv("misc/Moose and productivity data/SustHerb Sites Info.csv")



head(comDat)
#write.csv(comDat, 'data/compiledDataset.csv', row.names = F)


