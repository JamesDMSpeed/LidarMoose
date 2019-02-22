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
dat2 <- dat1[!(dat1$Region)=='Gloppen',]

#Remove sites not in the project
study_sites<-c('BRB','BRUB','HIB','HIUB' ,'MAB','MAUB', '1KB','1KUB','1NSB','1NSUB','FLB','FLUB','KLB','KLUB','SLB','SLUB', 'LAB','LAUB','SEB','SEUB','1BBB','1BBUB','2BBB','2BBUB','1SB','1SUB','1VBB','1VBUB','2VBB','2VBUB','1DRB','1DRUB','3DRB','3DRUB','4DRB','4DRUB','1FRB','1FRUB','2FRB','2FRUB','1FYB','1FYUB','1KVB','1KVUB','2KVB','2KVUB','3KVB','3KVUB','1CAB','1CAUB','2CAB','2CAUB','3NOB','3NOUB','5NOB','5NOUB','6NOB','6NOUB','DHB','DHUB','STSKNB','STSKNUB','FKB','FKUB','HPB','HPUB','SSAB','SSAUB','SSBB','SSBUB','SDB','SDUB','THB','THUB')

dat3 <- dat2[(dat2$LocalityCode%in%study_sites),]



#Make col with years
dat3$`_Date` <- as.Date(dat3$`_Date`, "%d.%m.%Y")
dat3$year <- format(as.Date(dat3$`_Date`, format="%d/%m/%Y"),"%Y")

# Remove years that are not from the same year as LIDAR data for each site
#Select data from year of interest
#Trøndelag
# dat4 <- dat3[!(dat3$LocalityName=='Bratsberg'& dat3$year!='2017'),]
# dat4 <- dat4[!(dat4$LocalityName=='Singsås' & dat4$year!='2015'),]
# dat4 <- dat4[!(dat4$LocalityName=='Malvik' & dat4$year!='2016'),]
# dat4 <- dat4[!(dat4$LocalityName=='Selbu_Flub' & dat4$year!='2015'),]
# dat4 <- dat4[!(dat4$LocalityName=='Selbu_kl' & dat4$year!='2015'),]
# dat4 <- dat4[!(dat4$LocalityName=='sl_tydal' & dat4$year!='2015'),]
# dat4 <- dat4[!(dat4$LocalityName=='Hi_tydal' & dat4$year!='2015'),]
# dat4 <- dat4[!(dat4$LocalityName=='Sl_Tydal' & dat4$year!='2015'),]
# dat4 <- dat4[!(dat4$LocalityName=='steinkjer_1BBb' & dat4$year!='2011'),]
# dat4 <- dat4[!(dat4$LocalityName=='steinkjer_2BBb' & dat4$year!='2011'),]
# dat4 <- dat4[!(dat4$LocalityName=='Nsb_Verdal' & dat4$year!='2015'),]
# dat4 <- dat4[!(dat4$LocalityName=='verdal_1vb' & dat4$year!='2015'),]
# dat4 <- dat4[!(dat4$LocalityName=='verdal_2VB' & dat4$year!='2015'),]
# dat4 <- dat4[!(dat4$LocalityName=='namdalseid_1kub' & dat4$year!='2010'),]
# dat4 <- dat4[!(dat4$LocalityName=='Sub_Namdalseid' & dat4$year!='2010'),]
# 
# #Telemark
# dat4 <- dat4[!(dat4$LocalityName=='Fritsøe1' & dat4$year!='2017'),]
# dat4 <- dat4[!(dat4$LocalityName=='Fritsøe2' & dat4$year!='2017'),]
# dat4 <- dat4[!(dat4$LocalityName=='Nome_Cappelen1' & dat4$year!='2017'),]
# dat4 <- dat4[!(dat4$LocalityName=='Nome_Cappelen2' & dat4$year!='2017'),]
# dat4 <- dat4[!(dat4$LocalityName=='Notodden3' & dat4$year!='2017'),]
# dat4 <- dat4[!(dat4$LocalityName=='Notodden5' & dat4$year!='2017'),]
# dat4 <- dat4[!(dat4$LocalityName=='Notodden6' & dat4$year!='2017'),]
# dat4 <- dat4[!(dat4$LocalityName=='Drangedal1' & dat4$year!='2017'),]
# dat4 <- dat4[!(dat4$LocalityName=='Drangedal3' & dat4$year!='2016'),]
# dat4 <- dat4[!(dat4$LocalityName=='Drangedal4' & dat4$year!='2016'),]
# dat4 <- dat4[!(dat4$LocalityName=='Kviteseid1' & dat4$year!='2017'),]
# dat4 <- dat4[!(dat4$LocalityName=='Kviteseid2' & dat4$year!='2017'),]
# dat4 <- dat4[!(dat4$LocalityName=='Kviteseid3' & dat4$year!='2017'),]
# dat4 <- dat4[!(dat4$LocalityName=='Furesdal' & dat4$year!='2017'),]
# 
# #Hedmark_Akershus
# dat4 <- dat4[!(dat4 $LocalityName=='Didrik Holmsen' & dat4 $year!='2018'),]
# dat4  <- dat4 [!(dat4 $LocalityName=='Stangeskovene Aurskog' & dat4 $year!='2018'),]
# dat4  <- dat4 [!(dat4 $LocalityName=='Stig Dæhlen' & dat4 $year!='2017'),]
# dat4  <- dat4 [!(dat4 $LocalityName=='Truls Holm' & dat4 $year!='2017'),]
# dat4  <- dat4 [!(dat4 $LocalityName=='Fet 3' & dat4 $year!='2016'),]
# dat4  <- dat4 [!(dat4 $LocalityName=='Eidskog' & dat4 $year!='2016'),]
# dat4  <- dat4 [!(dat4 $LocalityName=='Halvard Pramhus' & dat4 $year!='2016'),]
# dat4  <- dat4 [!(dat4 $LocalityName=='Stangeskovene Eidskog' & dat4 $year!='2016'),]
# 




# untable for å lage en rad for hvert individ.
library(reshape)
dat4 <- reshape::untable(dat3, num = dat3$Quantity)



# konvertere height_class til m
max(dat4$Height_class_50cm)
#max =9
dat4$height_m <- ifelse(dat4$Height_class_50cm=='1', 0.25,
                        ifelse(dat4$Height_class_50cm=='2', 0.75,
                               ifelse(dat4$Height_class_50cm=='3', 1.25,
                                      ifelse(dat4$Height_class_50cm=='4', 1.75,
                                             ifelse(dat4$Height_class_50cm=='5', 2.25,
                                                    ifelse(dat4$Height_class_50cm=='6', 2.75, 
                                                           ifelse(dat4$Height_class_50cm=='7', 3.25,
                                                                  ifelse(dat4$Height_class_50cm=='8', 3.75, 4.25))))))))


# aggregate to plot, calculate median height plot

#make new data frame to merge with mydata4
#Make a table for some summary values
df2<-data.frame(matrix(nrow=74,ncol=))
rownames(df2)<-c('BRB','BRUB','HIB','HIUB' ,'MAB','MAUB', '1KB','1KUB','1NSB','1NSUB','FLB','FLUB','KLB','KLUB','SLB','SLUB', 'LAB','LAUB','SEB','SEUB','1BBB','1BBUB','2BBB','2BBUB','1SB','1SUB','1VBB','1VBUB','2VBB','2VBUB','1DRB','1DRUB','3DRB','3DRUB','4DRB','4DRUB','1FRB','1FRUB','2FRB','2FRUB','1FYB','1FYUB','1KVB','1KVUB','2KVB','2KVUB','3KVB','3KVUB','1CAB','1CAUB','2CAB','2CAUB','3NOB','3NOUB','5NOB','5NOUB','6NOB','6NOUB','DHB','DHUB','STSKNB','STSKNUB','FKB','FKUB','HPB','HPUB','SSAB','SSAUB','SSBB','SSBUB','SDB','SDUB','THB','THUB')
colnames(df2)<-c('Field_median')  


# Trøndelag ---------------------------------------------------------------


