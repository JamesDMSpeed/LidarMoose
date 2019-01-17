#Making table

require(lidR)
require(raster)
require(rasterVis)
require(rgeos)


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

#CV - coefficient of variation
MyData$CV <- MyData$SD/MyData$Mean

#Time since CC'
MyData$ClearCutToLidar<-MyData$'LiDAR data from year'-MyData$'Clear cut' 

write.csv(MyData, 'MyData.csv')

# Play data analysis ------------------------------------------------------

#Importt MyData
library(readr)
MyData <- read_csv("~/Master - Sustherb/LidarMoose/MyData.csv")
View(MyData)

require(ggplot2)
require(ggvis)
require(gridExtra)

#Play data analysis


#Median height boxplot
wilcox.test(MyData$Median[MyData$Treatment=='B'],MyData$Median[MyData$Treatment=='UB'],paired=T)
boxplot(MyData$Median~MyData$Treatment, xlab="Treatment", ylab="Median Canopy Height")
#bp <- ggplot(data=MyData, aes(x=Treatment, y=Median))+geom_boxplot()#just wanted to try doing a ggplot

#IQR boxplot
wilcox.test(MyData$IQR[MyData$Treatment=='B'],MyData$IQR[MyData$Treatment=='UB'],paired=T)
boxplot(MyData$IQR~MyData$Treatment)

#Mean - obs, maybe not a good measure, skewed distribution
wilcox.test(MyData$Mean[MyData$Treatment=='B'],MyData$Mean[MyData$Treatment=='UB'],paired=T)
boxplot(MyData$SD~MyData$Treatment)

#CV
wilcox.test(MyData$CV[MyData$Treatment=='B'],MyData$CV[MyData$Treatment=='UB'],paired=T)
boxplot(MyData$CV~MyData$Treatment, xlab="Treatment", ylab="Coefficient of Variation")

#Spaghetti plots 
require(ggplot2)
require(ggvis)
require(gridExtra)

#Testing, trying to learn qplot and ggplot
p1<- qplot(MyData$ClearCutToLidar, MyData$Median, color=MyData$Treatment)
p1
p2 <- qplot(MyData$Treatment, MyData$Median)
p2
p3 <- qplot(MyData$Median, fill=MyData$Treatment)
p3

#spaghettiplot,treatment and median, colours by region
p4 <- ggplot(data=MyData, aes(x=Treatment, y=Median, group=LocalityName,color=MyData$Region))+geom_line()
p4
print(p4)

p5 <- ggplot(data=MyData, aes(x=ClearCutToLidar, y=Median))+geom_point()
p5

p6 <- ggplot(data=MyData, aes(x=Treatment, y=IQR, group=LocalityName,color=MyData$Region))+geom_line()
p6

#boxplot median - treatment
p7 <- ggplot(data=MyData, aes(x=Treatment, y=Median))+geom_boxplot()
p7 <- print(p7+labs(y='Median Canopy Height'))

#boxplot IQR -treatment
p8 <- ggplot(data=MyData, aes(x=Treatment, y=IQR))+geom_boxplot()
p8 
wilcox.test(MyData$IQR[MyData$Treatment=='B'],MyData$IQR[MyData$Treatment=='UB'],paired=T)

#Scatterplot Clearcut to lidar - median canopy height
p9 <- ggplot(data=MyData, aes(x=ClearCutToLidar, y=Median, color=Treatment))+geom_point(shape=1)+geom_smooth(method = lm,formula = y~x)+labs(x= 'Years from clear cut to lidar data was collected')
p9
#Trying to get the R-value 
#m <- lm(Median~ClearCutToLidar, data=MyData)
#eq <- substitute(italic(y) == a + b %.% italic(x)*","~~italic(r)^2~"="~r2, 
#                 list(        a = format(coef(m)[1], digits = 4), 
#                              b = format(coef(m)[2], digits = 4), 
#                             r2 = format(summary(m)$r.squared, digits = 3)))

#dftext <- data.frame(x = 70, y = 50, eq = as.character(as.expression(eq)))
#p9 + geom_text(aes(label = eq), data = dftext, parse = TRUE)
