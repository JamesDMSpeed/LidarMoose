#Making table + data analysis

require(lidR)
require(raster)
require(rasterVis)
require(rgeos)
require(ggplot2)
require(ggvis)
require(gridExtra)



setwd("C:/Users/Ingrid/Documents/Master - Sustherb/LidarMoose")

#First, loading canopy height rasters

# Trondelag ---------------------------------------------------------------
bratsberg_b_canopyheight        <-  raster('Trondelag/canopy_height_clipped_raster/bratsberg_b_canopyheight')
bratsberg_ub_canopyheight       <-  raster('Trondelag/canopy_height_clipped_raster/bratsberg_ub_canopyheight')
hi_tydal_b_canopyheight         <-  raster('Trondelag/canopy_height_clipped_raster/hi_tydal_b_canopyheight')
hi_tydal_ub_canopyheight        <-  raster('Trondelag/canopy_height_clipped_raster/hi_tydal_ub_canopyheight')
malvik_b_canopyheight           <-  raster('Trondelag/canopy_height_clipped_raster/malvik_b_canopyheight')
malvik_ub_canopyheight          <-  raster('Trondelag/canopy_height_clipped_raster/malvik_ub_canopyheight')
namdalseid_1kub_b_canopyheight  <-  raster('Trondelag/canopy_height_clipped_raster/namdalseid_1kub_b_canopyheight')
namdalseid_1kub_ub_canopyheight <-  raster('Trondelag/canopy_height_clipped_raster/namdalseid_1kub_ub_canopyheight')
nsb_verdal_b_canopyheight       <-  raster('Trondelag/canopy_height_clipped_raster/nsb_verdal_b_canopyheight')
nsb_verdal_ub_canopyheight      <-  raster('Trondelag/canopy_height_clipped_raster/nsb_verdal_ub_canopyheight')
selbu_flub_b_canopyheight       <-  raster('Trondelag/canopy_height_clipped_raster/selbu_flub_b_canopyheight')
selbu_flub_ub_canopyheight      <-  raster('Trondelag/canopy_height_clipped_raster/selbu_flub_ub_canopyheight')
selbu_kl_b_canopyheight         <-  raster('Trondelag/canopy_height_clipped_raster/selbu_kl_b_canopyheight')
selbu_kl_ub_canopyheight        <-  raster('Trondelag/canopy_height_clipped_raster/selbu_kl_ub_canopyheight')
selbu_sl_b_canopyheight         <-  raster('Trondelag/canopy_height_clipped_raster/selbu_sl_b_canopyheight')
selbu_sl_ub_canopyheight        <-  raster('Trondelag/canopy_height_clipped_raster/selbu_sl_ub_canopyheight')
singsaas_b_canopyheight         <-  raster('Trondelag/canopy_height_clipped_raster/singsaas_b_canopyheight')
singsaas_ub_canopyheight        <-  raster('Trondelag/canopy_height_clipped_raster/singsaas_ub_canopyheight')
sl_tydal_b_canopyheight         <-  raster('Trondelag/canopy_height_clipped_raster/sl_tydal_b_canopyheight')
sl_tydal_ub_canopyheight        <-  raster('Trondelag/canopy_height_clipped_raster/sl_tydal_ub_canopyheight')
steinkjer_1BBb_b_canopyheight   <-  raster('Trondelag/canopy_height_clipped_raster/steinkjer_1BBb_b_canopyheight')
steinkjer_1BBb_ub_canopyheight  <-  raster('Trondelag/canopy_height_clipped_raster/steinkjer_1BBb_ub_canopyheight')
steinkjer_2BBb_b_canopyheight   <-  raster('Trondelag/canopy_height_clipped_raster/steinkjer_2BBb_b_canopyheight')
steinkjer_2BBb_ub_canopyheight  <-  raster('Trondelag/canopy_height_clipped_raster/steinkjer_2BBb_ub_canopyheight')
sub_namdalseid_b_canopyheight   <-  raster('Trondelag/canopy_height_clipped_raster/sub_namdalseid_b_canopyheight')
sub_namdalseid_ub_canopyheight  <-  raster('Trondelag/canopy_height_clipped_raster/sub_namdalseid_ub_canopyheight')
verdal1_b_canopyheight          <-  raster('Trondelag/canopy_height_clipped_raster/verdal_1vb_b_canopyheight')
verdal1_ub_canopyheight         <-  raster('Trondelag/canopy_height_clipped_raster/verdal_1vb_ub_canopyheight')
verdal2_b_canopyheight          <-  raster('Trondelag/canopy_height_clipped_raster/verdal_2vb_b_canopyheight')
verdal2_ub_canopyheight         <-  raster('Trondelag/canopy_height_clipped_raster/verdal_2vb_ub_canopyheight')


# Telemark ----------------------------------------------------------------

drangedal1_b_canopyheight       <-  raster('Telemark/canopy_height_clipped_raster/drangedal1_b_canopyheight')
drangedal1_ub_canopyheight      <-  raster('Telemark/canopy_height_clipped_raster/drangedal1_ub_canopyheight')
drangedal3_b_canopyheight       <-  raster('Telemark/canopy_height_clipped_raster/drangedal3_b_canopyheight')
drangedal3_ub_canopyheight      <-  raster('Telemark/canopy_height_clipped_raster/drangedal3_ub_canopyheight')
drangedal4_b_canopyheight       <-  raster('Telemark/canopy_height_clipped_raster/drangedal4_b_canopyheight')
drangedal4_ub_canopyheight      <-  raster('Telemark/canopy_height_clipped_raster/drangedal4_ub_canopyheight')
fritsoe1_b_canopyheight         <-  raster('Telemark/canopy_height_clipped_raster/fritsoe1_b_canopyheight')
fritsoe1_ub_canopyheight        <-  raster('Telemark/canopy_height_clipped_raster/fritsoe1_ub_canopyheight')
fritsoe2_b_canopyheight         <-  raster('Telemark/canopy_height_clipped_raster/fritsoe2_b_canopyheight')
fritsoe2_ub_canopyheight        <-  raster('Telemark/canopy_height_clipped_raster/fritsoe2_ub_canopyheight')
fyresdal_b_canopyheight         <-  raster('Telemark/canopy_height_clipped_raster/fyresdal_b_canopyheight')
fyresdal_ub_canopyheight        <-  raster('Telemark/canopy_height_clipped_raster/fyresdal_ub_canopyheight')
kviteseid1_b_canopyheight       <-  raster('Telemark/canopy_height_clipped_raster/kviteseid1_b_canopyheight')
kviteseid1_ub_canopyheight      <-  raster('Telemark/canopy_height_clipped_raster/kviteseid1_ub_canopyheight')
kviteseid2_b_canopyheight       <-  raster('Telemark/canopy_height_clipped_raster/kviteseid2_b_canopyheight')
kviteseid2_ub_canopyheight      <-  raster('Telemark/canopy_height_clipped_raster/kviteseid2_ub_canopyheight')
kviteseid3_b_canopyheight       <-  raster('Telemark/canopy_height_clipped_raster/kviteseid3_b_canopyheight')
kviteseid3_ub_canopyheight      <-  raster('Telemark/canopy_height_clipped_raster/kviteseid3_ub_canopyheight')
n_cappelen1_b_canopyheight      <-  raster('Telemark/canopy_height_clipped_raster/n_cappelen1_b_canopyheight')
n_cappelen1_ub_canopyheight     <-  raster('Telemark/canopy_height_clipped_raster/n_cappelen1_ub_canopyheight')
n_cappelen2_b_canopyheight      <-  raster('Telemark/canopy_height_clipped_raster/n_cappelen2_b_canopyheight')
n_cappelen2_ub_canopyheight     <-  raster('Telemark/canopy_height_clipped_raster/n_cappelen2_ub_canopyheight')
notodden3_b_canopyheight        <-  raster('Telemark/canopy_height_clipped_raster/notodden3_b_canopyheight')
notodden3_ub_canopyheight       <-  raster('Telemark/canopy_height_clipped_raster/notodden3_ub_canopyheight')
notodden5_b_canopyheight        <-  raster('Telemark/canopy_height_clipped_raster/notodden5_b_canopyheight')
notodden5_ub_canopyheight       <-  raster('Telemark/canopy_height_clipped_raster/notodden5_ub_canopyheight')
notodden6_b_canopyheight        <-  raster('Telemark/canopy_height_clipped_raster/notodden6_b_canopyheight')
notodden6_ub_canopyheight       <-  raster('Telemark/canopy_height_clipped_raster/notodden6_ub_canopyheight')