#Dataframes for each site correct year. Calculating the median for each circle in a plot, and the median for the plot is the median of those medians


####Bratsberg##############
bratsberg_2017    <- dat4[dat4$LocalityName=='Bratsberg'& dat4$year=='2017',]

bratsberg_b_2017  <- bratsberg_2017[bratsberg_2017$Treatment=='B',]
bratsberg_b_oh    <- bratsberg_b_2017[bratsberg_b_2017$Plot=='ØH',]
bratsberg_b_nh    <- bratsberg_b_2017[bratsberg_b_2017$Plot=='NH',]
bratsberg_b_nv    <- bratsberg_b_2017[bratsberg_b_2017$Plot=='NV',]
bratsberg_b_ov    <- bratsberg_b_2017[bratsberg_b_2017$Plot=='ØV',]
bratsberg_b_med   <- median(c(median(bratsberg_b_oh$height_m), median(bratsberg_b_nh$height_m), median(bratsberg_b_nv$height_m), median(bratsberg_b_ov$height_m)))

bratsberg_ub_2017 <- bratsberg_2017[bratsberg_2017$Treatment=='UB',]
bratsberg_ub_oh    <- bratsberg_ub_2017[bratsberg_ub_2017$Plot=='ØH',]
bratsberg_ub_nh    <- bratsberg_ub_2017[bratsberg_ub_2017$Plot=='NH',]
bratsberg_ub_nv    <- bratsberg_ub_2017[bratsberg_ub_2017$Plot=='NV',]
bratsberg_ub_ov    <- bratsberg_ub_2017[bratsberg_ub_2017$Plot=='ØV',]
bratsberg_ub_med   <- median(c(median(bratsberg_ub_oh$height_m), median(bratsberg_ub_nh$height_m), median(bratsberg_ub_nv$height_m), median(bratsberg_ub_ov$height_m)))


####Singsaas#########

singsaas_2015    <- dat4[dat4$LocalityName=='Singsås'& dat4$year=='2015',]

singsaas_b_2015  <- singsaas_2015[singsaas_2015$Treatment=='B',]
singsaas_b_oh    <- singsaas_b_2015[singsaas_b_2015$Plot=='ØH',]
singsaas_b_nh    <- singsaas_b_2015[singsaas_b_2015$Plot=='NH',]
singsaas_b_nv    <- singsaas_b_2015[singsaas_b_2015$Plot=='NV',]
singsaas_b_ov    <- singsaas_b_2015[singsaas_b_2015$Plot=='ØV',]
singsaas_b_med   <- median(c(median(singsaas_b_oh$height_m), median(singsaas_b_nh$height_m), median(singsaas_b_nv$height_m), median(singsaas_b_ov$height_m)))


singsaas_ub_2015 <- singsaas_2015[singsaas_2015$Treatment=='UB',]
singsaas_ub_oh    <- singsaas_ub_2015[singsaas_ub_2015$Plot=='ØH',]
singsaas_ub_nh    <- singsaas_ub_2015[singsaas_ub_2015$Plot=='NH',]
singsaas_ub_nv    <- singsaas_ub_2015[singsaas_ub_2015$Plot=='NV',]
singsaas_ub_ov    <- singsaas_ub_2015[singsaas_ub_2015$Plot=='ØV',]
singsaas_ub_med   <- median(c(median(singsaas_ub_oh$height_m), median(singsaas_ub_nh$height_m), median(singsaas_ub_nv$height_m), median(singsaas_ub_ov$height_m)))


####Malvik####

malvik_2016     <- dat4[dat4$LocalityName=='Malvik'& dat4$year=='2016',]
malvik_b_2016   <- malvik_2016[malvik_2016$Treatment=='B',]
malvik_ub_2016  <- malvik_2016[malvik_2016$Treatment=='UB',]
malvik_b_med    <- median(malvik_b_2016$height_m)
malvik_ub_med   <- median(malvik_ub_2016$height_m)

malvik_b_2016  <- malvik_2016[malvik_2016$Treatment=='B',]
malvik_b_oh    <- malvik_b_2016[malvik_b_2016$Plot=='ØH',]
malvik_b_nh    <- malvik_b_2016[malvik_b_2016$Plot=='NH',]
malvik_b_nv    <- malvik_b_2016[malvik_b_2016$Plot=='NV',]
malvik_b_ov    <- malvik_b_2016[malvik_b_2016$Plot=='ØV',]
malvik_b_med   <- median(c(median(malvik_b_oh$height_m), median(malvik_b_nh$height_m), median(malvik_b_nv$height_m), median(malvik_b_ov$height_m)))


malvik_ub_2016 <- malvik_2016[malvik_2016$Treatment=='UB',]
malvik_ub_oh    <- malvik_ub_2016[malvik_ub_2016$Plot=='ØH',]
malvik_ub_nh    <- malvik_ub_2016[malvik_ub_2016$Plot=='NH',]
malvik_ub_nv    <- malvik_ub_2016[malvik_ub_2016$Plot=='NV',]
malvik_ub_ov    <- malvik_ub_2016[malvik_ub_2016$Plot=='ØV',]
malvik_ub_med   <- median(c(median(malvik_ub_oh$height_m), median(malvik_ub_nh$height_m), median(malvik_ub_nv$height_m), median(malvik_ub_ov$height_m)))


####Selbu_flub####

selbu_flub_2015     <- dat4[dat4$LocalityName=='Selbu_Flub'& dat4$year=='2015',]

selbu_flub_b_2015  <- selbu_flub_2015[selbu_flub_2015$Treatment=='B',]
selbu_flub_b_oh    <- selbu_flub_b_2015[selbu_flub_b_2015$Plot=='ØH',]
selbu_flub_b_nh    <- selbu_flub_b_2015[selbu_flub_b_2015$Plot=='NH',]
selbu_flub_b_nv    <- selbu_flub_b_2015[selbu_flub_b_2015$Plot=='NV',]
selbu_flub_b_ov    <- selbu_flub_b_2015[selbu_flub_b_2015$Plot=='ØV',]
selbu_flub_b_med   <- median(c(median(selbu_flub_b_oh$height_m), median(selbu_flub_b_nh$height_m), median(selbu_flub_b_nv$height_m), median(selbu_flub_b_ov$height_m)))


selbu_flub_ub_2015 <- selbu_flub_2015[selbu_flub_2015$Treatment=='UB',]
selbu_flub_ub_oh    <- selbu_flub_ub_2015[selbu_flub_ub_2015$Plot=='ØH',]
selbu_flub_ub_nh    <- selbu_flub_ub_2015[selbu_flub_ub_2015$Plot=='NH',]
selbu_flub_ub_nv    <- selbu_flub_ub_2015[selbu_flub_ub_2015$Plot=='NV',]
selbu_flub_ub_ov    <- selbu_flub_ub_2015[selbu_flub_ub_2015$Plot=='ØV',]
selbu_flub_ub_med   <- median(c(median(selbu_flub_ub_oh$height_m), median(selbu_flub_ub_nh$height_m), median(selbu_flub_ub_nv$height_m), median(selbu_flub_ub_ov$height_m)))


####Selbu_kl####
selbu_kl_2015     <- dat4[dat4$LocalityName=='Selbu_kl'& dat4$year=='2015',]

selbu_kl_b_2015  <- selbu_kl_2015[selbu_kl_2015$Treatment=='B',]
selbu_kl_b_oh    <- selbu_kl_b_2015[selbu_kl_b_2015$Plot=='ØH',]
selbu_kl_b_nh    <- selbu_kl_b_2015[selbu_kl_b_2015$Plot=='NH',]
selbu_kl_b_nv    <- selbu_kl_b_2015[selbu_kl_b_2015$Plot=='NV',]
selbu_kl_b_ov    <- selbu_kl_b_2015[selbu_kl_b_2015$Plot=='ØV',]
selbu_kl_b_med   <- median(c(median(selbu_kl_b_oh$height_m), median(selbu_kl_b_nh$height_m), median(selbu_kl_b_nv$height_m), median(selbu_kl_b_ov$height_m)))


