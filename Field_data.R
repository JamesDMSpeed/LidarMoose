# eksempelskript til Ingrid

library(readxl)
sustherb_densityDataset_Dump06022019 <- read_excel("E:/sustherb_densityDataset_Dump06022019.xlsx")
View(sustherb_densityDataset_Dump06022019)

dat <- sustherb_densityDataset_Dump06022019

#Removing all the empty col
colnames(dat)
dat <- dat[,1:15]

#Filtrer
#Remove Tingvoll & Gloppen
dat1 <- dat[!(dat$Region=='Tingvoll'),]
dat1 <- dat1[!(dat1$Region)=='Gloppen',]

#Remove sites not in the project
study_sites<-c('BRB','BRUB','HIB','HIUB' ,'MAB','MAUB', '1KB','1KUB','1NSB','1NSUB','FLB','FLUB','KLB','KLUB','SLB','SLUB', 'LAB','LAUB','SEB','SEUB','1BBB','1BBUB','2BBB','2BBUB','1SB','1SUB','1VBB','1VBUB','2VBB','2VBUB','1DRB','1DRUB','3DRB','3DRUB','4DRB','4DRUB','1FRB','1FRUB','2FRB','2FRUB','1FYB','1FYUB','1KVB','1KVUB','2KVB','2KVUB','3KVB','3KVUB','1CAB','1CAUB','2CAB','2CAUB','3NOB','3NOUB','5NOB','5NOUB','6NOB','6NOUB','DHB','DHUB','STSKNB','STSKNUB','FKB','FKUB','HPB','HPUB','SSAB','SSAUB','SSBB','SSBUB','SDB','SDUB','THB','THUB')

dat2 <- dat1[(dat1$LocalityCode==study_sites),]


# untable for å lage en rad for hvert individ.
library(reshape)
dat3 <- reshape::untable(dat2, num = dat2$Quantity)


#Filter: remove years that are not from the same year as LIDAR data for each site

#dat3$year <- NA
#bratsberg_fd <-dat3[dat3$LocalityName=='Bratsberg'& grepl('2017',dat3$`_Date`),] 
#singsaas_fd <-dat3[dat3$LocalityName=='Singsås'& grepl('2015',dat3$`_Date`),] 

#Make col with years
dat3$`_Date` <- as.Date(dat3$`_Date`, "%d.%m.%Y")
dat3$year <- format(as.Date(dat3$`_Date`, format="%d/%m/%Y"),"%Y")

#Select data from year of interest




# konvertere height_class til m
max(dat3$Height_class_50cm)
#max = 7
dat3$height_m <- ifelse(dat3$Height_class_50cm=='1', 0.25,
                        ifelse(dat3$Height_class_50cm=='2', 0.75,
                               ifelse(dat3$Height_class_50cm=='3', 1.25,
                                      ifelse(dat3$Height_class_50cm=='4', 1.75,
                                             ifelse(dat3$Height_class_50cm=='5', 2.25,
                                                    ifelse(dat3$Height_class_50cm=='6', 2.75, 3.25))))))


# aggregate to plot, calculate median height plot