# Hedmark_Akershus --------------------------------------------------------
didrik_holmsen_b_canopyheight      <-  raster('Hedmark_Akershus/canopy_height_clipped_raster/didrik_holmsen_b_canopyheight')
didrik_holmsen_ub_canopyheight     <-  raster('Hedmark_Akershus/canopy_height_clipped_raster/didrik_holmsen_ub_canopyheight')
eidskog_b_canopyheight             <-  raster('Hedmark_Akershus/canopy_height_clipped_raster/eidskog_b_canopyheight')
eidskog_ub_canopyheight            <-  raster('Hedmark_Akershus/canopy_height_clipped_raster/eidskog_ub_canopyheight')
fet3_b_canopyheight                <-  raster('Hedmark_Akershus/canopy_height_clipped_raster/fet3_b_canopyheight')
fet3_ub_canopyheight               <-  raster('Hedmark_Akershus/canopy_height_clipped_raster/fet3_ub_canopyheight')
h_pramhus_b_canopyheight           <-  raster('Hedmark_Akershus/canopy_height_clipped_raster/h_pramhus_b_canopyheight')
h_pramhus_ub_canopyheight          <-  raster('Hedmark_Akershus/canopy_height_clipped_raster/h_pramhus_ub_canopyheight')
stangesk_aurskog_b_canopyheight    <-  raster('Hedmark_Akershus/canopy_height_clipped_raster/stangesk_aurskog_b_canopyheight')
stangesk_aurskog_ub_canopyheight   <-  raster('Hedmark_Akershus/canopy_height_clipped_raster/stangesk_aurskog_ub_canopyheight')
stangesk_eidskog_b_canopyheight    <-  raster('Hedmark_Akershus/canopy_height_clipped_raster/stangesk_eidskog_b_canopyheight')
stangesk_eidskog_ub_canopyheight   <-  raster('Hedmark_Akershus/canopy_height_clipped_raster/stangesk_eidskog_ub_canopyheight')
stig_dahlen_b_canopyheight         <-  raster('Hedmark_Akershus/canopy_height_clipped_raster/stig_dahlen_b_canopyheight')
stig_dahlen_ub_canopyheight        <-  raster('Hedmark_Akershus/canopy_height_clipped_raster/stig_dahlen_ub_canopyheight')
truls_holm_b_canopyheight          <-  raster('Hedmark_Akershus/canopy_height_clipped_raster/truls_holm_b_canopyheight')
truls_holm_ub_canopyheight         <-  raster('Hedmark_Akershus/canopy_height_clipped_raster/truls_holm_ub_canopyheight')




# Making table ------------------------------------------------------------



#Make a table for some summary values
df1<-data.frame(matrix(nrow=74,ncol=7))
rownames(df1)<-c('BRB','BRUB','HIB','HIUB' ,'MAB','MAUB', '1KB','1KUB','1NSB','1NSUB','FLB','FLUB','KLB','KLUB','SLB','SLUB', 'LAB','LAUB','SEB','SEUB','1BBB','1BBUB','2BBB','2BBUB','1SB','1SUB','1VBB','1VBUB','2VBB','2VBUB','1DRB','1DRUB','3DRB','3DRUB','4DRB','4DRUB','1FRB','1FRUB','2FRB','2FRUB','1FYB','1FYUB','1KVB','1KVUB','2KVB','2KVUB','3KVB','3KVUB','1CAB','1CAUB','2CAB','2CAUB','3NOB','3NOUB','5NOB','5NOUB','6NOB','6NOUB','DHB','DHUB','STSKNB','STSKNUB','FKB','FKUB','HPB','HPUB','SSAB','SSAUB','SSBB','SSBUB','SDB','SDUB','THB','THUB')
colnames(df1)<-c('Mean','Median','SD','Min','Max', '1st Qu.', '3rd Qu.')  

MySummary <- function(i) c(mn = mean(getValues(i), na.rm=T), md = median(getValues(i), na.rm=T), sd= cellStats(i, stat='sd', na.rm=T), min= min(getValues(i), na.rm=T),max= max(getValues(i), na.rm=T), first_qu= quantile(i, 0.25, na.rm=T), third_qu= quantile(i, 0.75, na.rm=T)  )
MySummary(bratsberg_b_canopyheight)

df1['BRB', 1:7] <- MySummary(bratsberg_b_canopyheight)
df1['BRUB', 1:7] <- MySummary(bratsberg_ub_canopyheight)
df1['HIB', 1:7] <- MySummary(hi_tydal_b_canopyheight)
df1['HIUB', 1:7] <- MySummary(hi_tydal_ub_canopyheight)
df1['MAB', 1:7] <- MySummary(malvik_b_canopyheight)
df1['MAUB', 1:7] <- MySummary(malvik_ub_canopyheight)
df1['1KB', 1:7] <- MySummary(namdalseid_1kub_b_canopyheight)
df1['1KUB', 1:7] <- MySummary(namdalseid_1kub_ub_canopyheight)
df1['1NSB', 1:7] <- MySummary(nsb_verdal_b_canopyheight)
df1['1NSUB', 1:7] <- MySummary(nsb_verdal_ub_canopyheight)
df1['FLB', 1:7] <- MySummary(selbu_flub_b_canopyheight)
df1['FLUB', 1:7] <- MySummary(selbu_flub_ub_canopyheight)
df1['KLB', 1:7] <- MySummary(selbu_kl_b_canopyheight)
df1['KLUB', 1:7] <- MySummary(selbu_kl_ub_canopyheight)
df1['SLB', 1:7] <- MySummary(selbu_sl_b_canopyheight)
df1['SLUB', 1:7] <- MySummary(selbu_sl_ub_canopyheight)
df1['LAB', 1:7] <- MySummary(singsaas_b_canopyheight)
df1['LAUB', 1:7] <- MySummary(singsaas_ub_canopyheight)
df1['SEB', 1:7] <- MySummary(sl_tydal_b_canopyheight)
df1['SEUB', 1:7] <- MySummary(sl_tydal_ub_canopyheight)
df1['1BBB', 1:7] <- MySummary(steinkjer_1BBb_b_canopyheight)
df1['1BBUB', 1:7] <- MySummary(steinkjer_1BBb_ub_canopyheight)
df1['2BBB', 1:7] <- MySummary(steinkjer_2BBb_b_canopyheight)
df1['2BBUB', 1:7] <- MySummary(steinkjer_2BBb_ub_canopyheight)
df1['1SB', 1:7] <- MySummary(sub_namdalseid_b_canopyheight)
df1['1SUB', 1:7] <- MySummary(sub_namdalseid_ub_canopyheight)
df1['1VBB', 1:7] <- MySummary(verdal1_b_canopyheight)
df1['1VBUB', 1:7] <- MySummary(verdal1_ub_canopyheight)
df1['2VBB', 1:7] <- MySummary(verdal2_b_canopyheight)
df1['2VBUB', 1:7] <- MySummary(verdal2_ub_canopyheight)