selbu_kl_ub_2015 <- selbu_kl_2015[selbu_kl_2015$Treatment=='UB',]
selbu_kl_ub_oh    <- selbu_kl_ub_2015[selbu_kl_ub_2015$Plot=='ØH',]
selbu_kl_ub_nh    <- selbu_kl_ub_2015[selbu_kl_ub_2015$Plot=='NH',]
selbu_kl_ub_nv    <- selbu_kl_ub_2015[selbu_kl_ub_2015$Plot=='NV',]
selbu_kl_ub_ov    <- selbu_kl_ub_2015[selbu_kl_ub_2015$Plot=='ØV',]
selbu_kl_ub_med   <- median(c(median(selbu_kl_ub_oh$height_m), median(selbu_kl_ub_nh$height_m), median(selbu_kl_ub_nv$height_m), median(selbu_kl_ub_ov$height_m)))

####Selbu_sl####
selbu_sl_2015     <- dat4[dat4$LocalityName=='Selbu_Sl'& dat4$year=='2015',]

selbu_sl_b_2015  <- selbu_sl_2015[selbu_sl_2015$Treatment=='B',]
selbu_sl_b_oh    <- selbu_sl_b_2015[selbu_sl_b_2015$Plot=='ØH',]
selbu_sl_b_nh    <- selbu_sl_b_2015[selbu_sl_b_2015$Plot=='NH',]
selbu_sl_b_nv    <- selbu_sl_b_2015[selbu_sl_b_2015$Plot=='NV',]
selbu_sl_b_ov    <- selbu_sl_b_2015[selbu_sl_b_2015$Plot=='ØV',]
selbu_sl_b_med   <- median(c(median(selbu_sl_b_oh$height_m), median(selbu_sl_b_nh$height_m), median(selbu_sl_b_nv$height_m), median(selbu_sl_b_ov$height_m)))


selbu_sl_ub_2015 <- selbu_sl_2015[selbu_sl_2015$Treatment=='UB',]
selbu_sl_ub_oh    <- selbu_sl_ub_2015[selbu_sl_ub_2015$Plot=='ØH',]
selbu_sl_ub_nh    <- selbu_sl_ub_2015[selbu_sl_ub_2015$Plot=='NH',]
selbu_sl_ub_nv    <- selbu_sl_ub_2015[selbu_sl_ub_2015$Plot=='NV',]
selbu_sl_ub_ov    <- selbu_sl_ub_2015[selbu_sl_ub_2015$Plot=='ØV',]
selbu_sl_ub_med   <- median(c(median(selbu_sl_ub_oh$height_m), median(selbu_sl_ub_nh$height_m), median(selbu_sl_ub_nv$height_m), median(selbu_sl_ub_ov$height_m)))


####hi_tydal####
hi_tydal_2015     <- dat4[dat4$LocalityName=='Hi_tydal'& dat4$year=='2015',]

hi_tydal_b_2015  <- hi_tydal_2015[hi_tydal_2015$Treatment=='B',]
hi_tydal_b_oh    <- hi_tydal_b_2015[hi_tydal_b_2015$Plot=='ØH',]
hi_tydal_b_nh    <- hi_tydal_b_2015[hi_tydal_b_2015$Plot=='NH',]
hi_tydal_b_nv    <- hi_tydal_b_2015[hi_tydal_b_2015$Plot=='NV',]
hi_tydal_b_ov    <- hi_tydal_b_2015[hi_tydal_b_2015$Plot=='ØV',]
hi_tydal_b_med   <- median(c(median(hi_tydal_b_oh$height_m), median(hi_tydal_b_nh$height_m), median(hi_tydal_b_nv$height_m), median(hi_tydal_b_ov$height_m)))


hi_tydal_ub_2015 <- hi_tydal_2015[hi_tydal_2015$Treatment=='UB',]
hi_tydal_ub_oh    <- hi_tydal_ub_2015[hi_tydal_ub_2015$Plot=='ØH',]
hi_tydal_ub_nh    <- hi_tydal_ub_2015[hi_tydal_ub_2015$Plot=='NH',]
hi_tydal_ub_nv    <- hi_tydal_ub_2015[hi_tydal_ub_2015$Plot=='NV',]
hi_tydal_ub_ov    <- hi_tydal_ub_2015[hi_tydal_ub_2015$Plot=='ØV',]
hi_tydal_ub_med   <- median(c(median(hi_tydal_ub_oh$height_m), median(hi_tydal_ub_nh$height_m), median(hi_tydal_ub_nv$height_m), median(hi_tydal_ub_ov$height_m)))
s

####Sl_tydal####
sl_tydal_2015     <- dat4[dat4$LocalityName=='Sl_Tydal'& dat4$year=='2015',]

sl_tydal_b_2015  <- sl_tydal_2015[sl_tydal_2015$Treatment=='B',]
sl_tydal_b_oh    <- sl_tydal_b_2015[sl_tydal_b_2015$Plot=='ØH',]
sl_tydal_b_nh    <- sl_tydal_b_2015[sl_tydal_b_2015$Plot=='NH',]
sl_tydal_b_nv    <- sl_tydal_b_2015[sl_tydal_b_2015$Plot=='NV',]
sl_tydal_b_ov    <- sl_tydal_b_2015[sl_tydal_b_2015$Plot=='ØV',]
sl_tydal_b_med   <- median(c(median(sl_tydal_b_oh$height_m), median(sl_tydal_b_nh$height_m), median(sl_tydal_b_nv$height_m), median(sl_tydal_b_ov$height_m)))


sl_tydal_ub_2015 <- sl_tydal_2015[sl_tydal_2015$Treatment=='UB',]
sl_tydal_ub_oh    <- sl_tydal_ub_2015[sl_tydal_ub_2015$Plot=='ØH',]
sl_tydal_ub_nh    <- sl_tydal_ub_2015[sl_tydal_ub_2015$Plot=='NH',]
sl_tydal_ub_nv    <- sl_tydal_ub_2015[sl_tydal_ub_2015$Plot=='NV',]
sl_tydal_ub_ov    <- sl_tydal_ub_2015[sl_tydal_ub_2015$Plot=='ØV',]
sl_tydal_ub_med   <- median(c(median(sl_tydal_ub_oh$height_m), median(sl_tydal_ub_nh$height_m), median(sl_tydal_ub_nv$height_m), median(sl_tydal_ub_ov$height_m)))

####Steinkjer_1BBb####
steinkjer_1BBb_2011     <- dat4[dat4$LocalityName=='steinkjer_1BBb'& dat4$year=='2011',]

steinkjer_1BBb_b_2011  <- steinkjer_1BBb_2011[steinkjer_1BBb_2011$Treatment=='B',]
steinkjer_1BBb_b_oh    <- steinkjer_1BBb_b_2011[steinkjer_1BBb_b_2011$Plot=='ØH',]
steinkjer_1BBb_b_nh    <- steinkjer_1BBb_b_2011[steinkjer_1BBb_b_2011$Plot=='NH',]
steinkjer_1BBb_b_nv    <- steinkjer_1BBb_b_2011[steinkjer_1BBb_b_2011$Plot=='NV',]
steinkjer_1BBb_b_ov    <- steinkjer_1BBb_b_2011[steinkjer_1BBb_b_2011$Plot=='ØV',]
steinkjer_1BBb_b_med   <- median(c(median(steinkjer_1BBb_b_oh$height_m), median(steinkjer_1BBb_b_nh$height_m), median(steinkjer_1BBb_b_nv$height_m), median(steinkjer_1BBb_b_ov$height_m)))


steinkjer_1BBb_ub_2011 <- steinkjer_1BBb_2011[steinkjer_1BBb_2011$Treatment=='UB',]
steinkjer_1BBb_ub_oh    <- steinkjer_1BBb_ub_2011[steinkjer_1BBb_ub_2011$Plot=='ØH',]
steinkjer_1BBb_ub_nh    <- steinkjer_1BBb_ub_2011[steinkjer_1BBb_ub_2011$Plot=='NH',]
steinkjer_1BBb_ub_nv    <- steinkjer_1BBb_ub_2011[steinkjer_1BBb_ub_2011$Plot=='NV',]
steinkjer_1BBb_ub_ov    <- steinkjer_1BBb_ub_2011[steinkjer_1BBb_ub_2011$Plot=='ØV',]
steinkjer_1BBb_ub_med   <- median(c(median(steinkjer_1BBb_ub_oh$height_m), median(steinkjer_1BBb_ub_nh$height_m), median(steinkjer_1BBb_ub_nv$height_m), median(steinkjer_1BBb_ub_ov$height_m)))

