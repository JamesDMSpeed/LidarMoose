##Merging

library(readr)
SustHerb_Sites_Info <- read_delim("~/Master - Sustherb/sites_info_new.csv", ";", escape_double = FALSE, trim_ws = TRUE, na.rm=T)
View(SustHerb_Sites_Info)

SustHerb_Sites_Info2 <- SustHerb_Sites_Info[c(1:90),]
metadata <- SustHerb_Sites_Info2
 metadata[5, 5]='Stig Dahlen'
 metadata[6, 5]='Stig Dahlen'
 metadata[9, 5]='Soerum'
 metadata[10, 5]='Soerum'
 metadata[33, 5]='Fritsoe1'
 metadata[34, 5]='Fritsoe1'
 metadata[35, 5]='Fritsoe2'
 metadata[36, 5]='Fritsoe2'
 metadata[63, 5]='Singsaas'
 metadata[64, 5]='Singsaas' 


library(readr)
SustHerb_Sites_stats <- read_delim("~/Master - Sustherb/canopyheightsummarystats.csv", ",", escape_double = FALSE, trim_ws = TRUE)
View(SustHerb_Sites_stats)

library(readr)
Site_prod_all_regions <- read_csv("~/Master - Sustherb/LidarMoose/Site_prod_all_regions_new.csv")
View(Site_prod_all_regions)

prod <- Site_prod_all_regions
prod[42, 3]='Stig Dahlen'
prod[44, 3]='Soerum'
prod[8, 3]='Fritsoe1'
prod[9, 3]='Fritsoe2'
prod[36, 3]='Singsaas'

merge_1<- merge.data.frame(metadata, prod, by= 'LocalityName')
write.csv(merge_1, 'merge_1.csv')

View(merge_1)

#Legg til kolonne til sustherb_sites_stats med locality code
stats <- SustHerb_Sites_stats
stats$LocalityCode=""
stats[1, 10] <- "BRB"
stats[2, 10] <- "BRUB"
stats[3, 10] <- "DHB"
stats[4, 10] <- "DHUB"
stats[5, 10] <- "1DRB"
stats[6, 10] <- "1DRUB"
stats[7, 10] <- "3DRB"
stats[8, 10] <- "3DRUB"
stats[9, 10] <- "4DRB"
stats[10, 10] <- "4DRUB"
stats[11, 10] <- "STSKNB"
stats[12, 10] <- "STSKNUB"
stats[13, 10] <- "FKB"
stats[14, 10] <- "FKUB"
stats[15, 10] <- "1FRB"
stats[16, 10] <- "1FRUB"
stats[17, 10] <- "2FRB"
stats[18, 10] <- "2FRUB"
stats[19, 10] <- "1FYB"
stats[20, 10] <- "1FYUB"
stats[21, 10] <- "HPB"
stats[22, 10] <- "HPUB"
stats[23, 10] <- "HIB"
stats[24, 10] <- "HIUB"
stats[25, 10] <- "IAAB"
stats[26, 10] <- "IAAUB"
stats[27, 10] <- "JCDB"
stats[28, 10] <- "JCDUB"
stats[29, 10] <- "1KVB"
stats[30, 10] <- "1KVUB"
stats[31, 10] <- "2KVB"
stats[32, 10] <- "2KVUB"
stats[33, 10] <- "3KVB"
stats[34, 10] <- "3KVUB"
stats[35, 10] <- "M1B"
stats[36, 10] <- "M1UB"
stats[37, 10] <- "M2B"
stats[38, 10] <- "M2UB"
stats[39, 10] <- "M3B"
stats[40, 10] <- "M3UB"
stats[41, 10] <- "MAB"
stats[42, 10] <- "MAUB"
stats[43, 10] <- "1CAB"
stats[44, 10] <- "1CAUB"
stats[45, 10] <- "2CAB"
stats[46, 10] <- "2CAUB"
stats[47, 10] <- "1KB"
stats[48, 10] <- "1KUB"
stats[49, 10] <- "DDB"
stats[50, 10] <- "DDUB"
stats[51, 10] <- "OLB"
stats[52, 10] <- "OLUB"
stats[53, 10] <- "3NOB"
stats[54, 10] <- "3NOUB"
stats[55, 10] <- "5NOB"
stats[56, 10] <- "5NOUB"
stats[57, 10] <- "6NOB"
stats[58, 10] <- "6NOUB"
stats[59, 10] <- "1NSB"
stats[60, 10] <- "1NSUB"
stats[61, 10] <- "FLB"
stats[62, 10] <- "FLUB"
stats[63, 10] <- "KLB"
stats[64, 10] <- "KLUB"
stats[65, 10] <- "SLB"
stats[66, 10] <- "SLUB"
stats[67, 10] <- "LAB"
stats[68, 10] <- "LAUB"
stats[69, 10] <- "SEB"
stats[70, 10] <- "SEUB"
stats[71, 10] <- "SKB"
stats[72, 10] <- "SKUB"
stats[73, 10] <- "SSAB"
stats[74, 10] <- "SSAUB"
stats[75, 10] <- "SSBB"
stats[76, 10] <- "SSBUB"
stats[77, 10] <- "1BBB"
stats[78, 10] <- "1BBUB"
stats[79, 10] <- "2BBB"
stats[80, 10] <- "2BBUB"
stats[81, 10] <- "SDB"
stats[82, 10] <- "SDUB"
stats[83, 10] <- "1SB"
stats[84, 10] <- "1SUB"
stats[85, 10] <- "THB"
stats[86, 10] <- "THUB"
stats[87, 10] <- "1VBB"
stats[88, 10] <- "1VBUB"
stats[89, 10] <- "2VBB"
stats[90, 10] <- "2VBUB"

merge_meta_stats <- merge.data.frame(merge_1, stats, by= 'LocalityCode')
View(merge_meta_stats)
write.csv(merge_meta_stats, 'Metadata_stats.csv')