df1['1DRB', 1:7] <- MySummary(drangedal1_b_canopyheight)
df1['1DRUB', 1:7] <- MySummary(drangedal1_ub_canopyheight)
df1['3DRB', 1:7] <- MySummary(drangedal3_b_canopyheight)
df1['3DRUB', 1:7] <- MySummary(drangedal3_ub_canopyheight)
df1['4DRB', 1:7] <- MySummary(drangedal4_b_canopyheight)
df1['4DRUB', 1:7] <- MySummary(drangedal4_ub_canopyheight)
df1['1FRB', 1:7] <- MySummary(fritsoe1_b_canopyheight)
df1['1FRUB', 1:7] <- MySummary(fritsoe1_ub_canopyheight)
df1['2FRB', 1:7] <- MySummary(fritsoe2_b_canopyheight)
df1['2FRUB', 1:7] <- MySummary(fritsoe2_ub_canopyheight)
df1['1FYB', 1:7] <- MySummary(fyresdal_b_canopyheight)
df1['1FYUB', 1:7] <- MySummary(fyresdal_ub_canopyheight)
df1['1KVB', 1:7] <- MySummary(kviteseid1_b_canopyheight)
df1['1KVUB', 1:7] <- MySummary(kviteseid1_ub_canopyheight)
df1['2KVB', 1:7] <- MySummary(kviteseid2_b_canopyheight)
df1['2KVUB', 1:7] <- MySummary(kviteseid2_ub_canopyheight)
df1['3KVB', 1:7] <- MySummary(kviteseid3_b_canopyheight)
df1['3KVUB', 1:7] <- MySummary(kviteseid3_ub_canopyheight)
df1['1CAB', 1:7] <- MySummary(n_cappelen1_b_canopyheight)
df1['1CAUB', 1:7] <- MySummary(n_cappelen1_ub_canopyheight)
df1['2CAB', 1:7] <- MySummary(n_cappelen2_b_canopyheight)
df1['2CAUB', 1:7] <- MySummary(n_cappelen2_ub_canopyheight)
df1['3NOB', 1:7] <- MySummary(notodden3_b_canopyheight)
df1['3NOUB', 1:7] <- MySummary(notodden3_ub_canopyheight)
df1['5NOB', 1:7] <- MySummary(notodden5_b_canopyheight)
df1['5NOUB', 1:7] <- MySummary(notodden5_ub_canopyheight)
df1['6NOB', 1:7] <- MySummary(notodden6_b_canopyheight)
df1['6NOUB', 1:7] <- MySummary(notodden6_ub_canopyheight)

df1['DHB', 1:7] <- MySummary(didrik_holmsen_b_canopyheight)
df1['DHUB', 1:7] <- MySummary(didrik_holmsen_ub_canopyheight)
df1['STSKNB', 1:7] <- MySummary(eidskog_b_canopyheight)
df1['STSKNUB', 1:7] <- MySummary(eidskog_ub_canopyheight)
df1['FKB', 1:7] <- MySummary(fet3_b_canopyheight)
df1['FKUB', 1:7] <- MySummary(fet3_ub_canopyheight)
df1['HPB', 1:7] <- MySummary(h_pramhus_b_canopyheight)
df1['HPUB', 1:7] <- MySummary(h_pramhus_ub_canopyheight)
df1['SSAB', 1:7] <- MySummary(stangesk_aurskog_b_canopyheight)
df1['SSAUB', 1:7] <- MySummary(stangesk_aurskog_ub_canopyheight)
df1['SSBB', 1:7] <- MySummary(stangesk_eidskog_b_canopyheight)
df1['SSBUB', 1:7] <- MySummary(stangesk_eidskog_ub_canopyheight)
df1['SDB', 1:7] <- MySummary(stig_dahlen_b_canopyheight)
df1['SDUB', 1:7] <- MySummary(stig_dahlen_ub_canopyheight)
df1['THB', 1:7] <- MySummary(truls_holm_b_canopyheight)
df1['THUB', 1:7] <- MySummary(truls_holm_ub_canopyheight)

df1

write.csv(df1, 'Result table.csv')
Results = read.csv('Result table.csv')
View(Results)

#Import site info metadata
library(readr)
SustHerb_Sites_Info <- read_delim("~/Master - Sustherb/SustHerb Sites Info.csv", ";", escape_double = FALSE, trim_ws = TRUE)
View(SustHerb_Sites_Info)

#Merge the two tables, the one with the results from the canopy height model and the one with the meta data
MyData = merge(SustHerb_Sites_Info, Results, by.x = "LocalityCode", by.y="X" )
View(MyData)

#IQR -inter quartile range
MyData$IQR<-MyData$X3rd.Qu.-MyData$X1st.Qu.

#Time since CC'
MyData$ClearCutToLidar<-MyData$'LiDAR data from year'-MyData$'Clear cut' 

#CV - coefficient of variation
MyData$CV <- MyData$SD/MyData$Mean


#Standardized IQR
MyData$IQR_med <-  MyData$IQR/MyData$Median


write.csv(MyData, 'MyData.csv')

#Import MyData
library(readr)
MyData <- read_csv("~/Master - Sustherb/LidarMoose/MyData.csv")
View(MyData)



# Lager MAD tabell og ny MyData2 med MAD og MAD/median --------------------

#Trøndalag
bratsberg_b_val<-getValues(bratsberg_b_canopyheight)
bratsberg_ub_val<-getValues(bratsberg_ub_canopyheight)
singsaas_b_val <- getValues(singsaas_b_canopyheight)
singsaas_ub_val <- getValues(singsaas_ub_canopyheight)
malvik_b_val <- getValues(malvik_b_canopyheight)
malvik_ub_val <- getValues(malvik_ub_canopyheight)
selbu_flub_b_val <- getValues(selbu_flub_b_canopyheight)
selbu_flub_ub_val <- getValues(selbu_flub_ub_canopyheight)
selbu_kl_b_val <- getValues(selbu_kl_b_canopyheight)
selbu_kl_ub_val <- getValues(selbu_kl_ub_canopyheight)
selbu_sl_b_val <- getValues(selbu_sl_b_canopyheight)
selbu_sl_ub_val <- getValues(selbu_sl_ub_canopyheight)
hi_tydal_b_val<-getValues(hi_tydal_b_canopyheight)
hi_tydal_ub_val<-getValues(hi_tydal_ub_canopyheight)
sl_tydal_b_val<-getValues(sl_tydal_b_canopyheight)
sl_tydal_ub_val<-getValues(sl_tydal_ub_canopyheight)
steinkjer_1BBb_b_val<-getValues(steinkjer_1BBb_b_canopyheight)
steinkjer_1BBb_ub_val<-getValues(steinkjer_1BBb_ub_canopyheight)
steinkjer_2BBb_b_val<-getValues(steinkjer_2BBb_b_canopyheight)
steinkjer_2BBb_ub_val<-getValues(steinkjer_2BBb_ub_canopyheight)
nsb_verdal_b_val<-getValues(nsb_verdal_b_canopyheight)
nsb_verdal_ub_val<-getValues(nsb_verdal_ub_canopyheight)
verdal1_b_val<-getValues(verdal1_b_canopyheight)
verdal1_ub_val<-getValues(verdal1_ub_canopyheight)
verdal2_b_val<-getValues(verdal2_b_canopyheight)
verdal2_ub_val<-getValues(verdal2_ub_canopyheight)
namdalseid_1kub_b_val <- getValues(namdalseid_1kub_b_canopyheight)
namdalseid_1kub_ub_val <- getValues(namdalseid_1kub_ub_canopyheight)
sub_namdalseid_b_val <- getValues(sub_namdalseid_b_canopyheight)
sub_namdalseid_ub_val <- getValues(sub_namdalseid_ub_canopyheight)