####Steinkjer_2BBb####
steinkjer_2BBb_2011     <- dat4[dat4$LocalityName=='steinkjer_2BBb'& dat4$year=='2011',]

steinkjer_2BBb_b_2011  <- steinkjer_2BBb_2011[steinkjer_2BBb_2011$Treatment=='B',]
steinkjer_2BBb_b_oh    <- steinkjer_2BBb_b_2011[steinkjer_2BBb_b_2011$Plot=='ØH',]
steinkjer_2BBb_b_nh    <- steinkjer_2BBb_b_2011[steinkjer_2BBb_b_2011$Plot=='NH',]
steinkjer_2BBb_b_nv    <- steinkjer_2BBb_b_2011[steinkjer_2BBb_b_2011$Plot=='NV',]
steinkjer_2BBb_b_ov    <- steinkjer_2BBb_b_2011[steinkjer_2BBb_b_2011$Plot=='ØV',]
steinkjer_2BBb_b_med   <- median(c(median(steinkjer_2BBb_b_oh$height_m), median(steinkjer_2BBb_b_nh$height_m), median(steinkjer_2BBb_b_nv$height_m), median(steinkjer_2BBb_b_ov$height_m)))


steinkjer_2BBb_ub_2011 <- steinkjer_2BBb_2011[steinkjer_2BBb_2011$Treatment=='UB',]
steinkjer_2BBb_ub_oh    <- steinkjer_2BBb_ub_2011[steinkjer_2BBb_ub_2011$Plot=='ØH',]
steinkjer_2BBb_ub_nh    <- steinkjer_2BBb_ub_2011[steinkjer_2BBb_ub_2011$Plot=='NH',]
steinkjer_2BBb_ub_nv    <- steinkjer_2BBb_ub_2011[steinkjer_2BBb_ub_2011$Plot=='NV',]
steinkjer_2BBb_ub_ov    <- steinkjer_2BBb_ub_2011[steinkjer_2BBb_ub_2011$Plot=='ØV',]
steinkjer_2BBb_ub_med   <- median(c(median(steinkjer_2BBb_ub_oh$height_m), median(steinkjer_2BBb_ub_nh$height_m), median(steinkjer_2BBb_ub_nv$height_m), median(steinkjer_2BBb_ub_ov$height_m)))

####Nsb_Verdal####
nsb_verdal_2015     <- dat4[dat4$LocalityName=='Nsb_Verdal'& dat4$year=='2015',]

nsb_verdal_b_2015  <- nsb_verdal_2015[nsb_verdal_2015$Treatment=='B',]
nsb_verdal_b_oh    <- nsb_verdal_b_2015[nsb_verdal_b_2015$Plot=='ØH',]
nsb_verdal_b_nh    <- nsb_verdal_b_2015[nsb_verdal_b_2015$Plot=='NH',]
nsb_verdal_b_nv    <- nsb_verdal_b_2015[nsb_verdal_b_2015$Plot=='NV',]
nsb_verdal_b_ov    <- nsb_verdal_b_2015[nsb_verdal_b_2015$Plot=='ØV',]
nsb_verdal_b_med   <- median(c(median(nsb_verdal_b_oh$height_m), median(nsb_verdal_b_nh$height_m), median(nsb_verdal_b_nv$height_m), median(nsb_verdal_b_ov$height_m)))


nsb_verdal_ub_2015 <- nsb_verdal_2015[nsb_verdal_2015$Treatment=='UB',]
nsb_verdal_ub_oh    <- nsb_verdal_ub_2015[nsb_verdal_ub_2015$Plot=='ØH',]
nsb_verdal_ub_nh    <- nsb_verdal_ub_2015[nsb_verdal_ub_2015$Plot=='NH',]
nsb_verdal_ub_nv    <- nsb_verdal_ub_2015[nsb_verdal_ub_2015$Plot=='NV',]
nsb_verdal_ub_ov    <- nsb_verdal_ub_2015[nsb_verdal_ub_2015$Plot=='ØV',]

#replacing NA with 0
vec1 <- c(median(nsb_verdal_ub_oh$height_m), median(nsb_verdal_ub_nh$height_m), median(nsb_verdal_ub_nv$height_m), median(nsb_verdal_ub_ov$height_m))
vec1[is.na(vec1)] <- 0

nsb_verdal_ub_med <- median(vec1)

####Verdal_1vb####
verdal_1vb_2015    <- dat4[dat4$LocalityName=='verdal_1vb'& dat4$year=='2015',]

verdal_1vb_b_2015  <- verdal_1vb_2015[verdal_1vb_2015$Treatment=='B',]
verdal_1vb_b_oh    <- verdal_1vb_b_2015[verdal_1vb_b_2015$Plot=='ØH',]
verdal_1vb_b_nh    <- verdal_1vb_b_2015[verdal_1vb_b_2015$Plot=='NH',]
verdal_1vb_b_nv    <- verdal_1vb_b_2015[verdal_1vb_b_2015$Plot=='NV',]
verdal_1vb_b_ov    <- verdal_1vb_b_2015[verdal_1vb_b_2015$Plot=='ØV',]
verdal_1vb_b_med   <- median(c(median(verdal_1vb_b_oh$height_m), median(verdal_1vb_b_nh$height_m), median(verdal_1vb_b_nv$height_m), median(verdal_1vb_b_ov$height_m)))

verdal_1vb_ub_2015 <- verdal_1vb_2015[verdal_1vb_2015$Treatment=='UB',]
verdal_1vb_ub_oh    <- verdal_1vb_ub_2015[verdal_1vb_ub_2015$Plot=='ØH',]
verdal_1vb_ub_nh    <- verdal_1vb_ub_2015[verdal_1vb_ub_2015$Plot=='NH',]
verdal_1vb_ub_nv    <- verdal_1vb_ub_2015[verdal_1vb_ub_2015$Plot=='NV',]
verdal_1vb_ub_ov    <- verdal_1vb_ub_2015[verdal_1vb_ub_2015$Plot=='ØV',]
verdal_1vb_ub_med   <- median(c(median(verdal_1vb_ub_oh$height_m), median(verdal_1vb_ub_nh$height_m), median(verdal_1vb_ub_nv$height_m), median(verdal_1vb_ub_ov$height_m)))


####Verdal_2vb####
verdal_2vb_2015    <- dat4[dat4$LocalityName=='verdal_2VB'& dat4$year=='2015',]

verdal_2vb_b_2015  <- verdal_2vb_2015[verdal_2vb_2015$Treatment=='B',]
verdal_2vb_b_oh    <- verdal_2vb_b_2015[verdal_2vb_b_2015$Plot=='ØH',]
verdal_2vb_b_nh    <- verdal_2vb_b_2015[verdal_2vb_b_2015$Plot=='NH',]
verdal_2vb_b_nv    <- verdal_2vb_b_2015[verdal_2vb_b_2015$Plot=='NV',]
verdal_2vb_b_ov    <- verdal_2vb_b_2015[verdal_2vb_b_2015$Plot=='ØV',]
verdal_2vb_b_med   <- median(c(median(verdal_2vb_b_oh$height_m), median(verdal_2vb_b_nh$height_m), median(verdal_2vb_b_nv$height_m), median(verdal_2vb_b_ov$height_m)))

