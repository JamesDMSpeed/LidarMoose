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
df1['LAB', 1:7] <- MySummary(singsaas_b_canopyheight)







df1


summary(bratsberg_ub_canopyheight)



#MyList <- c(bratsberg_b_canopyheight, bratsberg_ub_canopyheight, hi_tydal_b_canopyheight, hi_tydal_ub_canopyheight)


#preallocate the space for the values you want to store.
#testmat <-  matrix(nrow=37, ncol = 5)

#for(i in MyList) {
#  testmat[1,] <- MySummary(i)
#  print(i)
#}

#still only saves result of last iteration