#Telemark
fritsoe1_b_val<-getValues(fritsoe1_b_canopyheight)
fritsoe1_ub_val<-getValues(fritsoe1_ub_canopyheight)
fritsoe2_b_val<-getValues(fritsoe2_b_canopyheight)
fritsoe2_ub_val<-getValues(fritsoe2_ub_canopyheight)
n_cappelen1_b_val<-getValues(n_cappelen1_b_canopyheight)
n_cappelen1_ub_val<-getValues(n_cappelen1_ub_canopyheight)
n_cappelen2_b_val<-getValues(n_cappelen2_b_canopyheight)
n_cappelen2_ub_val<-getValues(n_cappelen2_ub_canopyheight)
notodden3_b_val<-getValues(notodden3_b_canopyheight)
notodden3_ub_val<-getValues(notodden3_ub_canopyheight)
notodden5_b_val<-getValues(notodden5_b_canopyheight)
notodden5_ub_val<-getValues(notodden5_ub_canopyheight)
notodden6_b_val<-getValues(notodden6_b_canopyheight)
notodden6_ub_val<-getValues(notodden6_ub_canopyheight)
drangedal1_b_val<-getValues(drangedal1_b_canopyheight)
drangedal1_ub_val<-getValues(drangedal1_ub_canopyheight)
drangedal3_b_val<-getValues(drangedal3_b_canopyheight)
drangedal3_ub_val<-getValues(drangedal3_ub_canopyheight)
drangedal4_b_val<-getValues(drangedal4_b_canopyheight)
drangedal4_ub_val<-getValues(drangedal4_ub_canopyheight)
kviteseid1_b_val<-getValues(kviteseid1_b_canopyheight)
kviteseid1_ub_val<-getValues(kviteseid1_ub_canopyheight)
kviteseid2_b_val<-getValues(kviteseid2_b_canopyheight)
kviteseid2_ub_val<-getValues(kviteseid2_ub_canopyheight)
kviteseid3_b_val<-getValues(kviteseid3_b_canopyheight)
kviteseid3_ub_val<-getValues(kviteseid3_ub_canopyheight)
fyresdal_b_val<-getValues(fyresdal_b_canopyheight)
fyresdal_ub_val<-getValues(fyresdal_ub_canopyheight)

#Hedmark
didrik_holmsen_b_val<-getValues(didrik_holmsen_b_canopyheight)
didrik_holmsen_ub_val<-getValues(didrik_holmsen_ub_canopyheight)
stangesk_aurskog_b_val<-getValues(stangesk_aurskog_b_canopyheight)
stangesk_aurskog_ub_val<-getValues(stangesk_aurskog_ub_canopyheight)
stig_dahlen_b_val<-getValues(stig_dahlen_b_canopyheight)
stig_dahlen_ub_val<-getValues(stig_dahlen_ub_canopyheight)
truls_holm_b_val<-getValues(truls_holm_b_canopyheight)
truls_holm_ub_val<-getValues(truls_holm_ub_canopyheight)
fet3_b_val<-getValues(fet3_b_canopyheight)
fet3_ub_val<-getValues(fet3_ub_canopyheight)
eidskog_b_val<-getValues(eidskog_b_canopyheight)
eidskog_ub_val<-getValues(eidskog_ub_canopyheight)
h_pramhus_b_val<-getValues(h_pramhus_b_canopyheight)
h_pramhus_ub_val<-getValues(h_pramhus_ub_canopyheight)
stangesk_eidskog_b_val<-getValues(stangesk_eidskog_b_canopyheight)
stangesk_eidskog_ub_val<-getValues(stangesk_eidskog_ub_canopyheight)


df2<-data.frame(matrix(nrow=74,ncol=1))
rownames(df2)<-c('BRB','BRUB','HIB','HIUB' ,'MAB','MAUB', '1KB','1KUB','1NSB','1NSUB','FLB','FLUB','KLB','KLUB','SLB','SLUB', 'LAB','LAUB','SEB','SEUB','1BBB','1BBUB','2BBB','2BBUB','1SB','1SUB','1VBB','1VBUB','2VBB','2VBUB','1DRB','1DRUB','3DRB','3DRUB','4DRB','4DRUB','1FRB','1FRUB','2FRB','2FRUB','1FYB','1FYUB','1KVB','1KVUB','2KVB','2KVUB','3KVB','3KVUB','1CAB','1CAUB','2CAB','2CAUB','3NOB','3NOUB','5NOB','5NOUB','6NOB','6NOUB','DHB','DHUB','STSKNB','STSKNUB','FKB','FKUB','HPB','HPUB','SSAB','SSAUB','SSBB','SSBUB','SDB','SDUB','THB','THUB')
colnames(df2)<-c('MAD')  

df2['BRB', 1] <- mad(bratsberg_b_val, na.rm = T)
df2['BRUB', 1] <- mad(bratsberg_ub_val, na.rm = T)
df2['HIB', 1] <- mad(hi_tydal_b_val, na.rm = T)
df2['HIUB', 1] <- mad(hi_tydal_ub_val, na.rm = T)
df2['MAB', 1] <- mad(malvik_b_val, na.rm = T)
df2['MAUB', 1] <- mad(malvik_ub_val, na.rm = T)
df2['1KB', 1] <- mad(namdalseid_1kub_b_val, na.rm = T)
df2['1KUB', 1] <- mad(namdalseid_1kub_ub_val, na.rm = T)
df2['1NSB', 1] <- mad(nsb_verdal_b_val, na.rm = T)
df2['1NSUB', 1] <- mad(nsb_verdal_ub_val, na.rm = T)
df2['FLB', 1] <- mad(selbu_flub_b_val, na.rm = T)
df2['FLUB', 1] <- mad(selbu_flub_ub_val, na.rm = T)
df2['KLB', 1] <-mad(selbu_kl_b_val, na.rm = T)
df2['KLUB', 1] <- mad(selbu_kl_ub_val, na.rm = T)
df2['SLB', 1] <- mad(selbu_sl_b_val, na.rm = T)
df2['SLUB', 1] <- mad(selbu_sl_ub_val, na.rm = T)
df2['LAB', 1] <- mad(singsaas_b_val, na.rm = T)
df2['LAUB', 1] <- mad(singsaas_ub_val, na.rm = T)
df2['SEB', 1] <- mad(sl_tydal_b_val, na.rm = T)
df2['SEUB', 1] <- mad(sl_tydal_ub_val, na.rm = T)
df2['1BBB', 1] <- mad(steinkjer_1BBb_b_val, na.rm = T)
df2['1BBUB', 1] <- mad(steinkjer_1BBb_ub_val, na.rm = T)
df2['2BBB', 1] <- mad(steinkjer_2BBb_b_val, na.rm = T)
df2['2BBUB', 1] <- mad(steinkjer_2BBb_ub_val, na.rm = T)
df2['1SB', 1] <- mad(sub_namdalseid_b_val, na.rm = T)
df2['1SUB', 1] <- mad(sub_namdalseid_ub_val, na.rm = T)
df2['1VBB', 1] <- mad(verdal1_b_val, na.rm = T)
df2['1VBUB', 1] <- mad(verdal1_ub_val, na.rm = T)
df2['2VBB', 1] <- mad(verdal2_b_val, na.rm = T)
df2['2VBUB', 1] <- mad(verdal2_ub_val, na.rm = T)