verdal_2vb_ub_2015 <- verdal_2vb_2015[verdal_2vb_2015$Treatment=='UB',]
verdal_2vb_ub_oh    <- verdal_2vb_ub_2015[verdal_2vb_ub_2015$Plot=='ØH',]
verdal_2vb_ub_nh    <- verdal_2vb_ub_2015[verdal_2vb_ub_2015$Plot=='NH',]
verdal_2vb_ub_nv    <- verdal_2vb_ub_2015[verdal_2vb_ub_2015$Plot=='NV',]
verdal_2vb_ub_ov    <- verdal_2vb_ub_2015[verdal_2vb_ub_2015$Plot=='ØV',]
verdal_2vb_ub_med   <- median(c(median(verdal_2vb_ub_oh$height_m), median(verdal_2vb_ub_nh$height_m), median(verdal_2vb_ub_nv$height_m), median(verdal_2vb_ub_ov$height_m)))


####Namdalseid_1kub####
namdalseid_1kub_2010    <- dat4[dat4$LocalityName=='namdalseid_1kub'& dat4$year=='2010',]

namdalseid_1kub_b_2010  <- namdalseid_1kub_2010[namdalseid_1kub_2010$Treatment=='B',]
namdalseid_1kub_b_oh    <- namdalseid_1kub_b_2010[namdalseid_1kub_b_2010$Plot=='ØH',]
namdalseid_1kub_b_nh    <- namdalseid_1kub_b_2010[namdalseid_1kub_b_2010$Plot=='NH',]
namdalseid_1kub_b_nv    <- namdalseid_1kub_b_2010[namdalseid_1kub_b_2010$Plot=='NV',]
namdalseid_1kub_b_ov    <- namdalseid_1kub_b_2010[namdalseid_1kub_b_2010$Plot=='ØV',]
namdalseid_1kub_b_med   <- median(c(median(namdalseid_1kub_b_oh$height_m), median(namdalseid_1kub_b_nh$height_m), median(namdalseid_1kub_b_nv$height_m), median(namdalseid_1kub_b_ov$height_m)))

namdalseid_1kub_ub_2010 <- namdalseid_1kub_2010[namdalseid_1kub_2010$Treatment=='UB',]
namdalseid_1kub_ub_oh    <- namdalseid_1kub_ub_2010[namdalseid_1kub_ub_2010$Plot=='ØH',]
namdalseid_1kub_ub_nh    <- namdalseid_1kub_ub_2010[namdalseid_1kub_ub_2010$Plot=='NH',]
namdalseid_1kub_ub_nv    <- namdalseid_1kub_ub_2010[namdalseid_1kub_ub_2010$Plot=='NV',]
namdalseid_1kub_ub_ov    <- namdalseid_1kub_ub_2010[namdalseid_1kub_ub_2010$Plot=='ØV',]
namdalseid_1kub_ub_med   <- median(c(median(namdalseid_1kub_ub_oh$height_m), median(namdalseid_1kub_ub_nh$height_m), median(namdalseid_1kub_ub_nv$height_m), median(namdalseid_1kub_ub_ov$height_m)))


####Sub_Namdalseid####
sub_namdalseid_2010    <- dat4[dat4$LocalityName=='Sub_Namdalseid'& dat4$year=='2010',]

sub_namdalseid_b_2010  <- sub_namdalseid_2010[sub_namdalseid_2010$Treatment=='B',]
sub_namdalseid_b_oh    <- sub_namdalseid_b_2010[sub_namdalseid_b_2010$Plot=='ØH',]
sub_namdalseid_b_nh    <- sub_namdalseid_b_2010[sub_namdalseid_b_2010$Plot=='NH',]
sub_namdalseid_b_nv    <- sub_namdalseid_b_2010[sub_namdalseid_b_2010$Plot=='NV',]
sub_namdalseid_b_ov    <- sub_namdalseid_b_2010[sub_namdalseid_b_2010$Plot=='ØV',]
sub_namdalseid_b_med   <- median(c(median(sub_namdalseid_b_oh$height_m), median(sub_namdalseid_b_nh$height_m), median(sub_namdalseid_b_nv$height_m), median(sub_namdalseid_b_ov$height_m)))

sub_namdalseid_ub_2010 <- sub_namdalseid_2010[sub_namdalseid_2010$Treatment=='UB',]
sub_namdalseid_ub_oh    <- sub_namdalseid_ub_2010[sub_namdalseid_ub_2010$Plot=='ØH',]
sub_namdalseid_ub_nh    <- sub_namdalseid_ub_2010[sub_namdalseid_ub_2010$Plot=='NH',]
sub_namdalseid_ub_nv    <- sub_namdalseid_ub_2010[sub_namdalseid_ub_2010$Plot=='NV',]
sub_namdalseid_ub_ov    <- sub_namdalseid_ub_2010[sub_namdalseid_ub_2010$Plot=='ØV',]
sub_namdalseid_ub_med   <- median(c(median(sub_namdalseid_ub_oh$height_m), median(sub_namdalseid_ub_nh$height_m), median(sub_namdalseid_ub_nv$height_m), median(sub_namdalseid_ub_ov$height_m)))



# Telemark ----------------------------------------------------------------

#Telemark - calculating median for sites in dat4

####Fritsø1####
fritsoe1_2017    <- dat4[dat4$LocalityName=='Fritsøe1'& dat4$year=='2017',]

fritsoe1_b_2017  <- fritsoe1_2017[fritsoe1_2017$Treatment=='B',]
fritsoe1_b_oh    <- fritsoe1_b_2017[fritsoe1_b_2017$Plot=='ØH',]
fritsoe1_b_nh    <- fritsoe1_b_2017[fritsoe1_b_2017$Plot=='NH',]
fritsoe1_b_nv    <- fritsoe1_b_2017[fritsoe1_b_2017$Plot=='NV',]
fritsoe1_b_ov    <- fritsoe1_b_2017[fritsoe1_b_2017$Plot=='ØV',]
fritsoe1_b_med   <- median(c(median(fritsoe1_b_oh$height_m), median(fritsoe1_b_nh$height_m), median(fritsoe1_b_nv$height_m), median(fritsoe1_b_ov$height_m)))

fritsoe1_ub_2017 <- fritsoe1_2017[fritsoe1_2017$Treatment=='UB',]
fritsoe1_ub_oh    <- fritsoe1_ub_2017[fritsoe1_ub_2017$Plot=='ØH',]
fritsoe1_ub_nh    <- fritsoe1_ub_2017[fritsoe1_ub_2017$Plot=='NH',]
fritsoe1_ub_nv    <- fritsoe1_ub_2017[fritsoe1_ub_2017$Plot=='NV',]
fritsoe1_ub_ov    <- fritsoe1_ub_2017[fritsoe1_ub_2017$Plot=='ØV',]
fritsoe1_ub_med   <- median(c(median(fritsoe1_ub_oh$height_m), median(fritsoe1_ub_nh$height_m), median(fritsoe1_ub_nv$height_m), median(fritsoe1_ub_ov$height_m)))


####Fritsø2####
fritsoe2_2017    <- dat4[dat4$LocalityName=='Fritsøe2'& dat4$year=='2017',]

fritsoe2_b_2017  <- fritsoe2_2017[fritsoe2_2017$Treatment=='B',]
fritsoe2_b_oh    <- fritsoe2_b_2017[fritsoe2_b_2017$Plot=='ØH',]
fritsoe2_b_nh    <- fritsoe2_b_2017[fritsoe2_b_2017$Plot=='NH',]
fritsoe2_b_nv    <- fritsoe2_b_2017[fritsoe2_b_2017$Plot=='NV',]
fritsoe2_b_ov    <- fritsoe2_b_2017[fritsoe2_b_2017$Plot=='ØV',]
fritsoe2_b_med   <- median(c(median(fritsoe2_b_oh$height_m), median(fritsoe2_b_nh$height_m), median(fritsoe2_b_nv$height_m), median(fritsoe2_b_ov$height_m)))

