# This script prepares the sustherb density data set for comparison agains LiDAR data.
# It is a modification of the script that Ingrid used whihc is moved to trach/Field_data_old.R


# Loading and tidying field data ------------------------------------------
library(readr)


density <- read_csv("data/density.csv")
# Downloaded from Natron 3 june 2020 and includes 2019 data. 

names(density)

#Make col with years
summary(density$eventDate)
density$year <- format(density$eventDate,"%Y")
summary(as.numeric(density$year))
hist(as.numeric(density$year))




#Select data from the years that we also have LiDAR data for
# Get metadata
sustherbsites<-read.table('Metadata_stats.csv',header=T,sep=',')
#table(  sustherbsites$LocalityCode,    sustherbsites$LiDAR.data.from.year)
table(  sustherbsites$LocalityName,    sustherbsites$LiDAR.data.from.year)
# OK - this is updated with the 2019 data

# find common link between dataset to do matching
unique(density$locality)           # 42
unique(sustherbsites$LocalityName) # 45
unique(sustherbsites$Region.x) # 45

  unique(density$locality[density$siteNumber %in% unique(sustherbsites$LocalityCode)])
  unique(density$locality[!density$siteNumber %in% unique(sustherbsites$LocalityCode)])
  
#View(density[density$locality == "Telemark | Notodden1 | Winter browsing" , ])
# We don't have LiDAR data for Notodden 1 and 4, so that fine that they are not included in the sustherbsites dataset.
# The other four sites are just spelt differently

unique(density$siteNumber[density$locality == "Trøndelag | steinkjer_1B | Winter browsing"]) #"1BB"  "1BUB"
unique(density$siteNumber[density$locality == "Trøndelag | steinkjer_2B | Winter browsing"]) #"2BB"  "2BUB"
unique(density$siteNumber[density$locality == "Trøndelag | verdal_1v | Winter browsing"])    #1VB, 1VUB
unique(density$siteNumber[density$locality == "Trøndelag | verdal_2v | Winter browsing"])    #2VB, 2VUB

unique(sustherbsites$LocalityCode[sustherbsites$LocalityName == "steinkjer_1BBb"]   )        #1BBB, 1BBUB
unique(sustherbsites$LocalityCode[sustherbsites$LocalityName == "steinkjer_2BBb"]   )        #2BBB, 2BBUB
unique(sustherbsites$LocalityCode[sustherbsites$LocalityName == "verdal_1vb"]       )        #1VBB, 1VBUB 
unique(sustherbsites$LocalityCode[sustherbsites$LocalityName == "verdal_2VB"]       )        #2VBB, 2VBUB


density$siteNumber[density$siteNumber == "1VB"] <- "1VBB"
density$siteNumber[density$siteNumber == "1VUB"] <- "1VBUB"

density$siteNumber[density$siteNumber == "2VB"] <- "2VBB"
density$siteNumber[density$siteNumber == "2VUB"] <- "2VBUB"

density$siteNumber[density$siteNumber == "2BB"] <- "2BBB"
density$siteNumber[density$siteNumber == "1BB"] <- "1BBB"
density$siteNumber[density$siteNumber == "1BUB"] <- "1BBUB"
density$siteNumber[density$siteNumber == "2BUB"] <- "2BBUB"
unique(density$locality[!density$siteNumber %in% unique(sustherbsites$LocalityCode)])


density <- density[!density$locality %in% c("Telemark | Notodden1 | Winter browsing", 
                                            "Telemark | Notodden4 | Winter browsing"),]
# OK
density$test <- sustherbsites$LiDAR.data.from.year[match(density$siteNumber, sustherbsites$LocalityCode)]
summary(density$test)
head(density[c("siteNumber", "year", "test")])

density <- density[density$year == density$test,]
head(density[c("siteNumber", "year", "test")])
summary(as.numeric(density$year))




# untable to make one row per observation
library(reshape)
plot(density$individualCount)
# Individuals within same subplot and height class is on the same time and aggregated into this column
mean(density$individualCount) # 3.087634
# That means the following should tripple the dataset length ...:
dat <- reshape::untable(density, num = density$individualCount)
# it worked




# let's convert height classes into the center value for each class
dat$hc <-  dat$`height class 50cm (categorical)`
summary(dat$hc) # no na's. Classes range from 1 (0-50 cm) to 9

dat$height_c <- ifelse(dat$hc=='1', 0.25,
                        ifelse(dat$hc=='2', 0.75,
                               ifelse(dat$hc=='3', 1.25,
                                      ifelse(dat$hc=='4', 1.75,
                                             ifelse(dat$hc=='5', 2.25,
                                                    ifelse(dat$hc=='6', 2.75, 
                                                           ifelse(dat$hc=='7', 3.25,
                                                                  ifelse(dat$hc=='8', 3.75, 4.25))))))))

summary(dat$height_c)
# The LiDAR analysis excluded trees above 7 m. The tallest height class here is >4m and we dont want to exclude trees 
# from 4 to 7 m, so we must leave it as it is and assume the few large trees don't affect the result. 
# The medians at least should be unaffected.


# Checking that all cirlces have some data, even if it's zero
dat$stationNumber <- as.factor(dat$stationNumber)
dat$stationNumber <- plyr::revalue(dat$stationNumber,
                             c("NE" = "ØH",
                             "NW" = "ØV",
                             "SE" = "NH",
                             "SW" = "NV"))
table(dat$siteNumber, dat$stationNumber)
# at least two zeros in there. Using drop = FALSE below


# aggregate to plot-level ####