df2['1DRB', 1] <- mad(drangedal1_b_val, na.rm = T)
df2['1DRUB', 1] <- mad(drangedal1_ub_val, na.rm = T)
df2['3DRB', 1] <- mad(drangedal3_b_val, na.rm = T)
df2['3DRUB', 1] <-mad(drangedal3_ub_val, na.rm = T)
df2['4DRB', 1] <- mad(drangedal4_b_val, na.rm = T)
df2['4DRUB', 1] <-mad(drangedal4_ub_val, na.rm = T)
df2['1FRB', 1] <- mad(fritsoe1_b_val, na.rm = T)
df2['1FRUB', 1] <- mad(fritsoe1_ub_val, na.rm = T)
df2['2FRB', 1] <- mad(fritsoe2_b_val, na.rm = T)
df2['2FRUB', 1] <- mad(fritsoe2_ub_val, na.rm = T)
df2['1FYB', 1] <-  mad(fyresdal_b_val, na.rm = T)
df2['1FYUB', 1] <- mad(fyresdal_ub_val, na.rm = T)
df2['1KVB', 1] <- mad(kviteseid1_b_val, na.rm = T)
df2['1KVUB', 1] <- mad(kviteseid1_ub_val, na.rm = T)
df2['2KVB', 1] <- mad(kviteseid2_b_val, na.rm = T)
df2['2KVUB', 1] <- mad(kviteseid2_ub_val, na.rm = T)
df2['3KVB', 1] <- mad(kviteseid3_b_val, na.rm = T)
df2['3KVUB', 1] <- mad(kviteseid3_ub_val, na.rm = T)
df2['1CAB', 1] <- mad(n_cappelen1_b_val, na.rm = T)
df2['1CAUB', 1] <- mad(n_cappelen1_ub_val, na.rm = T)
df2['2CAB', 1] <- mad(n_cappelen2_b_val, na.rm = T)
df2['2CAUB', 1] <- mad(n_cappelen2_ub_val, na.rm = T)
df2['3NOB', 1] <- mad(notodden3_b_val, na.rm = T)
df2['3NOUB', 1] <- mad(notodden3_ub_val, na.rm = T)
df2['5NOB', 1] <- mad(notodden5_b_val, na.rm = T)
df2['5NOUB', 1] <- mad(notodden5_ub_val, na.rm = T)
df2['6NOB', 1] <- mad(notodden6_b_val, na.rm = T)
df2['6NOUB', 1] <- mad(notodden6_ub_val, na.rm = T)

df2['DHB', 1] <- mad(didrik_holmsen_b_val, na.rm = T)
df2['DHUB', 1] <- mad(didrik_holmsen_ub_val, na.rm = T)
df2['STSKNB', 1] <- mad(eidskog_b_val, na.rm = T)
df2['STSKNUB', 1] <- mad(eidskog_ub_val, na.rm = T)
df2['FKB', 1] <- mad(fet3_b_val, na.rm = T)
df2['FKUB', 1] <- mad(fet3_ub_val, na.rm = T)
df2['HPB', 1] <- mad(h_pramhus_b_val, na.rm = T)
df2['HPUB', 1] <- mad(h_pramhus_ub_val, na.rm = T)
df2['SSAB', 1] <- mad(stangesk_aurskog_b_val, na.rm = T)
df2['SSAUB', 1] <-  mad(stangesk_aurskog_ub_val, na.rm = T)
df2['SSBB', 1] <-  mad(stangesk_eidskog_b_val, na.rm = T)
df2['SSBUB', 1] <- mad(stangesk_eidskog_ub_val, na.rm = T)
df2['SDB', 1] <-mad(stig_dahlen_b_val, na.rm = T)
df2['SDUB', 1] <- mad(stig_dahlen_ub_val, na.rm = T)
df2['THB', 1] <- mad(truls_holm_b_val, na.rm = T)
df2['THUB', 1] <- mad(truls_holm_ub_val, na.rm = T)


write.csv(df2, 'MADtable.csv')
MADtable = read.csv('MADtable.csv')
View(MADtable)

#Merge MyData and MAD-tabell
MyData2 = merge(MyData, MADtable, by.x = "LocalityCode", by.y="X" )
View(MyData2)

#Standardize MAD with median
MyData2$MAD_med <- MyData2$MAD/MyData2$Median

write.csv(MyData2, 'MyData2.csv')
write.xlsx(MyData2, 'MyData2.xlsx')

#Making MyData3 - changeing Treatment names from B, UB to exclosure, open plot
MyData3 <- data.frame(MyData2)
MyData3$Treatment <- ifelse(MyData3$Treatment=="B", "Open plot", "Exclosure")
write.csv(MyData3, 'MyData3.csv')


# Make violin plots -------------------------------------------------------
#First: get values
#Trøndalag
bratsberg_b_val<-getValues(bratsberg_b_canopyheight)
bratsberg_ub_val<-getValues(bratsberg_ub_canopyheight)
singsaas_b_val <- getValues(singsaas_b_canopyheight)
singsaas_ub_val <- getValues(singsaas_ub_canopyheight)
malvik_b_val <- getValues(malvik_b_canopyheight)
malvik_ub_val <- getValues(malvik_ub_canopyheight)
selbu_flub_b_val <- getValues(selbu_flub_b_canopyheight)
selbu_flub_ub_val <- getValues(selbu_flub_ub_canopyheight)
selbu_kl_b_val <- getValues(selbu_kl_b_canopyheight)
selbu_kl_ub_val <- getValues(selbu_kl_ub_canopyheight)
selbu_sl_b_val <- getValues(selbu_sl_b_canopyheight)
selbu_sl_ub_val <- getValues(selbu_sl_ub_canopyheight)
hi_tydal_b_val<-getValues(hi_tydal_b_canopyheight)
hi_tydal_ub_val<-getValues(hi_tydal_ub_canopyheight)
sl_tydal_b_val<-getValues(sl_tydal_b_canopyheight)
sl_tydal_ub_val<-getValues(sl_tydal_ub_canopyheight)
steinkjer_1BBb_b_val<-getValues(steinkjer_1BBb_b_canopyheight)
steinkjer_1BBb_ub_val<-getValues(steinkjer_1BBb_ub_canopyheight)
steinkjer_2BBb_b_val<-getValues(steinkjer_2BBb_b_canopyheight)
steinkjer_2BBb_ub_val<-getValues(steinkjer_2BBb_ub_canopyheight)
nsb_verdal_b_val<-getValues(nsb_verdal_b_canopyheight)
nsb_verdal_ub_val<-getValues(nsb_verdal_ub_canopyheight)
verdal1_b_val<-getValues(verdal1_b_canopyheight)
verdal1_ub_val<-getValues(verdal1_ub_canopyheight)
verdal2_b_val<-getValues(verdal2_b_canopyheight)
verdal2_ub_val<-getValues(verdal2_ub_canopyheight)
namdalseid_1kub_b_val <- getValues(namdalseid_1kub_b_canopyheight)
namdalseid_1kub_ub_val <- getValues(namdalseid_1kub_ub_canopyheight)
sub_namdalseid_b_val <- getValues(sub_namdalseid_b_canopyheight)
sub_namdalseid_ub_val <- getValues(sub_namdalseid_ub_canopyheight)

