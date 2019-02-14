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
# dat4 <- dat4[!(dat4$LocalityName=='Selbu_Sl' & dat4$year!='2015'),]
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

#Trøndelag - dataframes for each site correct year. Calculating the median for each treatment at each site
bratsberg_2017    <- dat4[dat4$LocalityName=='Bratsberg'& dat4$year=='2017',]
bratsberg_b_2017  <- bratsberg_2017[bratsberg_2017$Treatment=='B',]
bratsberg_ub_2017 <- bratsberg_2017[bratsberg_2017$Treatment=='UB',]
bratsberg_b_med   <- median(bratsberg_b_2017$height_m)
bratsberg_ub_med  <- median(bratsberg_ub_2017$height_m)

singsaas_2015     <- dat4[dat4$LocalityName=='Singsås'& dat4$year=='2015',]
singsaas_b_2015   <- singsaas_2015[singsaas_2015$Treatment=='B',]
singsaas_ub_2015  <- singsaas_2015[singsaas_2015$Treatment=='UB',]
singsaas_b_med    <- median(singsaas_b_2015$height_m)
singsaas_ub_med   <- median(singsaas_ub_2015$height_m)

#Skal jeg gjøre det på denne måten tro (se over)? Sjekke for hvert omr at det er registrert trær i alle sirklene

malvik_2015     <- dat4[dat4$LocalityName=='Selbu_Flub'& dat4$year=='2016',]
malvik_b_2015   <- malvik_2015[malvik_2015$Treatment=='B',]
malvik_ub_2015  <- malvik_2015[malvik_2015$Treatment=='UB',]
malvik_b_med    <- median(malvik_b_2015$height_m)
malvik_ub_med   <- median(malvik_ub_2015$height_m)

selbu_flub_2015     <- dat4[dat4$LocalityName=='Selbu_Flub'& dat4$year=='2015',]
selbu_flub_b_2015   <- selbu_flub_2015[selbu_flub_2015$Treatment=='B',]
selbu_flub_ub_2015  <- selbu_flub_2015[selbu_flub_2015$Treatment=='UB',]
selbu_flub_b_med    <- median(selbu_flub_b_2015$height_m)
selbu_flub_ub_med   <- median(selbu_flub_ub_2015$height_m)




klb_df <- dat4[dat4$LocalityName=='Selbu_kl',] #no observations
#klb_med <- median(klb_df$height_m)
slb_df <- dat4[dat4$LocalityName=='Selbu_Sl',]#no observations
#slb_med <- median(slb_df$height_m)
hib_df <- dat4[dat4$LocalityName=='Hi_tydal',]
hib_med <- median(hib_df$height_m)
seb_df <- dat4[dat4$LocalityName=='Sl_Tydal',]#no observations
#seb_med <- median(seb_df$height_m)
one_bbb_df <- dat4[dat4$LocalityName=='steinkjer_1BBb',] #no observations, obs. fikk ikke skrive 1bbb
#one_bbb_med <- median(one_bbb_df$height_m)
two_bbb_df <- dat4[dat4$LocalityName=='steinkjer_2BBb',] #no observations
#two_bbb_med <- median(two_bbb_df$height_m)
nsb_df <- dat4[dat4$LocalityName=='Nsb_Verdal',] #no observations
#nsb_med <- median(nsb_df$height_m)
one_vbb_df <- dat4[dat4$LocalityName=='verdal_1vb',]  #no observations
#1vbb_med <- median(1vbb_df$height_m)
two_vbb_df <- dat4[dat4$LocalityName=='verdal_2VB',]  #no observations
#1vbb_med <- median(1vbb_df$height_m)
kub_df <- dat4[dat4$LocalityName=='namdalseid_1kub',] #no observations
#kub_med <- median(kub_df$height_m)
sb_df <- dat4[dat4$LocalityName=='Sub_Namdalseid',]
sb_med <- median(sb_df$height_m)


#Telemark - calculating median for sites in dat4
drb4_df <- dat4[dat4$LocalityName=='Drangedal4',]
drb4_med <- median(drb4_df$height_m)
frb1_df <- dat4[dat4$LocalityName=='Fritsøe1',]
frb1_med <- median(frb1_df$height_m)
frb2_df <- dat4[dat4$LocalityName=='Fritsøe2',]
frb2_med <- median(frb2_df$height_m)
fyb_df <- dat4[dat4$LocalityName=='Furesdal',]
fyb_med <- median(fyb_df$height_m)
kvb1_df <- dat4[dat4$LocalityName=='Kviteseid1',]
kvb1_med <- median(kvb1_df$height_m)
kvb3_df <- dat4[dat4$LocalityName=='Kviteseid3',]
kvb3_med <- median(kvb3_df$height_m)
cab1_df <- dat4[dat4$LocalityName=='Nome_Cappelen1',]
cab1_med <- median(cab1_df$height_m)
cab2_df <- dat4[dat4$LocalityName=='Nome_Cappelen2',]
cab2_med <- median(cab2_df$height_m)
nob6_df <- dat4[dat4$LocalityName=='Notodden6',]
nob6_med <- median(nob6_df$height_m)


#Hedmark_Akershus - calculating median for sites in dat4
stskn_df <- dat4[dat4$LocalityName=='Eidskog',]
stskn_med <- median(stskn_df$height_m)
hp_df <- dat4[dat4$LocalityName=='Halvard Pramhus',]
hp_med <- median(hp_df$height_m)
sd_df <- dat4[dat4$LocalityName=='Stig Dæhlen',]
sd_med <- median(sd_df$height_m)
th_df <- dat4[dat4$LocalityName=='Truls Holm',]
th_med <- median(th_df$height_m)

df2['BRB',1] <- bratsberg_b_med
df2['BRUB', 1] <- bratsberg_ub_med
df2['LAB',1] <- lab_med
df2['LAUB',1] <- lab_med
df2['MAB',1] <- mab_med
df2['MAUB',1] <- mab_med
df2['HIB',1] <- hib_med
df2['HIUB',1] <- hib_med
df2['1SB',1] <- sb_med
df2['1SUB',1] <- sb_med
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