datAgg <- stats::aggregate(data = dat,
                           height_c ~ siteNumber + stationNumber,
                                                FUN = function(x) c(median = median(x), mean = mean(x)),
                           drop = F
                           )
datAgg <- do.call(data.frame, datAgg)
datAgg$height_c.median[is.na(datAgg$height_c.median)] <- 0
datAgg$height_c.mean[is.na(datAgg$height_c.mean)] <- 0

head(datAgg, 50)
summary(datAgg$height_c.median)
hist(datAgg$height_c.median)

dim(datAgg) # [1] 344   4
# 344 / 4circles / 2treatment = 
344/4/2                           # 43 sites
length(unique(datAgg$siteNumber))  # 86 - OK

# next aggregate to 20x20 level
datAgg2 <- stats::aggregate(data = datAgg,
                            cbind(height_c.median,  height_c.mean)~ siteNumber,
                            FUN = function(x) c(median = median(x), mean = mean(x)))


datAgg2 <- do.call(data.frame, datAgg2)
datAgg3 <- data.frame(localityCode = datAgg2$siteNumber,
                      median_height = datAgg2$height_c.median.median,
                      mean_height = datAgg2$height_c.mean.mean)

#write.csv(datAgg3, 'data/treeHeightsFieldData.csv', row.names = F)


# Make new dataframe ------------------------------------------------------




library(readr)
MyData4 <- read_csv("~/Master - Sustherb/LidarMoose/MyData4.csv")
View(MyData4)

Data_prod_field <- merge(MyData4, df2, by.x="LocalityCode", by.y="row.names")
write.csv(Data_prod_field, 'Data_prod_field.csv')


# Legger til kolonne med mean fra feltdata --------------------------------
#Kun fire navn på plot, ikke både norske og engelske
unique(dat4$Plot)
dat4$Plot[dat4$Plot == "NE"] <- "ØH"
dat4$Plot[dat4$Plot == "SE"] <- "NH"
dat4$Plot[dat4$Plot == "SW"] <- "NV"
dat4$Plot[dat4$Plot == "NW"] <- "ØV"

#Fjerner de høyeste trærne, høydeklasse 8 og 9, usikker på om det er best å gjøre
dat4 <- dat4[dat4$Height_class_50cm != "8",]
dat4 <- dat4[dat4$Height_class_50cm != "9",]

dat_mean <- aggregate(data = dat4,
                    height_m ~ LocalityName + Treatment + year + Plot,
                    FUN = mean, drop = F
                    )

dat_median <- aggregate(data = dat4,
                      cbind(height = height_m) ~ LocalityName + Treatment + year + Plot,
                      FUN = median, drop = F)

dat_mean$median <- dat_median$height
# blir masse NA for år uten sampling, feks telemark 2000, men vi får rader for sirkler der det var samplet, men det ikke var noen trær. Disse NAene må gjøres om til 0.
dat_mean$height_m[is.na(dat_mean$height_m)] <- 0
dat_mean$height_m[is.na(dat_mean$median)] <- 0

summary(dat_mean$height_m)
dat_mean2 <- aggregate(data = dat_mean,
                      cbind(mean_of_mean = height_m, "mean_of_median" = median) ~ LocalityName + Treatment + year,
                      FUN = mean)
dat_mean3 <- aggregate(data = dat_mean,
                       cbind(median_of_mean = height_m, "median_of_median" = median) ~ LocalityName + Treatment + year,
                       FUN = median)
dat_mean2$median_of_mean <- dat_mean3$median_of_mean
dat_mean2$median_of_median <- dat_mean3$median_of_median

#Endrer navn slik at alle locality names er like i begge tabellene
dat_mean2$LocalityName[dat_mean2$LocalityName == "Fritsøe1"] <- "Fritsoe1"
dat_mean2$LocalityName[dat_mean2$LocalityName == "Fritsøe2"] <- "Fritsoe2"
dat_mean2$LocalityName[dat_mean2$LocalityName == "Singsås"] <- "Singsaas"
dat_mean2$LocalityName[dat_mean2$LocalityName == "Stig Dæhlen"] <- "Stig Dahlen"


dat_mean2$Treatment[dat_mean2$Treatment == "B"] <- "Open plot"
dat_mean2$Treatment[dat_mean2$Treatment == "UB"] <- "Exclosure"


dat_mean2$link <- paste0(dat_mean2$LocalityName, dat_mean2$Treatment, dat_mean2$year)
Data_prod_field$link <- paste0(Data_prod_field$LocalityName, Data_prod_field$Treatment, Data_prod_field$LiDAR.data.from.year)
Data_prod_field$mean_of_mean <- dat_mean2$mean_of_mean[match(Data_prod_field$link, dat_mean2$link)]
Data_prod_field$mean_of_median <- dat_mean2$mean_of_median[match(Data_prod_field$link, dat_mean2$link)]
Data_prod_field$median_of_mean <- dat_mean2$median_of_mean[match(Data_prod_field$link, dat_mean2$link)]
Data_prod_field$median_of_median <- dat_mean2$median_of_median[match(Data_prod_field$link, dat_mean2$link)]


#Overskriver så data_prod_field inneholder felt dataene produsert over
write.csv(Data_prod_field, 'Data_prod_field.csv')

#Selecting some rows from data_prod_field
library(dplyr)
MyData5 <- subset(Data_prod_field, select = c("LocalityCode","LocalityName", "Region.x", "Treatment", "Mean", "Median", "MAD","productivity", "Field_median", "mean_of_mean", "mean_of_median", "median_of_mean", "median_of_median"  ))
write.csv(MyData5, 'MyData5.csv')