#Telemark
fritsoe1_b_val<-getValues(fritsoe1_b_canopyheight)
fritsoe1_ub_val<-getValues(fritsoe1_ub_canopyheight)
fritsoe2_b_val<-getValues(fritsoe2_b_canopyheight)
fritsoe2_ub_val<-getValues(fritsoe2_ub_canopyheight)
n_cappelen1_b_val<-getValues(n_cappelen1_b_canopyheight)
n_cappelen1_ub_val<-getValues(n_cappelen1_ub_canopyheight)
n_cappelen2_b_val<-getValues(n_cappelen2_b_canopyheight)
n_cappelen2_ub_val<-getValues(n_cappelen2_ub_canopyheight)
notodden3_b_val<-getValues(notodden3_b_canopyheight)
notodden3_ub_val<-getValues(notodden3_ub_canopyheight)
notodden5_b_val<-getValues(notodden5_b_canopyheight)
notodden5_ub_val<-getValues(notodden5_ub_canopyheight)
notodden6_b_val<-getValues(notodden6_b_canopyheight)
notodden6_ub_val<-getValues(notodden6_ub_canopyheight)
drangedal1_b_val<-getValues(drangedal1_b_canopyheight)
drangedal1_ub_val<-getValues(drangedal1_ub_canopyheight)
drangedal3_b_val<-getValues(drangedal3_b_canopyheight)
drangedal3_ub_val<-getValues(drangedal3_ub_canopyheight)
drangedal4_b_val<-getValues(drangedal4_b_canopyheight)
drangedal4_ub_val<-getValues(drangedal4_ub_canopyheight)
kviteseid1_b_val<-getValues(kviteseid1_b_canopyheight)
kviteseid1_ub_val<-getValues(kviteseid1_ub_canopyheight)
kviteseid2_b_val<-getValues(kviteseid2_b_canopyheight)
kviteseid2_ub_val<-getValues(kviteseid2_ub_canopyheight)
kviteseid3_b_val<-getValues(kviteseid3_b_canopyheight)
kviteseid3_ub_val<-getValues(kviteseid3_ub_canopyheight)
fyresdal_b_val<-getValues(fyresdal_b_canopyheight)
fyresdal_ub_val<-getValues(fyresdal_ub_canopyheight)

#Hedmark
didrik_holmsen_b_val<-getValues(didrik_holmsen_b_canopyheight)
didrik_holmsen_ub_val<-getValues(didrik_holmsen_ub_canopyheight)
stangesk_aurskog_b_val<-getValues(stangesk_aurskog_b_canopyheight)
stangesk_aurskog_ub_val<-getValues(stangesk_aurskog_ub_canopyheight)
stig_dahlen_b_val<-getValues(stig_dahlen_b_canopyheight)
stig_dahlen_ub_val<-getValues(stig_dahlen_ub_canopyheight)
truls_holm_b_val<-getValues(truls_holm_b_canopyheight)
truls_holm_ub_val<-getValues(truls_holm_ub_canopyheight)
fet3_b_val<-getValues(fet3_b_canopyheight)
fet3_ub_val<-getValues(fet3_ub_canopyheight)
eidskog_b_val<-getValues(eidskog_b_canopyheight)
eidskog_ub_val<-getValues(eidskog_ub_canopyheight)
h_pramhus_b_val<-getValues(h_pramhus_b_canopyheight)
h_pramhus_ub_val<-getValues(h_pramhus_ub_canopyheight)
stangesk_eidskog_b_val<-getValues(stangesk_eidskog_b_canopyheight)
stangesk_eidskog_ub_val<-getValues(stangesk_eidskog_ub_canopyheight)

require(vioplot)
#Trondelag
par(mfrow=c(6,3))
par(mar=c(1,4,3,1))
vioplot(bratsberg_b_val[!is.na(bratsberg_b_val)],bratsberg_ub_val[!is.na(bratsberg_ub_val)],names=c('Open plot','Exclosure'), col='dodgerblue3')
title(main='Bratsberg', ylab = 'Canopy Height', cex.lab=1)
vioplot(singsaas_b_val[!is.na(singsaas_b_val)],singsaas_ub_val[!is.na(singsaas_ub_val)],names=c('Open plot','Exclosure'), col='dodgerblue3')
title(main='Singsaas')
vioplot(malvik_b_val[!is.na(malvik_b_val)],malvik_ub_val[!is.na(malvik_ub_val)],names=c('Open plot','Exclosure'), col='dodgerblue3')
title(main='Malvik')
vioplot(selbu_flub_b_val[!is.na(selbu_flub_b_val)],selbu_flub_ub_val[!is.na(selbu_flub_ub_val)],names=c('Open plot','Exclosure'), col='dodgerblue3')
title(main='Selbu_flub', ylab = 'Canopy Height', cex.lab=1)
vioplot(selbu_kl_b_val[!is.na(selbu_kl_b_val)],selbu_kl_ub_val[!is.na(selbu_kl_ub_val)],names=c('Open plot','Exclosure'), col='dodgerblue3')
title(main='Selbu_kl')
vioplot(selbu_sl_b_val[!is.na(selbu_sl_b_val)],selbu_sl_ub_val[!is.na(selbu_sl_ub_val)],names=c('Open plot','Exclosure'), col='dodgerblue3')
title(main='Selbu_sl')
vioplot(hi_tydal_b_val[!is.na(hi_tydal_b_val)],hi_tydal_ub_val[!is.na(hi_tydal_ub_val)],names=c('Open plot','Exclosure'), col='dodgerblue3')
title(main='Hi_tydal', ylab = 'Canopy Height', cex.lab=1)
vioplot(sl_tydal_b_val[!is.na(sl_tydal_b_val)],sl_tydal_ub_val[!is.na(sl_tydal_ub_val)],names=c('Open plot','Exclosure'), col='dodgerblue3')
title(main='Sl_tydal')
vioplot(steinkjer_1BBb_b_val[!is.na(steinkjer_1BBb_b_val)],steinkjer_1BBb_ub_val[!is.na(steinkjer_1BBb_ub_val)],names=c('Open plot','Exclosure'), col='dodgerblue3')
title(main='Steinkjer_1BBb')
vioplot(steinkjer_2BBb_b_val[!is.na(steinkjer_2BBb_b_val)],steinkjer_2BBb_ub_val[!is.na(steinkjer_2BBb_ub_val)],names=c('Open plot','Exclosure'), col='dodgerblue3')
title(main='Steinkjer_2BBb', ylab = 'Canopy Height', cex.lab=1)
vioplot(nsb_verdal_b_val[!is.na(nsb_verdal_b_val)],nsb_verdal_ub_val[!is.na(nsb_verdal_ub_val)],names=c('Open plot','Exclosure'), col='dodgerblue3')
title(main='Nsb_verdal')
vioplot(verdal1_b_val[!is.na(verdal1_b_val)],verdal1_ub_val[!is.na(verdal1_ub_val)],names=c('Open plot','Exclosure'), col='dodgerblue3')
title(main='Verdal1')
vioplot(verdal2_b_val[!is.na(verdal2_b_val)],verdal2_ub_val[!is.na(verdal2_ub_val)],names=c('Open plot','Exclosure'), col='dodgerblue3')
title(main='Verdal2', ylab = 'Canopy Height', cex.lab=1)
vioplot(namdalseid_1kub_b_val[!is.na(namdalseid_1kub_b_val)],namdalseid_1kub_ub_val[!is.na(namdalseid_1kub_ub_val)],names=c('Open plot','Exclosure'), col='dodgerblue3')
title(main='Namdalseid_1kub')
vioplot(sub_namdalseid_b_val[!is.na(sub_namdalseid_b_val)],sub_namdalseid_ub_val[!is.na(sub_namdalseid_ub_val)],names=c('Open plot','Exclosure'), col='dodgerblue3')
title(main='Sub_namdalseid')

