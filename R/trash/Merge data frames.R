##Merging

library(readr)
SustHerb_Sites_Info <- read_delim("~/Master - Sustherb/SustHerb Sites Info.csv", ";", escape_double = FALSE, trim_ws = TRUE)
View(SustHerb_Sites_Info)

library(readr)
SustHerb_Sites_stats <- read_delim("~/Master - Sustherb/canopyheightsummarystats.csv", ",", escape_double = FALSE, trim_ws = TRUE)
View(SustHerb_Sites_stats)

library(readr)
Site_prod_all_regions <- read_csv("~/Master - Sustherb/LidarMoose/Site_prod_all_regions.csv")
View(Site_prod_all_regions)

prod <- Site_prod_all_regions
prod[8, 3]='Fritsoe1'
prod[9, 3]='Fritsoe2'
prod[36, 3]='Singsaas'
prod[42, 3]='Stig Dahlen'

merge_1<- merge.data.frame(SustHerb_Sites_Info, prod, by= 'LocalityName')
write.csv(merge_1, 'merge_1.csv')

View(merge_1)