fritsoe2_ub_2017 <- fritsoe2_2017[fritsoe2_2017$Treatment=='UB',]
fritsoe2_ub_oh    <- fritsoe2_ub_2017[fritsoe2_ub_2017$Plot=='ØH',]
fritsoe2_ub_nh    <- fritsoe2_ub_2017[fritsoe2_ub_2017$Plot=='NH',]
fritsoe2_ub_nv    <- fritsoe2_ub_2017[fritsoe2_ub_2017$Plot=='NV',]
fritsoe2_ub_ov    <- fritsoe2_ub_2017[fritsoe2_ub_2017$Plot=='ØV',]
fritsoe2_ub_med   <- median(c(median(fritsoe2_ub_oh$height_m), median(fritsoe2_ub_nh$height_m), median(fritsoe2_ub_nv$height_m), median(fritsoe2_ub_ov$height_m)))

####Nome_cappelen1####
nome_cappelen1_2017    <- dat4[dat4$LocalityName=='Nome_Cappelen1'& dat4$year=='2017',]

nome_cappelen1_b_2017  <- nome_cappelen1_2017[nome_cappelen1_2017$Treatment=='B',]
nome_cappelen1_b_oh    <- nome_cappelen1_b_2017[nome_cappelen1_b_2017$Plot=='ØH',]
nome_cappelen1_b_nh    <- nome_cappelen1_b_2017[nome_cappelen1_b_2017$Plot=='NH',]
nome_cappelen1_b_nv    <- nome_cappelen1_b_2017[nome_cappelen1_b_2017$Plot=='NV',]
nome_cappelen1_b_ov    <- nome_cappelen1_b_2017[nome_cappelen1_b_2017$Plot=='ØV',]

#one circle with no trees
vec2 <- c(median(nome_cappelen1_b_oh$height_m), median(nome_cappelen1_b_nh$height_m), median(nome_cappelen1_b_nv$height_m), median(nome_cappelen1_b_ov$height_m))
vec2[is.na(vec2)] <- 0
nome_cappelen1_b_med <- median(vec2)

nome_cappelen1_ub_2017 <- nome_cappelen1_2017[nome_cappelen1_2017$Treatment=='UB',]
nome_cappelen1_ub_oh    <- nome_cappelen1_ub_2017[nome_cappelen1_ub_2017$Plot=='ØH',]
nome_cappelen1_ub_nh    <- nome_cappelen1_ub_2017[nome_cappelen1_ub_2017$Plot=='NH',]
nome_cappelen1_ub_nv    <- nome_cappelen1_ub_2017[nome_cappelen1_ub_2017$Plot=='NV',]
nome_cappelen1_ub_ov    <- nome_cappelen1_ub_2017[nome_cappelen1_ub_2017$Plot=='ØV',]
nome_cappelen1_ub_med   <- median(c(median(nome_cappelen1_ub_oh$height_m), median(nome_cappelen1_ub_nh$height_m), median(nome_cappelen1_ub_nv$height_m), median(nome_cappelen1_ub_ov$height_m)))

####Notodden3####
notodden3_2017    <- dat4[dat4$LocalityName=='Notodden3'& dat4$year=='2017',]

notodden3_b_2017  <- notodden3_2017[notodden3_2017$Treatment=='B',]
notodden3_b_oh    <- notodden3_b_2017[notodden3_b_2017$Plot=='ØH',]
notodden3_b_nh    <- notodden3_b_2017[notodden3_b_2017$Plot=='NH',]
notodden3_b_nv    <- notodden3_b_2017[notodden3_b_2017$Plot=='NV',]
notodden3_b_ov    <- notodden3_b_2017[notodden3_b_2017$Plot=='ØV',]

#one circle with no trees
vec3 <- c(median(notodden3_b_oh$height_m), median(notodden3_b_nh$height_m), median(notodden3_b_nv$height_m), median(notodden3_b_ov$height_m))
vec3[is.na(vec3)] <- 0
notodden3_b_med <- median(vec3)

notodden3_ub_2017 <- notodden3_2017[notodden3_2017$Treatment=='UB',]
notodden3_ub_oh    <- notodden3_ub_2017[notodden3_ub_2017$Plot=='ØH',]
notodden3_ub_nh    <- notodden3_ub_2017[notodden3_ub_2017$Plot=='NH',]
notodden3_ub_nv    <- notodden3_ub_2017[notodden3_ub_2017$Plot=='NV',]
notodden3_ub_ov    <- notodden3_ub_2017[notodden3_ub_2017$Plot=='ØV',]
notodden3_ub_med   <- median(c(median(notodden3_ub_oh$height_m), median(notodden3_ub_nh$height_m), median(notodden3_ub_nv$height_m), median(notodden3_ub_ov$height_m)))

####Notodden5####
notodden5_2017    <- dat4[dat4$LocalityName=='Notodden5'& dat4$year=='2017',]

notodden5_b_2017  <- notodden5_2017[notodden5_2017$Treatment=='B',]
notodden5_b_oh    <- notodden5_b_2017[notodden5_b_2017$Plot=='ØH',]
notodden5_b_nh    <- notodden5_b_2017[notodden5_b_2017$Plot=='NH',]
notodden5_b_nv    <- notodden5_b_2017[notodden5_b_2017$Plot=='NV',]
notodden5_b_ov    <- notodden5_b_2017[notodden5_b_2017$Plot=='ØV',]
notodden5_b_med   <- median(c(median(notodden5_b_oh$height_m), median(notodden5_b_nh$height_m), median(notodden5_b_nv$height_m), median(notodden5_b_ov$height_m)))

notodden5_ub_2017 <- notodden5_2017[notodden5_2017$Treatment=='UB',]
notodden5_ub_oh    <- notodden5_ub_2017[notodden5_ub_2017$Plot=='ØH',]
notodden5_ub_nh    <- notodden5_ub_2017[notodden5_ub_2017$Plot=='NH',]
notodden5_ub_nv    <- notodden5_ub_2017[notodden5_ub_2017$Plot=='NV',]
notodden5_ub_ov    <- notodden5_ub_2017[notodden5_ub_2017$Plot=='ØV',]
notodden5_ub_med   <- median(c(median(notodden5_ub_oh$height_m), median(notodden5_ub_nh$height_m), median(notodden5_ub_nv$height_m), median(notodden5_ub_ov$height_m)))

####Notodden6####
notodden6_2017    <- dat4[dat4$LocalityName=='Notodden6'& dat4$year=='2017',]

notodden6_b_2017  <- notodden6_2017[notodden6_2017$Treatment=='B',]
notodden6_b_oh    <- notodden6_b_2017[notodden6_b_2017$Plot=='ØH',]
notodden6_b_nh    <- notodden6_b_2017[notodden6_b_2017$Plot=='NH',]
notodden6_b_nv    <- notodden6_b_2017[notodden6_b_2017$Plot=='NV',]
notodden6_b_ov    <- notodden6_b_2017[notodden6_b_2017$Plot=='ØV',]
notodden6_b_med   <- median(c(median(notodden6_b_oh$height_m), median(notodden6_b_nh$height_m), median(notodden6_b_nv$height_m), median(notodden6_b_ov$height_m)))

notodden6_ub_2017 <- notodden6_2017[notodden6_2017$Treatment=='UB',]
notodden6_ub_oh    <- notodden6_ub_2017[notodden6_ub_2017$Plot=='ØH',]
notodden6_ub_nh    <- notodden6_ub_2017[notodden6_ub_2017$Plot=='NH',]
notodden6_ub_nv    <- notodden6_ub_2017[notodden6_ub_2017$Plot=='NV',]
notodden6_ub_ov    <- notodden6_ub_2017[notodden6_ub_2017$Plot=='ØV',]
notodden6_ub_med   <- median(c(median(notodden6_ub_oh$height_m), median(notodden6_ub_nh$height_m), median(notodden6_ub_nv$height_m), median(notodden6_ub_ov$height_m)))


####Drangedal1####
drangedal1_2017    <- dat4[dat4$LocalityName=='Drangedal1'& dat4$year=='2017',]

drangedal1_b_2017  <- drangedal1_2017[drangedal1_2017$Treatment=='B',]
drangedal1_b_oh    <- drangedal1_b_2017[drangedal1_b_2017$Plot=='ØH',]
drangedal1_b_nh    <- drangedal1_b_2017[drangedal1_b_2017$Plot=='NH',]
drangedal1_b_nv    <- drangedal1_b_2017[drangedal1_b_2017$Plot=='NV',]
drangedal1_b_ov    <- drangedal1_b_2017[drangedal1_b_2017$Plot=='ØV',]
drangedal1_b_med   <- median(c(median(drangedal1_b_oh$height_m), median(drangedal1_b_nh$height_m), median(drangedal1_b_nv$height_m), median(drangedal1_b_ov$height_m)))