#Telemark
par(mfrow=c(6,3))
par(mar=c(1,4,3,1))
vioplot(fritsoe1_b_val[!is.na(fritsoe1_b_val)],fritsoe1_ub_val[!is.na(fritsoe1_ub_val)],names=c('Open plot','Exclosure'), col='darkolivegreen4')
title(main='Fritsoe1', ylab = 'Canopy Height' )
vioplot(fritsoe2_b_val[!is.na(fritsoe2_b_val)],fritsoe2_ub_val[!is.na(fritsoe2_ub_val)],names=c('Open plot','Exclosure'), col='darkolivegreen4')
title(main='Fritsoe2')
vioplot(n_cappelen1_b_val[!is.na(n_cappelen1_b_val)],n_cappelen1_ub_val[!is.na(n_cappelen1_ub_val)],names=c('Open plot','Exclosure'), col='darkolivegreen4')
title(main='N_cappelen1')
vioplot(n_cappelen2_b_val[!is.na(n_cappelen2_b_val)],n_cappelen2_ub_val[!is.na(n_cappelen2_ub_val)],names=c('Open plot','Exclosure'), col='darkolivegreen4')
title(main='N_cappelen2', ylab = 'Canopy Height')
vioplot(notodden3_b_val[!is.na(notodden3_b_val)],notodden3_ub_val[!is.na(notodden3_ub_val)],names=c('Open plot','Exclosure'), col='darkolivegreen4')
title(main='Notodden3')
vioplot(notodden5_b_val[!is.na(notodden5_b_val)],notodden5_ub_val[!is.na(notodden5_ub_val)],names=c('Open plot','Exclosure'), col='darkolivegreen4')
title(main='Notodden5')
vioplot(notodden6_b_val[!is.na(notodden6_b_val)],notodden6_ub_val[!is.na(notodden6_ub_val)],names=c('Open plot','Exclosure'), col='darkolivegreen4')
title(main='Notodden6', ylab = 'Canopy Height')
vioplot(drangedal1_b_val[!is.na(drangedal1_b_val)],drangedal1_ub_val[!is.na(drangedal1_ub_val)],names=c('Open plot','Exclosure'), col='darkolivegreen4')
title(main='Drangedal1')
vioplot(drangedal3_b_val[!is.na(drangedal3_b_val)],drangedal3_ub_val[!is.na(drangedal3_ub_val)],names=c('Open plot','Exclosure'), col='darkolivegreen4')
title(main='Drangedal3')
vioplot(drangedal4_b_val[!is.na(drangedal4_b_val)],drangedal4_ub_val[!is.na(drangedal4_ub_val)],names=c('Open plot','Exclosure'), col='darkolivegreen4')
title(main='Drangedal4', ylab = 'Canopy Height')
vioplot(kviteseid1_b_val[!is.na(kviteseid1_b_val)],kviteseid1_ub_val[!is.na(kviteseid1_ub_val)],names=c('Open plot','Exclosure'), col='darkolivegreen4')
title(main='Kviteseid1')
vioplot(kviteseid2_b_val[!is.na(kviteseid2_b_val)],kviteseid2_ub_val[!is.na(kviteseid2_ub_val)],names=c('Open plot','Exclosure'), col='darkolivegreen4')
title(main='Kviteseid2')
vioplot(kviteseid3_b_val[!is.na(kviteseid3_b_val)],kviteseid3_ub_val[!is.na(kviteseid3_ub_val)],names=c('Open plot','Exclosure'), col='darkolivegreen4')
title(main='Kviteseid3', ylab = 'Canopy Height')
vioplot(fyresdal_b_val[!is.na(fyresdal_b_val)],fyresdal_ub_val[!is.na(fyresdal_ub_val)],names=c('Open plot','Exclosure'), col='darkolivegreen4')
title(main='Fyresdal')

#Hedmark
par(mfrow=c(4,3))
par(mar=c(1,4,3,1))
vioplot(didrik_holmsen_b_val[!is.na(didrik_holmsen_b_val)],didrik_holmsen_ub_val[!is.na(didrik_holmsen_ub_val)],names=c('Open plot','Exclosure'), col='firebrick2')   
title(main='Didrik Holmsen', ylab = 'Canopy Height')
vioplot(stangesk_aurskog_b_val[!is.na(stangesk_aurskog_b_val)],stangesk_aurskog_ub_val[!is.na(stangesk_aurskog_ub_val)],names=c('Open plot','Exclosure'), col='firebrick2')
title(main='Stangeskovene Aurskog')
vioplot(stig_dahlen_b_val[!is.na(stig_dahlen_b_val)],stig_dahlen_ub_val[!is.na(stig_dahlen_ub_val)],names=c('Open plot','Exclosure'), col='firebrick2')
title(main='Stig Dahlen')
vioplot(truls_holm_b_val[!is.na(truls_holm_b_val)],truls_holm_ub_val[!is.na(truls_holm_ub_val)],names=c('Open plot','Exclosure'), col='firebrick2')
title(main='Truls Holm', ylab = 'Canopy Height')
vioplot(fet3_b_val[!is.na(fet3_b_val)],fet3_ub_val[!is.na(fet3_ub_val)],names=c('Open plot','Exclosure'), col='firebrick2')
title(main='Fet3')
vioplot(eidskog_b_val[!is.na(eidskog_b_val)],eidskog_ub_val[!is.na(eidskog_ub_val)],names=c('Open plot','Exclosure'), col='firebrick2')
title(main='Eidskog')
vioplot(h_pramhus_b_val[!is.na(h_pramhus_b_val)],h_pramhus_ub_val[!is.na(h_pramhus_ub_val)],names=c('Open plot','Exclosure'), col='firebrick2')
title(main='Halvard Pramhus', ylab = 'Canopy Height')
vioplot(stangesk_eidskog_b_val[!is.na(stangesk_eidskog_b_val)],stangesk_eidskog_ub_val[!is.na(stangesk_eidskog_ub_val)],names=c('Open plot','Exclosure'), col='firebrick2')
title(main='Stangeskovene Eidskog')

library(ggplot2)
vioplot_allsites <- ggplot(data=MyData3, aes(x=Treatment, y=Median))+geom_violin()+ggtitle('All sites')
vioplot_allsites


# Data analysis -----------------------------------------------------------
#Load MyData
library(readr)
MyData <- read_csv("~/Master - Sustherb/LidarMoose/MyData.csv")
View(MyData)

#Load MyData2
library(readr)
MyData2 <- read_csv("~/Master - Sustherb/LidarMoose/MyData2.csv")
View(MyData2)

#Load MyData3
library(readr)
MyData3 <- read_csv("~/Master - Sustherb/LidarMoose/MyData3.csv")
View(MyData3)



# Median canopy height - plots --------------------------------------------


#Wilcox test
wilcox.test(MyData3$Median[MyData3$Treatment=='Open plot'],MyData3$Median[MyData3$Treatment=='Exclosure'],paired=T)
#p-value = 3.148e-07

#boxplot median - treatment
p1 <- ggplot(data=MyData3, aes(x=Treatment, y=Median))+geom_boxplot()
p1 <- print(p1+labs(y='Median Canopy Height'))

#vioplot median - treatment
library(ggplot2)
vioplot_median <- ggplot(data=MyData3, aes(x=Treatment, y=Median))+geom_violin()


#Median spaghetti plot
x1<- factor(MyData3$Treatment, levels = c('Exclosure', 'Open plot'))
p2 <- ggplot(data=MyData3, aes(x=x1, y=Median, group=LocalityName,color=Region))+geom_line(size=1.2)+labs(y='Median Canopy Height (m)', x='Treatment')+scale_linetype_manual(breaks = c("Exclosure", "Open plot"), labels = c("Open plots", "Exclosures"), values=c(1,2))
p2 <- p2+theme(rect=element_rect(fill='#6A9567')
               ,panel.background = element_rect(fill = '#6A9567')
               ,panel.grid = element_blank()
               ,panel.border = element_blank()
               ,axis.text=element_text(size=30,color="black")
               ,axis.title.y=element_text(size=30,color="black")
               ,axis.title.x=element_text(size=30,color="black")
               ,axis.text.x=element_text(size=26,color="black")
               ,text=element_text(size=30))+
 scale_x_discrete(limits = c("Exclosure", "Open plot"), breaks = c("Exclosure", "Open plot"), expand = c(0.1,0))

p2 <- p2+scale_color_manual(values=c('black','gray29','gray87')) #changing colours of lines
p2 <- p2+theme(legend.position="top")
# Median absolute deviation -----------------------------------------------

#Wilcox test
wilcox.test(MyData3$MAD[MyData3$Treatment=='Open plot'],MyData3$MAD[MyData3$Treatment=='Exclosure'],paired=T)
#p-value = 1.103e-07

#Boxplot mad-treatment
p3 <- ggplot(data=MyData3, aes(x=Treatment, y=MAD))+geom_boxplot()
p3

#vioplot mad-treatment
p4 <- ggplot(data=MyData3, aes(x=Treatment, y=MAD))+geom_violin()
p4

#mad spaghetti plot
#reorder x-axis
#x1 <- factor(MyData3$Treatment, levels =  c('Exclosure', 'Open plot'))
#p5 <- ggplot(data=MyData3, aes(x=x1, y=MAD, group=LocalityName, color=Region))+geom_line()+labs(y='Median Absolute Deviation', x='Treatment')+theme(text=element_text(size=18))
#p5
x1<- factor(MyData3$Treatment, levels = c('Exclosure', 'Open plot'))
p5 <- ggplot(data=MyData3, aes(x=x1, y=MAD, group=LocalityName,color=Region))+geom_line(size=1.2)+labs(y='Median Absolute Deviation (m)', x='Treatment')+scale_linetype_manual(breaks = c("Exclosure", "Open plot"), labels = c("Open plots", "Exclosures"), values=c(1,2))
p5 <- p5+theme(rect=element_rect(fill='#6A9567')
               ,panel.background = element_rect(fill = '#6A9567')
               ,panel.grid = element_blank()
               ,panel.border = element_blank()
               ,axis.text=element_text(size=30,color="black")
               ,axis.title.y=element_text(size=30,color="black")
               ,axis.title.x=element_text(size=30,color="black")
               ,axis.text.x=element_text(size=26,color="black")
               ,text=element_text(size=30))+
  scale_x_discrete(limits = c("Exclosure", "Open plot"), breaks = c("Exclosure", "Open plot"), expand = c(0.1,0))

p5 <- p5+scale_color_manual(values=c('black','gray29','gray87')) #changing colours of lines
p5


# Panel plots -------------------------------------------------------------

#Getting figures side-by side (mad and median)
library(egg)
panel_plot_spagh<- egg::ggarrange(p2+ theme(legend.position="none"),p5, ncol=2) #common.legend = T)

#maybe remove grid in the background? - looks a bit strange. Add, panel_grid_element_blank in theme.
#and treatment only written once? -axis.title.x.bottom=element_blank() removes treatment on both,how to add one on the middle

panel_plot_vio<- egg::ggarrange(vioplot_median+ theme(legend.position="none"),p4, ncol=2) #common.legend = T)

panel_plot_box<- egg::ggarrange(p1+ theme(legend.position="none"),p3, ncol=2) #common.legend = T)


# IQR ---------------------------------------------------------------------

#IQR
#Wilcox test
wilcox.test(MyData3$IQR[MyData3$Treatment=='Open plot'],MyData3$IQR[MyData3$Treatment=='Exclosure'],paired=T)

#IQR boxplot
p6 <-  ggplot(data=MyData3, aes(x=Treatment, y=IQR))+geom_boxplot()

#IQR violin plot
p7 <- ggplot(data=MyData3, aes(x=Treatment, y=IQR))+geom_violin()

#Spaghetti plot IQR - treatment
p8 <- ggplot(data=MyData3, aes(x=Treatment, y=IQR, group=LocalityName,color=Region))+geom_line()



# CV ----------------------------------------------------------------------
#Wilcox test
wilcox.test(MyData3$CV[MyData3$Treatment=='Open plot'],MyData3$CV[MyData3$Treatment=='Exclosure'],paired=T)

#Boxplot CV
p8 <- boxplot(MyData3$CV~MyData3$Treatment, xlab="Treatment", ylab="Coefficient of Variation")

#Vioplot CV
p9 <-  ggplot(data=MyData3, aes(x=Treatment, y=CV))+geom_violin()




# MAD/Median --------------------------------------------------------------
#Wilcox test
wilcox.test(MyData3$MAD_med[MyData3$Treatment=='Open plot'],MyData3$MAD_med[MyData3$Treatment=='Exclosure'],paired=T)
#p-value= 0.6982 - not significant

#Boxplot
p10 <- ggplot(data=MyData3, aes(x=Treatment, y=MAD_med))+geom_boxplot()
p10

#vioplot
p11 <- ggplot(data=MyData3, aes(x=Treatment, y=MAD_med))+geom_violin()
p11


# IQR/Median --------------------------------------------------------------
wilcox.test(MyData3$IQR_med[MyData3$Treatment=='Open plot'],MyData3$IQR_med[MyData3$Treatment=='Exclosure'],paired=T)
#p-value = 0.1718

#Boxplot
p12 <- ggplot(data=MyData3, aes(x=Treatment, y=IQR_med))+geom_boxplot()


#vioplot
p13 <- ggplot(data=MyData3, aes(x=Treatment, y=IQR_med))+geom_violin()
p13


# Mean --------------------------------------------------------------------

#Mean - obs, maybe not a good measure, skewed distribution
wilcox.test(MyData3$Mean[MyData3$Treatment=='Open plot'],MyData3$Mean[MyData3$Treatment=='Exclosure'],paired=T)
p13 <- boxplot(MyData3$SD~MyData3$Treatment)






# Making table that include productivity --------------------------------------------
library(readr)
Site_prod_all_regions <- read_csv("~/Master - Sustherb/LidarMoose/Site_prod_all_regions.csv")
View(Site_prod_all_regions)

prod <- Site_prod_all_regions
prod[8, 3]='Fritsoe1'
prod[9, 3]='Fritsoe2'
prod[36, 3]='Singsaas'
prod[42, 3]='Stig Dahlen'


# #Changed localityNames in excel to merge it with MyData3
# library(readr)
# productivity_test <- read_delim("~/Master - Sustherb/LidarMoose/productivity_test.csv", 
#                                 ";", escape_double = FALSE, trim_ws = TRUE)
# View(productivity_test)

MyData4<- merge.data.frame(MyData3, prod, by= 'LocalityName')
write.csv(MyData4, 'MyData4.csv')

View(MyData4)


  
  
  
# Testing -----------------------------------------------------------------
#Years since clear cut - median
p14 <- ggplot(data=MyData3, aes(x=ClearCutToLidar, y=Median, color=Treatment))+geom_point(shape=1)+geom_smooth(method = lm,formula = y~x)+labs(x= 'Years from clear cut to lidar data was collected')
p14

range(MyData3$Median)

#Trying to extract colour from image
#1
#library(devtools)
#install_github("andreacirilloac/paletter")/intall.packages("paletter") not for my version of R

#create_palette(image_path = "C:/Users/Ingrid/Documents/Master - Sustherb/Bilder Lillian -Elg/elg 7.2014.jpg",
#               number_of_colors =20,
#               type_of_variable = 'categorical')

#2
#library(imager)
# nacreDM <- load.image("C:/Users/Ingrid/Documents/Master - Sustherb/Bilder Lillian -Elg/elg 7.2014.jpg")

#nacreRGB <- data.frame(
#  x = rep(1:nacreDm[2], each = nacreDm[1]),
#  y = rep(nacreDm[1]:1, nacreDm[2]),
#  R = as.vector(nacre[,,1]),
#  G = as.vector(nacre[,,2]),
#  B = as.vector(nacre[,,3])
)
# head(nacreRGB)

# Assign RGB channels to data frame without pixel coordinates
#nacreRGB2 <- data.frame(
#  R = as.vector(nacre[,,1]),
#  G = as.vector(nacre[,,2]),
#  B = as.vector(nacre[,,3])


#3
rgb(red=77,green=125,blue=75, maxColorValue = 125)
#"#9DFF99"  