drangedal1_ub_2017 <- drangedal1_2017[drangedal1_2017$Treatment=='UB',]
drangedal1_ub_oh    <- drangedal1_ub_2017[drangedal1_ub_2017$Plot=='ØH',]
drangedal1_ub_nh    <- drangedal1_ub_2017[drangedal1_ub_2017$Plot=='NH',]
drangedal1_ub_nv    <- drangedal1_ub_2017[drangedal1_ub_2017$Plot=='NV',]
drangedal1_ub_ov    <- drangedal1_ub_2017[drangedal1_ub_2017$Plot=='ØV',]
drangedal1_ub_med   <- median(c(median(drangedal1_ub_oh$height_m), median(drangedal1_ub_nh$height_m), median(drangedal1_ub_nv$height_m), median(drangedal1_ub_ov$height_m)))


####Drangedal3####
drangedal3_2016    <- dat4[dat4$LocalityName=='Drangedal3'& dat4$year=='2016',]

drangedal3_b_2016  <- drangedal3_2016[drangedal3_2016$Treatment=='B',]
drangedal3_b_oh    <- drangedal3_b_2016[drangedal3_b_2016$Plot=='ØH',]
drangedal3_b_nh    <- drangedal3_b_2016[drangedal3_b_2016$Plot=='NH',]
drangedal3_b_nv    <- drangedal3_b_2016[drangedal3_b_2016$Plot=='NV',]
drangedal3_b_ov    <- drangedal3_b_2016[drangedal3_b_2016$Plot=='ØV',]
drangedal3_b_med   <- median(c(median(drangedal3_b_oh$height_m), median(drangedal3_b_nh$height_m), median(drangedal3_b_nv$height_m), median(drangedal3_b_ov$height_m)))

vec4 <- c(median(drangedal3_b_oh$height_m), median(drangedal3_b_nh$height_m), median(drangedal3_b_nv$height_m), median(drangedal3_b_ov$height_m))
vec4[is.na(vec4)] <- 0
drangedal3_b_med <- median(vec4)

drangedal3_ub_2016 <- drangedal3_2016[drangedal3_2016$Treatment=='UB',]
drangedal3_ub_oh    <- drangedal3_ub_2016[drangedal3_ub_2016$Plot=='ØH',]
drangedal3_ub_nh    <- drangedal3_ub_2016[drangedal3_ub_2016$Plot=='NH',]
drangedal3_ub_nv    <- drangedal3_ub_2016[drangedal3_ub_2016$Plot=='NV',]
drangedal3_ub_ov    <- drangedal3_ub_2016[drangedal3_ub_2016$Plot=='ØV',]
drangedal3_ub_med   <- median(c(median(drangedal3_ub_oh$height_m), median(drangedal3_ub_nh$height_m), median(drangedal3_ub_nv$height_m), median(drangedal3_ub_ov$height_m)))

####Drangedal4####
drangedal4_2016    <- dat4[dat4$LocalityName=='Drangedal4'& dat4$year=='2016',]

drangedal4_b_2016  <- drangedal4_2016[drangedal4_2016$Treatment=='B',]
drangedal4_b_oh    <- drangedal4_b_2016[drangedal4_b_2016$Plot=='ØH',]
drangedal4_b_nh    <- drangedal4_b_2016[drangedal4_b_2016$Plot=='NH',]
drangedal4_b_nv    <- drangedal4_b_2016[drangedal4_b_2016$Plot=='NV',]
drangedal4_b_ov    <- drangedal4_b_2016[drangedal4_b_2016$Plot=='ØV',]
drangedal4_b_med   <- median(c(median(drangedal4_b_oh$height_m), median(drangedal4_b_nh$height_m), median(drangedal4_b_nv$height_m), median(drangedal4_b_ov$height_m)))

drangedal4_ub_2016 <- drangedal4_2016[drangedal4_2016$Treatment=='UB',]
drangedal4_ub_oh    <- drangedal4_ub_2016[drangedal4_ub_2016$Plot=='ØH',]
drangedal4_ub_nh    <- drangedal4_ub_2016[drangedal4_ub_2016$Plot=='NH',]
drangedal4_ub_nv    <- drangedal4_ub_2016[drangedal4_ub_2016$Plot=='NV',]
drangedal4_ub_ov    <- drangedal4_ub_2016[drangedal4_ub_2016$Plot=='ØV',]
drangedal4_ub_med   <- median(c(median(drangedal4_ub_oh$height_m), median(drangedal4_ub_nh$height_m), median(drangedal4_ub_nv$height_m), median(drangedal4_ub_ov$height_m)))

####Nome_Cappelen2####
nome_cappelen2_2017    <- dat4[dat4$LocalityName=='Nome_Cappelen2'& dat4$year=='2017',]

nome_cappelen2_b_2017  <- nome_cappelen2_2017[nome_cappelen2_2017$Treatment=='B',]
nome_cappelen2_b_oh    <- nome_cappelen2_b_2017[nome_cappelen2_b_2017$Plot=='ØH',]
nome_cappelen2_b_nh    <- nome_cappelen2_b_2017[nome_cappelen2_b_2017$Plot=='NH',]
nome_cappelen2_b_nv    <- nome_cappelen2_b_2017[nome_cappelen2_b_2017$Plot=='NV',]
nome_cappelen2_b_ov    <- nome_cappelen2_b_2017[nome_cappelen2_b_2017$Plot=='ØV',]
nome_cappelen2_b_med   <- median(c(median(nome_cappelen2_b_oh$height_m), median(nome_cappelen2_b_nh$height_m), median(nome_cappelen2_b_nv$height_m), median(nome_cappelen2_b_ov$height_m)))

nome_cappelen2_ub_2017 <- nome_cappelen2_2017[nome_cappelen2_2017$Treatment=='UB',]
nome_cappelen2_ub_oh    <- nome_cappelen2_ub_2017[nome_cappelen2_ub_2017$Plot=='ØH',]
nome_cappelen2_ub_nh    <- nome_cappelen2_ub_2017[nome_cappelen2_ub_2017$Plot=='NH',]
nome_cappelen2_ub_nv    <- nome_cappelen2_ub_2017[nome_cappelen2_ub_2017$Plot=='NV',]
nome_cappelen2_ub_ov    <- nome_cappelen2_ub_2017[nome_cappelen2_ub_2017$Plot=='ØV',]
nome_cappelen2_ub_med   <- median(c(median(nome_cappelen2_ub_oh$height_m), median(nome_cappelen2_ub_nh$height_m), median(nome_cappelen2_ub_nv$height_m), median(nome_cappelen2_ub_ov$height_m)))


####Kviteseid1####
kviteseid1_2017    <- dat4[dat4$LocalityName=='Kviteseid1'& dat4$year=='2017',]

kviteseid1_b_2017  <- kviteseid1_2017[kviteseid1_2017$Treatment=='B',]
kviteseid1_b_oh    <- kviteseid1_b_2017[kviteseid1_b_2017$Plot=='ØH',]
kviteseid1_b_nh    <- kviteseid1_b_2017[kviteseid1_b_2017$Plot=='NH',]
kviteseid1_b_nv    <- kviteseid1_b_2017[kviteseid1_b_2017$Plot=='NV',]
kviteseid1_b_ov    <- kviteseid1_b_2017[kviteseid1_b_2017$Plot=='ØV',]
kviteseid1_b_med   <- median(c(median(kviteseid1_b_oh$height_m), median(kviteseid1_b_nh$height_m), median(kviteseid1_b_nv$height_m), median(kviteseid1_b_ov$height_m)))

kviteseid1_ub_2017 <- kviteseid1_2017[kviteseid1_2017$Treatment=='UB',]
kviteseid1_ub_oh    <- kviteseid1_ub_2017[kviteseid1_ub_2017$Plot=='ØH',]
kviteseid1_ub_nh    <- kviteseid1_ub_2017[kviteseid1_ub_2017$Plot=='NH',]
kviteseid1_ub_nv    <- kviteseid1_ub_2017[kviteseid1_ub_2017$Plot=='NV',]
kviteseid1_ub_ov    <- kviteseid1_ub_2017[kviteseid1_ub_2017$Plot=='ØV',]
kviteseid1_ub_med   <- median(c(median(kviteseid1_ub_oh$height_m), median(kviteseid1_ub_nh$height_m), median(kviteseid1_ub_nv$height_m), median(kviteseid1_ub_ov$height_m)))

####Kviteseid2####
kviteseid2_2017    <- dat4[dat4$LocalityName=='Kviteseid2'& dat4$year=='2017',]

kviteseid2_b_2017  <- kviteseid2_2017[kviteseid2_2017$Treatment=='B',]
kviteseid2_b_oh    <- kviteseid2_b_2017[kviteseid2_b_2017$Plot=='ØH',]
kviteseid2_b_nh    <- kviteseid2_b_2017[kviteseid2_b_2017$Plot=='NH',]
kviteseid2_b_nv    <- kviteseid2_b_2017[kviteseid2_b_2017$Plot=='NV',]
kviteseid2_b_ov    <- kviteseid2_b_2017[kviteseid2_b_2017$Plot=='ØV',]
kviteseid2_b_med   <- median(c(median(kviteseid2_b_oh$height_m), median(kviteseid2_b_nh$height_m), median(kviteseid2_b_nv$height_m), median(kviteseid2_b_ov$height_m)))

kviteseid2_ub_2017 <- kviteseid2_2017[kviteseid2_2017$Treatment=='UB',]
kviteseid2_ub_oh    <- kviteseid2_ub_2017[kviteseid2_ub_2017$Plot=='ØH',]
kviteseid2_ub_nh    <- kviteseid2_ub_2017[kviteseid2_ub_2017$Plot=='NH',]
kviteseid2_ub_nv    <- kviteseid2_ub_2017[kviteseid2_ub_2017$Plot=='NV',]
kviteseid2_ub_ov    <- kviteseid2_ub_2017[kviteseid2_ub_2017$Plot=='ØV',]
kviteseid2_ub_med   <- median(c(median(kviteseid2_ub_oh$height_m), median(kviteseid2_ub_nh$height_m), median(kviteseid2_ub_nv$height_m), median(kviteseid2_ub_ov$height_m)))

####Kviteseid3####
kviteseid3_2017    <- dat4[dat4$LocalityName=='Kviteseid3'& dat4$year=='2017',]

kviteseid3_b_2017  <- kviteseid3_2017[kviteseid3_2017$Treatment=='B',]
kviteseid3_b_oh    <- kviteseid3_b_2017[kviteseid3_b_2017$Plot=='ØH',]
kviteseid3_b_nh    <- kviteseid3_b_2017[kviteseid3_b_2017$Plot=='NH',]
kviteseid3_b_nv    <- kviteseid3_b_2017[kviteseid3_b_2017$Plot=='NV',]
kviteseid3_b_ov    <- kviteseid3_b_2017[kviteseid3_b_2017$Plot=='ØV',]
kviteseid3_b_med   <- median(c(median(kviteseid3_b_oh$height_m), median(kviteseid3_b_nh$height_m), median(kviteseid3_b_nv$height_m), median(kviteseid3_b_ov$height_m)))

kviteseid3_ub_2017 <- kviteseid3_2017[kviteseid3_2017$Treatment=='UB',]
kviteseid3_ub_oh    <- kviteseid3_ub_2017[kviteseid3_ub_2017$Plot=='ØH',]
kviteseid3_ub_nh    <- kviteseid3_ub_2017[kviteseid3_ub_2017$Plot=='NH',]
kviteseid3_ub_nv    <- kviteseid3_ub_2017[kviteseid3_ub_2017$Plot=='NV',]
kviteseid3_ub_ov    <- kviteseid3_ub_2017[kviteseid3_ub_2017$Plot=='ØV',]
kviteseid3_ub_med   <- median(c(median(kviteseid3_ub_oh$height_m), median(kviteseid3_ub_nh$height_m), median(kviteseid3_ub_nv$height_m), median(kviteseid3_ub_ov$height_m)))

####Fyresdal####
furesdal_2017    <- dat4[dat4$LocalityName=='Furesdal'& dat4$year=='2017',]

furesdal_b_2017  <- furesdal_2017[furesdal_2017$Treatment=='B',]
furesdal_b_oh    <- furesdal_b_2017[furesdal_b_2017$Plot=='ØH',]
furesdal_b_nh    <- furesdal_b_2017[furesdal_b_2017$Plot=='NH',]
furesdal_b_nv    <- furesdal_b_2017[furesdal_b_2017$Plot=='NV',]
furesdal_b_ov    <- furesdal_b_2017[furesdal_b_2017$Plot=='ØV',]
furesdal_b_med   <- median(c(median(furesdal_b_oh$height_m), median(furesdal_b_nh$height_m), median(furesdal_b_nv$height_m), median(furesdal_b_ov$height_m)))

furesdal_ub_2017 <- furesdal_2017[furesdal_2017$Treatment=='UB',]
furesdal_ub_oh    <- furesdal_ub_2017[furesdal_ub_2017$Plot=='ØH',]
furesdal_ub_nh    <- furesdal_ub_2017[furesdal_ub_2017$Plot=='NH',]
furesdal_ub_nv    <- furesdal_ub_2017[furesdal_ub_2017$Plot=='NV',]
furesdal_ub_ov    <- furesdal_ub_2017[furesdal_ub_2017$Plot=='ØV',]
furesdal_ub_med   <- median(c(median(furesdal_ub_oh$height_m), median(furesdal_ub_nh$height_m), median(furesdal_ub_nv$height_m), median(furesdal_ub_ov$height_m)))


# Hedmark_Akershus --------------------------------------------------------


df2['BRB',1] <- bratsberg_b_med
df2['BRUB', 1] <- bratsberg_ub_med
df2['LAB',1] <- singsaas_b_med
df2['LAUB',1] <- singsaas_ub_med
df2['MAB',1] <- malvik_b_med
df2['MAUB',1] <- malvik_ub_med
df2['HIB',1] <- hi_tydal_b_med
df2['HIUB',1] <- hi_tydal_ub_med
df2['1SB',1] <- sub_namdalseid_b_med
df2['1SUB',1] <- sub_namdalseid_ub_med
df2['4DRB',1] <- drb4_med
df2['4DRUB',1] <- drb4_med
df2['1FRB',1] <- frb1_med
df2['1FRUB',1] <- frb1_med
df2['2FRB',1] <- frb2_med
df2['2FRUB',1] <- frb2_med
df2['1FYB',1] <- fyb_med
df2['1FYUB',1] <- fyb_med
df2['1KVB',1] <- kvb1_med
df2['1KVUB',1] <- kvb1_med
df2['3KVB',1] <- kvb3_med
df2['3KVUB',1] <- kvb3_med
df2['1CAB',1] <- cab1_med
df2['1CAUB',1] <- cab1_med
df2['2CAB',1] <- cab2_med
df2['2CAUB',1] <- cab2_med
df2['6NOB',1] <- nob6_med
df2['6NOUB',1] <- nob6_med
df2['STSKNB',1] <- stskn_med
df2['STSKNUB',1] <- stskn_med
df2['HPB',1] <- hp_med
df2['HPUB',1] <- hp_med
df2['SDB',1] <- sd_med
df2['SDUB',1] <- sd_med
df2['THB',1] <- th_med
df2['THUB',1] <- th_med




library(readr)
MyData4 <- read_csv("~/Master - Sustherb/LidarMoose/MyData4.csv")
View(MyData4)

Data_prod_field <- merge(MyData4, df2, by.x="LocalityCode", by.y="row.names")
write.csv(Data_prod_field, 'Data_prod_field.csv')
