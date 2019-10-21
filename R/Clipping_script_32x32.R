
# Top ---------------------------------------------------------------------

require(lidR)
require(raster)
require(rasterVis)
require(rgeos)

plotcoords<-read.csv('Troendelag_20m_flater_pkt.csv',header=T,sep=';',dec=',')
plotcoords_telemark<-read.csv('Koordinater_20x20_Telemark.csv',header=T,sep=';',dec=',')
plotcoords_hedmark_akershus<-read.csv('Koordinater_20x20_Hedmark_Akershus.csv',header=T,sep=';',dec=',')


# Trondelag ---------------------------------------------------------------


# Bratsberg ---------------------------------------------------------------

bratsberg_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Trondelag/bratsberg.las')
bratsberg_las 
plot(bratsberg_las)

#bratsberg_b

bratsberg_b_order<-chull(as.matrix(plotcoords[plotcoords$Name=='Brb',4:5]))
bratsberg_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Brb',4:5][bratsberg_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
bratsberg_b_pl <- Polygons(list(bratsberg_b_poly),1)
bratsberg_b_sp <- SpatialPolygons(list(bratsberg_b_pl))
bratsberg_b_polybuf <- gBuffer(bratsberg_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_bratsberg_b<-data.frame(ID=1)
rownames(df1_bratsberg_b)<-'buffer' 
bratsberg_b_spdf <- SpatialPolygonsDataFrame(bratsberg_b_polybuf,data=df1_bratsberg_b,match.ID = TRUE)

bratsberg_b_outerpoly<-lasclip(bratsberg_las,bratsberg_b_spdf)
bratsberg_b_outerpoly<-bratsberg_b_outerpoly$`1`
plot(bratsberg_b_outerpoly)

writeLAS(bratsberg_b_outerpoly,'Trondelag/clipped_las/bratsberg_b.las')

#bratsberg_ub
bratsberg_ub_order<-chull(as.matrix(plotcoords[plotcoords$Name=='Brub',4:5]))
bratsberg_ub_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Brub',4:5][bratsberg_ub_order,]))

bratsberg_ub_pl <- Polygons(list(bratsberg_ub_poly),1)
bratsberg_ub_sp <- SpatialPolygons(list(bratsberg_ub_pl))
bratsberg_ub_polybuf <- gBuffer(bratsberg_ub_sp, width=6)

df1_bratsberg_ub<-data.frame(ID=1)
rownames(df1_bratsberg_ub)<-'buffer'
bratsberg_ub_spdf <- SpatialPolygonsDataFrame(bratsberg_ub_polybuf,data=df1_bratsberg_ub,match.ID = TRUE)

bratsberg_ub_outerpoly<-lasclip(bratsberg_las,bratsberg_ub_spdf)
bratsberg_ub_outerpoly<-bratsberg_ub_outerpoly$`1`
plot(bratsberg_ub_outerpoly)

writeLAS(bratsberg_ub_outerpoly,'Trondelag/clipped_las/bratsberg_ub.las')





# Hi_Tydal ----------------------------------------------------------------

hi_tydal_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Trondelag/Hi_tydal.las')
hi_tydal_las 
plot(hi_tydal_las)

#hi_tydal_b

hi_tydal_b_order<-chull(as.matrix(plotcoords[plotcoords$Name=='Hib',4:5]))
hi_tydal_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Hib',4:5][hi_tydal_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
hi_tydal_b_pl <- Polygons(list(hi_tydal_b_poly),1)
hi_tydal_b_sp <- SpatialPolygons(list(hi_tydal_b_pl))
hi_tydal_b_polybuf <- gBuffer(hi_tydal_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_hi_tydal_b<-data.frame(ID=1)
rownames(df1_hi_tydal_b)<-'buffer' 
hi_tydal_b_spdf <- SpatialPolygonsDataFrame(hi_tydal_b_polybuf,data=df1_hi_tydal_b,match.ID = TRUE)

hi_tydal_b_outerpoly<-lasclip(hi_tydal_las,hi_tydal_b_spdf)
hi_tydal_b_outerpoly<-hi_tydal_b_outerpoly$`1`
plot(hi_tydal_b_outerpoly)

writeLAS(hi_tydal_b_outerpoly,'Trondelag/clipped_las/hi_tydal_b.las')

#hi_tydal_ub
hi_tydal_ub_order<-chull(as.matrix(plotcoords[plotcoords$Name=='Hiub',4:5]))
hi_tydal_ub_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Hiub',4:5][hi_tydal_ub_order,]))

hi_tydal_ub_pl <- Polygons(list(hi_tydal_ub_poly),1)
hi_tydal_ub_sp <- SpatialPolygons(list(hi_tydal_ub_pl))
hi_tydal_ub_polybuf <- gBuffer(hi_tydal_ub_sp, width=6)

df1_hi_tydal_ub<-data.frame(ID=1)
rownames(df1_hi_tydal_ub)<-'buffer'
hi_tydal_ub_spdf <- SpatialPolygonsDataFrame(hi_tydal_ub_polybuf,data=df1_hi_tydal_ub,match.ID = TRUE)

hi_tydal_ub_outerpoly<-lasclip(hi_tydal_las,hi_tydal_ub_spdf)
hi_tydal_ub_outerpoly<-hi_tydal_ub_outerpoly$`1`
plot(hi_tydal_ub_outerpoly)

writeLAS(hi_tydal_ub_outerpoly,'Trondelag/clipped_las/hi_tydal_ub.las')


# Malvik ------------------------------------------------------------------

malvik_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Trondelag/Malvik.las')
malvik_las 
plot(malvik_las)


#malvik_b

malvik_b_order<-chull(as.matrix(plotcoords[plotcoords$Name=='Mab',4:5]))
malvik_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Mab',4:5][malvik_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
malvik_b_pl <- Polygons(list(malvik_b_poly),1)
malvik_b_sp <- SpatialPolygons(list(malvik_b_pl))
malvik_b_polybuf <- gBuffer(malvik_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_malvik_b<-data.frame(ID=1)
rownames(df1_malvik_b)<-'buffer' 
malvik_b_spdf <- SpatialPolygonsDataFrame(malvik_b_polybuf,data=df1_malvik_b,match.ID = TRUE)

malvik_b_outerpoly<-lasclip(malvik_las,malvik_b_spdf)
malvik_b_outerpoly<-malvik_b_outerpoly$`1`
plot(malvik_b_outerpoly)

writeLAS(malvik_b_outerpoly,'Trondelag/clipped_las/malvik_b.las')

#malvik_ub
malvik_ub_order<-chull(as.matrix(plotcoords[plotcoords$Name=='Maub',4:5]))
malvik_ub_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Maub',4:5][malvik_ub_order,]))

malvik_ub_pl <- Polygons(list(malvik_ub_poly),1)
malvik_ub_sp <- SpatialPolygons(list(malvik_ub_pl))
malvik_ub_polybuf <- gBuffer(malvik_ub_sp, width=6)

df1_malvik_ub<-data.frame(ID=1)
rownames(df1_malvik_ub)<-'buffer'
malvik_ub_spdf <- SpatialPolygonsDataFrame(malvik_ub_polybuf,data=df1_malvik_ub,match.ID = TRUE)

malvik_ub_outerpoly<-lasclip(malvik_las,malvik_ub_spdf)
malvik_ub_outerpoly<-malvik_ub_outerpoly$`1`
plot(malvik_ub_outerpoly)

writeLAS(malvik_ub_outerpoly,'Trondelag/clipped_las/malvik_ub.las')




# Namdalseid 1kub ---------------------------------------------------------

namdalseid_1kub_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Trondelag/namdalseid_1kub.las')
namdalseid_1kub_las 
plot(namdalseid_1kub_las)

#Namdalseid_1kub_b
namdalseid_1kub_b_order<-chull(as.matrix(plotcoords[plotcoords$Name=='1Kb',4:5]))
namdalseid_1kub_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='1Kb',4:5][namdalseid_1kub_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
namdalseid_1kub_b_pl <- Polygons(list(namdalseid_1kub_b_poly),1)
namdalseid_1kub_b_sp <- SpatialPolygons(list(namdalseid_1kub_b_pl))
namdalseid_1kub_b_polybuf <- gBuffer(namdalseid_1kub_b_sp, width=6)
#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame, for it to work in the lasclip function
df1_namdalseid_1kub_b<-data.frame(ID=1)
rownames(df1_namdalseid_1kub_b)<-'buffer'
namdalseid_1kub_b_spdf <- SpatialPolygonsDataFrame(namdalseid_1kub_b_polybuf,data=df1_namdalseid_1kub_b,match.ID = TRUE)

namdalseid_1kub_b_outerpoly<-lasclip(namdalseid_1kub_las,namdalseid_1kub_b_spdf)
namdalseid_1kub_b_outerpoly<-namdalseid_1kub_b_outerpoly$`1`
plot(namdalseid_1kub_b_outerpoly)

writeLAS(namdalseid_1kub_b_outerpoly,'Trondelag/clipped_las/namdalseid_1kub_b.las')


#Namdalseid_1kub_ub
namdalseid_1kub_ub_order<-chull(as.matrix(plotcoords[plotcoords$Name=='1Kub',4:5]))
namdalseid_1kub_ub_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='1Kub',4:5][namdalseid_1kub_ub_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
namdalseid_1kub_ub_pl <- Polygons(list(namdalseid_1kub_ub_poly),1)
namdalseid_1kub_ub_sp <- SpatialPolygons(list(namdalseid_1kub_ub_pl))
namdalseid_1kub_ub_polybuf <- gBuffer(namdalseid_1kub_ub_sp, width=6)
#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_namdalseid_1kub_ub_namdalseid_1kub_ub_namdalseid_1kub_ub<-data.frame(ID=1)
rownames(df1_namdalseid_1kub_ub_namdalseid_1kub_ub_namdalseid_1kub_ub)<-'buffer'
namdalseid_1kub_ub_spdf <- SpatialPolygonsDataFrame(namdalseid_1kub_ub_polybuf,data=df1_namdalseid_1kub_ub_namdalseid_1kub_ub_namdalseid_1kub_ub,match.ID = TRUE)

namdalseid_1kub_ub_outerpoly<-lasclip(namdalseid_1kub_las,namdalseid_1kub_ub_spdf)
namdalseid_1kub_ub_outerpoly<-namdalseid_1kub_ub_outerpoly$`1`
plot(namdalseid_1kub_ub_outerpoly)

writeLAS(namdalseid_1kub_ub_outerpoly,'Trondelag/clipped_las/namdalseid_1kub_ub.las')



# Nsb Verdal -------------------------------------------------------------
nsb_verdal_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Trondelag/Nsb_Verdal.las')
nsb_verdal_las 
plot(nsb_verdal_las)

#nsb_verdal_b

nsb_verdal_b_order<-chull(as.matrix(plotcoords[plotcoords$Name=='1Nsb',4:5]))
nsb_verdal_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='1Nsb',4:5][nsb_verdal_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
nsb_verdal_b_pl <- Polygons(list(nsb_verdal_b_poly),1)
nsb_verdal_b_sp <- SpatialPolygons(list(nsb_verdal_b_pl))
nsb_verdal_b_polybuf <- gBuffer(nsb_verdal_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_nsb_verdal_b<-data.frame(ID=1)
rownames(df1_nsb_verdal_b)<-'buffer' 
nsb_verdal_b_spdf <- SpatialPolygonsDataFrame(nsb_verdal_b_polybuf,data=df1_nsb_verdal_b,match.ID = TRUE)

nsb_verdal_b_outerpoly<-lasclip(nsb_verdal_las,nsb_verdal_b_spdf)
nsb_verdal_b_outerpoly<-nsb_verdal_b_outerpoly$`1`
plot(nsb_verdal_b_outerpoly)

writeLAS(nsb_verdal_b_outerpoly,'Trondelag/clipped_las/nsb_verdal_b.las')

#nsb_verdal_ub
nsb_verdal_ub_order<-chull(as.matrix(plotcoords[plotcoords$Name==' 1Nsub',4:5]))
nsb_verdal_ub_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name==' 1Nsub',4:5][nsb_verdal_ub_order,]))

nsb_verdal_ub_pl <- Polygons(list(nsb_verdal_ub_poly),1)
nsb_verdal_ub_sp <- SpatialPolygons(list(nsb_verdal_ub_pl))
nsb_verdal_ub_polybuf <- gBuffer(nsb_verdal_ub_sp, width=6)

df1_nsb_verdal_ub<-data.frame(ID=1)
rownames(df1_nsb_verdal_ub)<-'buffer'
nsb_verdal_ub_spdf <- SpatialPolygonsDataFrame(nsb_verdal_ub_polybuf,data=df1_nsb_verdal_ub,match.ID = TRUE)

nsb_verdal_ub_outerpoly<-lasclip(nsb_verdal_las,nsb_verdal_ub_spdf)
nsb_verdal_ub_outerpoly<-nsb_verdal_ub_outerpoly$`1`
plot(nsb_verdal_ub_outerpoly)

writeLAS(nsb_verdal_ub_outerpoly,'Trondelag/clipped_las/nsb_verdal_ub.las')


# Selbu flub --------------------------------------------------------------
selbu_flub_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Trondelag/Selbu_flub.las')
selbu_flub_las 
plot(selbu_flub_las)

#selbu_flub_b

selbu_flub_b_order<-chull(as.matrix(plotcoords[plotcoords$Name=='Flb',4:5]))
selbu_flub_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Flb',4:5][selbu_flub_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
selbu_flub_b_pl <- Polygons(list(selbu_flub_b_poly),1)
selbu_flub_b_sp <- SpatialPolygons(list(selbu_flub_b_pl))
selbu_flub_b_polybuf <- gBuffer(selbu_flub_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_selbu_flub_b<-data.frame(ID=1)
rownames(df1_selbu_flub_b)<-'buffer' 
selbu_flub_b_spdf <- SpatialPolygonsDataFrame(selbu_flub_b_polybuf,data=df1_selbu_flub_b,match.ID = TRUE)

selbu_flub_b_outerpoly<-lasclip(selbu_flub_las,selbu_flub_b_spdf)
selbu_flub_b_outerpoly<-selbu_flub_b_outerpoly$`1`
plot(selbu_flub_b_outerpoly)

writeLAS(selbu_flub_b_outerpoly,'Trondelag/clipped_las/selbu_flub_b.las')

#selbu_flub_ub
selbu_flub_ub_order<-chull(as.matrix(plotcoords[plotcoords$Name=='Flub',4:5]))
selbu_flub_ub_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Flub',4:5][selbu_flub_ub_order,]))

selbu_flub_ub_pl <- Polygons(list(selbu_flub_ub_poly),1)
selbu_flub_ub_sp <- SpatialPolygons(list(selbu_flub_ub_pl))
selbu_flub_ub_polybuf <- gBuffer(selbu_flub_ub_sp, width=6)

df1_selbu_flub_ub<-data.frame(ID=1)
rownames(df1_selbu_flub_ub)<-'buffer'
selbu_flub_ub_spdf <- SpatialPolygonsDataFrame(selbu_flub_ub_polybuf,data=df1_selbu_flub_ub,match.ID = TRUE)

selbu_flub_ub_outerpoly<-lasclip(selbu_flub_las,selbu_flub_ub_spdf)
selbu_flub_ub_outerpoly<-selbu_flub_ub_outerpoly$`1`
plot(selbu_flub_ub_outerpoly)

writeLAS(selbu_flub_ub_outerpoly,'Trondelag/clipped_las/selbu_flub_ub.las')


# Selbu_kl ----------------------------------------------------------------

selbu_kl_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Trondelag/Selbu_kl.las')
selbu_kl_las 
plot(selbu_kl_las)

#Selbu_kl_b

selbu_kl_b_order<-chull(as.matrix(plotcoords[plotcoords$Name=='Klb',4:5]))
selbu_kl_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Klb',4:5][selbu_kl_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
selbu_kl_b_pl <- Polygons(list(selbu_kl_b_poly),1)
selbu_kl_b_sp <- SpatialPolygons(list(selbu_kl_b_pl))
selbu_kl_b_polybuf <- gBuffer(selbu_kl_b_sp, width=6)

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_selbu_kl_b<-data.frame(ID=1)
rownames(df1_selbu_kl_b)<-'buffer'
selbu_kl_b_spdf <- SpatialPolygonsDataFrame(selbu_kl_b_polybuf,data=df1_selbu_kl_b,match.ID = TRUE)

selbu_kl_b_outerpoly<-lasclip(selbu_kl_las,selbu_kl_b_spdf)
selbu_kl_b_outerpoly<-selbu_kl_b_outerpoly$`1`
plot(selbu_kl_b_outerpoly)

writeLAS(selbu_kl_b_outerpoly,'Trondelag/clipped_las/selbu_kl_b.las')

#Selbu_kl_ub
selbu_kl_ub_order<-chull(as.matrix(plotcoords[plotcoords$Name=='Klub',4:5]))
selbu_kl_ub_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Klub',4:5][selbu_kl_ub_order,]))

selbu_kl_ub_pl <- Polygons(list(selbu_kl_ub_poly),1)
selbu_kl_ub_sp <- SpatialPolygons(list(selbu_kl_ub_pl))
selbu_kl_ub_polybuf <- gBuffer(selbu_kl_ub_sp, width=6)

df1_selbu_kl_ub<-data.frame(ID=1)
rownames(df1_selbu_kl_ub)<-'buffer'
selbu_kl_ub_spdf <- SpatialPolygonsDataFrame(selbu_kl_ub_polybuf,data=df1_selbu_kl_ub,match.ID = TRUE)

selbu_kl_ub_outerpoly<-lasclip(selbu_kl_las,selbu_kl_ub_spdf)
selbu_kl_ub_outerpoly<-selbu_kl_ub_outerpoly$`1`
plot(selbu_kl_ub_outerpoly)

writeLAS(selbu_kl_ub_outerpoly,'Trondelag/clipped_las/selbu_kl_ub.las')


# Selbu_sl ----------------------------------------------------------------

selbu_sl_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Trondelag/Selbu_sl.las')
selbu_sl_las 
plot(selbu_sl_las)

#selbu_sl_b

selbu_sl_b_order<-chull(as.matrix(plotcoords[plotcoords$Name=='Slb',4:5]))
selbu_sl_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Slb',4:5][selbu_sl_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
selbu_sl_b_pl <- Polygons(list(selbu_sl_b_poly),1)
selbu_sl_b_sp <- SpatialPolygons(list(selbu_sl_b_pl))
selbu_sl_b_polybuf <- gBuffer(selbu_sl_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_selbu_sl_b<-data.frame(ID=1)
rownames(df1_selbu_sl_b)<-'buffer' 
selbu_sl_b_spdf <- SpatialPolygonsDataFrame(selbu_sl_b_polybuf,data=df1_selbu_sl_b,match.ID = TRUE)

selbu_sl_b_outerpoly<-lasclip(selbu_sl_las,selbu_sl_b_spdf)
selbu_sl_b_outerpoly<-selbu_sl_b_outerpoly$`1`
plot(selbu_sl_b_outerpoly)

writeLAS(selbu_sl_b_outerpoly,'Trondelag/clipped_las/selbu_sl_b.las')

#selbu_sl_ub
selbu_sl_ub_order<-chull(as.matrix(plotcoords[plotcoords$Name=='Slub',4:5]))
selbu_sl_ub_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Slub',4:5][selbu_sl_ub_order,]))

selbu_sl_ub_pl <- Polygons(list(selbu_sl_ub_poly),1)
selbu_sl_ub_sp <- SpatialPolygons(list(selbu_sl_ub_pl))
selbu_sl_ub_polybuf <- gBuffer(selbu_sl_ub_sp, width=6)

df1_selbu_sl_ub<-data.frame(ID=1)
rownames(df1_selbu_sl_ub)<-'buffer'
selbu_sl_ub_spdf <- SpatialPolygonsDataFrame(selbu_sl_ub_polybuf,data=df1_selbu_sl_ub,match.ID = TRUE)

selbu_sl_ub_outerpoly<-lasclip(selbu_sl_las,selbu_sl_ub_spdf)
selbu_sl_ub_outerpoly<-selbu_sl_ub_outerpoly$`1`
plot(selbu_sl_ub_outerpoly)

writeLAS(selbu_sl_ub_outerpoly,'Trondelag/clipped_las/selbu_sl_ub.las')



# Singsaas ----------------------------------------------------------------

singsaas_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Trondelag/Singsaas.las')
singsaas_las 
plot(singsaas_las)

#singsaas_b

singsaas_b_order<-chull(as.matrix(plotcoords[plotcoords$Name=='Lab',4:5]))
singsaas_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Lab',4:5][singsaas_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
singsaas_b_pl <- Polygons(list(singsaas_b_poly),1)
singsaas_b_sp <- SpatialPolygons(list(singsaas_b_pl))
singsaas_b_polybuf <- gBuffer(singsaas_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_singsaas_b<-data.frame(ID=1)
rownames(df1_singsaas_b)<-'buffer' 
singsaas_b_spdf <- SpatialPolygonsDataFrame(singsaas_b_polybuf,data=df1_singsaas_b,match.ID = TRUE)

singsaas_b_outerpoly<-lasclip(singsaas_las,singsaas_b_spdf)
singsaas_b_outerpoly<-singsaas_b_outerpoly$`1`
plot(singsaas_b_outerpoly)

writeLAS(singsaas_b_outerpoly,'Trondelag/clipped_las/singsaas_b.las')

#singsaas_ub
singsaas_ub_order<-chull(as.matrix(plotcoords[plotcoords$Name=='Laub',4:5]))
singsaas_ub_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Laub',4:5][singsaas_ub_order,]))

singsaas_ub_pl <- Polygons(list(singsaas_ub_poly),1)
singsaas_ub_sp <- SpatialPolygons(list(singsaas_ub_pl))
singsaas_ub_polybuf <- gBuffer(singsaas_ub_sp, width=6)

df1_singsaas_ub<-data.frame(ID=1)
rownames(df1_singsaas_ub)<-'buffer'
singsaas_ub_spdf <- SpatialPolygonsDataFrame(singsaas_ub_polybuf,data=df1_singsaas_ub,match.ID = TRUE)

singsaas_ub_outerpoly<-lasclip(singsaas_las,singsaas_ub_spdf)
singsaas_ub_outerpoly<-singsaas_ub_outerpoly$`1`
plot(singsaas_ub_outerpoly)

writeLAS(singsaas_ub_outerpoly,'Trondelag/clipped_las/singsaas_ub.las')



# Sl_Tydal ----------------------------------------------------------------

sl_tydal_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Trondelag/Sl_Tydal.las')
sl_tydal_las 
plot(sl_tydal_las) #all blue?? - ok when cut into b and ub

#sl_tydal_b

sl_tydal_b_order<-chull(as.matrix(plotcoords[plotcoords$Name=='Seb',4:5]))
sl_tydal_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Seb',4:5][sl_tydal_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
sl_tydal_b_pl <- Polygons(list(sl_tydal_b_poly),1)
sl_tydal_b_sp <- SpatialPolygons(list(sl_tydal_b_pl))
sl_tydal_b_polybuf <- gBuffer(sl_tydal_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_sl_tydal_b<-data.frame(ID=1)
rownames(df1_sl_tydal_b)<-'buffer' 
sl_tydal_b_spdf <- SpatialPolygonsDataFrame(sl_tydal_b_polybuf,data=df1_sl_tydal_b,match.ID = TRUE)

sl_tydal_b_outerpoly<-lasclip(sl_tydal_las,sl_tydal_b_spdf)
sl_tydal_b_outerpoly<-sl_tydal_b_outerpoly$`1`
plot(sl_tydal_b_outerpoly)

writeLAS(sl_tydal_b_outerpoly,'Trondelag/clipped_las/sl_tydal_b.las')

#sl_tydal_ub
sl_tydal_ub_order<-chull(as.matrix(plotcoords[plotcoords$Name=='Seub',4:5]))
sl_tydal_ub_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Seub',4:5][sl_tydal_ub_order,]))

sl_tydal_ub_pl <- Polygons(list(sl_tydal_ub_poly),1)
sl_tydal_ub_sp <- SpatialPolygons(list(sl_tydal_ub_pl))
sl_tydal_ub_polybuf <- gBuffer(sl_tydal_ub_sp, width=6)

df1_sl_tydal_ub<-data.frame(ID=1)
rownames(df1_sl_tydal_ub)<-'buffer'
sl_tydal_ub_spdf <- SpatialPolygonsDataFrame(sl_tydal_ub_polybuf,data=df1_sl_tydal_ub,match.ID = TRUE)

sl_tydal_ub_outerpoly<-lasclip(sl_tydal_las,sl_tydal_ub_spdf)
sl_tydal_ub_outerpoly<-sl_tydal_ub_outerpoly$`1`
plot(sl_tydal_ub_outerpoly)

writeLAS(sl_tydal_ub_outerpoly,'Trondelag/clipped_las/sl_tydal_ub.las')




# Steinkjer 1BBb ----------------------------------------------------------

steinkjer_1BBb_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Trondelag/Steinkjer_1BBb.las')
steinkjer_1BBb_las 
plot(steinkjer_1BBb_las)

#steinkjer_1BBb_b

steinkjer_1BBb_b_order<-chull(as.matrix(plotcoords[plotcoords$Name=='1Bbb',4:5]))
steinkjer_1BBb_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='1Bbb',4:5][steinkjer_1BBb_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
steinkjer_1BBb_b_pl <- Polygons(list(steinkjer_1BBb_b_poly),1)
steinkjer_1BBb_b_sp <- SpatialPolygons(list(steinkjer_1BBb_b_pl))
steinkjer_1BBb_b_polybuf <- gBuffer(steinkjer_1BBb_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_steinkjer_1BBb_b<-data.frame(ID=1)
rownames(df1_steinkjer_1BBb_b)<-'buffer' 
steinkjer_1BBb_b_spdf <- SpatialPolygonsDataFrame(steinkjer_1BBb_b_polybuf,data=df1_steinkjer_1BBb_b,match.ID = TRUE)

steinkjer_1BBb_b_outerpoly<-lasclip(steinkjer_1BBb_las,steinkjer_1BBb_b_spdf)
steinkjer_1BBb_b_outerpoly<-steinkjer_1BBb_b_outerpoly$`1`
plot(steinkjer_1BBb_b_outerpoly)

writeLAS(steinkjer_1BBb_b_outerpoly,'Trondelag/clipped_las/steinkjer_1BBb_b.las')

#steinkjer_1BBb_ub
steinkjer_1BBb_ub_order<-chull(as.matrix(plotcoords[plotcoords$Name=='1Bbub',4:5]))
steinkjer_1BBb_ub_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='1Bbub',4:5][steinkjer_1BBb_ub_order,]))

steinkjer_1BBb_ub_pl <- Polygons(list(steinkjer_1BBb_ub_poly),1)
steinkjer_1BBb_ub_sp <- SpatialPolygons(list(steinkjer_1BBb_ub_pl))
steinkjer_1BBb_ub_polybuf <- gBuffer(steinkjer_1BBb_ub_sp, width=6)

df1_steinkjer_1BBb_ub<-data.frame(ID=1)
rownames(df1_steinkjer_1BBb_ub)<-'buffer'
steinkjer_1BBb_ub_spdf <- SpatialPolygonsDataFrame(steinkjer_1BBb_ub_polybuf,data=df1_steinkjer_1BBb_ub,match.ID = TRUE)

steinkjer_1BBb_ub_outerpoly<-lasclip(steinkjer_1BBb_las,steinkjer_1BBb_ub_spdf)
steinkjer_1BBb_ub_outerpoly<-steinkjer_1BBb_ub_outerpoly$`1`
plot(steinkjer_1BBb_ub_outerpoly)

writeLAS(steinkjer_1BBb_ub_outerpoly,'Trondelag/clipped_las/steinkjer_1BBb_ub.las')

# Steinkjer 2BBb ----------------------------------------------------------

steinkjer_2BBb_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Trondelag/Steinkjer_2BBb.las')
steinkjer_2BBb_las 
plot(steinkjer_2BBb_las)

#steinkjer_2BBb_b

steinkjer_2BBb_b_order<-chull(as.matrix(plotcoords[plotcoords$Name=='2Bbb',4:5]))
steinkjer_2BBb_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='2Bbb',4:5][steinkjer_2BBb_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
steinkjer_2BBb_b_pl <- Polygons(list(steinkjer_2BBb_b_poly),1)
steinkjer_2BBb_b_sp <- SpatialPolygons(list(steinkjer_2BBb_b_pl))
steinkjer_2BBb_b_polybuf <- gBuffer(steinkjer_2BBb_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_steinkjer_2BBb_b<-data.frame(ID=1)
rownames(df1_steinkjer_2BBb_b)<-'buffer' 
steinkjer_2BBb_b_spdf <- SpatialPolygonsDataFrame(steinkjer_2BBb_b_polybuf,data=df1_steinkjer_2BBb_b,match.ID = TRUE)

steinkjer_2BBb_b_outerpoly<-lasclip(steinkjer_2BBb_las,steinkjer_2BBb_b_spdf)
steinkjer_2BBb_b_outerpoly<-steinkjer_2BBb_b_outerpoly$`1`
plot(steinkjer_2BBb_b_outerpoly)

writeLAS(steinkjer_2BBb_b_outerpoly,'Trondelag/clipped_las/steinkjer_2BBb_b.las')

#steinkjer_2BBb_ub
steinkjer_2BBb_ub_order<-chull(as.matrix(plotcoords[plotcoords$Name=='2Bbub',4:5]))
steinkjer_2BBb_ub_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='2Bbub',4:5][steinkjer_2BBb_ub_order,]))

steinkjer_2BBb_ub_pl <- Polygons(list(steinkjer_2BBb_ub_poly),1)
steinkjer_2BBb_ub_sp <- SpatialPolygons(list(steinkjer_2BBb_ub_pl))
steinkjer_2BBb_ub_polybuf <- gBuffer(steinkjer_2BBb_ub_sp, width=6)

df1_steinkjer_2BBb_ub<-data.frame(ID=1)
rownames(df1_steinkjer_2BBb_ub)<-'buffer'
steinkjer_2BBb_ub_spdf <- SpatialPolygonsDataFrame(steinkjer_2BBb_ub_polybuf,data=df1_steinkjer_2BBb_ub,match.ID = TRUE)

steinkjer_2BBb_ub_outerpoly<-lasclip(steinkjer_2BBb_las,steinkjer_2BBb_ub_spdf)
steinkjer_2BBb_ub_outerpoly<-steinkjer_2BBb_ub_outerpoly$`1`
plot(steinkjer_2BBb_ub_outerpoly)

writeLAS(steinkjer_2BBb_ub_outerpoly,'Trondelag/clipped_las/steinkjer_2BBb_ub.las')















# Sub_Namdalseid ----------------------------------------------------------

sub_namdalseid_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Trondelag/Sub_Namdalseid.las')
sub_namdalseid_las 
plot(sub_namdalseid_las)


#sub_namdalseid_b

sub_namdalseid_b_order<-chull(as.matrix(plotcoords[plotcoords$Name=='1Sb',4:5]))
sub_namdalseid_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='1Sb',4:5][sub_namdalseid_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
sub_namdalseid_b_pl <- Polygons(list(sub_namdalseid_b_poly),1)
sub_namdalseid_b_sp <- SpatialPolygons(list(sub_namdalseid_b_pl))
sub_namdalseid_b_polybuf <- gBuffer(sub_namdalseid_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_sub_namdalseid_b<-data.frame(ID=1)
rownames(df1_sub_namdalseid_b)<-'buffer' 
sub_namdalseid_b_spdf <- SpatialPolygonsDataFrame(sub_namdalseid_b_polybuf,data=df1_sub_namdalseid_b,match.ID = TRUE)

sub_namdalseid_b_outerpoly<-lasclip(sub_namdalseid_las,sub_namdalseid_b_spdf)
sub_namdalseid_b_outerpoly<-sub_namdalseid_b_outerpoly$`1`
plot(sub_namdalseid_b_outerpoly)

writeLAS(sub_namdalseid_b_outerpoly,'Trondelag/clipped_las/sub_namdalseid_b.las')

#sub_namdalseid_ub
sub_namdalseid_ub_order<-chull(as.matrix(plotcoords[plotcoords$Name=='1Sub',4:5]))
sub_namdalseid_ub_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='1Sub',4:5][sub_namdalseid_ub_order,]))

sub_namdalseid_ub_pl <- Polygons(list(sub_namdalseid_ub_poly),1)
sub_namdalseid_ub_sp <- SpatialPolygons(list(sub_namdalseid_ub_pl))
sub_namdalseid_ub_polybuf <- gBuffer(sub_namdalseid_ub_sp, width=6)

df1_sub_namdalseid_ub<-data.frame(ID=1)
rownames(df1_sub_namdalseid_ub)<-'buffer'
sub_namdalseid_ub_spdf <- SpatialPolygonsDataFrame(sub_namdalseid_ub_polybuf,data=df1_sub_namdalseid_ub,match.ID = TRUE)

sub_namdalseid_ub_outerpoly<-lasclip(sub_namdalseid_las,sub_namdalseid_ub_spdf)
sub_namdalseid_ub_outerpoly<-sub_namdalseid_ub_outerpoly$`1`
plot(sub_namdalseid_ub_outerpoly)

writeLAS(sub_namdalseid_ub_outerpoly,'Trondelag/clipped_las/sub_namdalseid_ub.las')





# Verdal_1vb -----------------------------------------------------------------
verdal_1vb_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Trondelag/Verdal_1vb.las')
verdal_1vb_las 
plot(verdal_1vb_las)

#verdal_1vb_b

verdal_1vb_b_order<-chull(as.matrix(plotcoords[plotcoords$Name=='1Vbb',4:5]))
verdal_1vb_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='1Vbb',4:5][verdal_1vb_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
verdal_1vb_b_pl <- Polygons(list(verdal_1vb_b_poly),1)
verdal_1vb_b_sp <- SpatialPolygons(list(verdal_1vb_b_pl))
verdal_1vb_b_polybuf <- gBuffer(verdal_1vb_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_verdal_1vb_b<-data.frame(ID=1)
rownames(df1_verdal_1vb_b)<-'buffer' 
verdal_1vb_b_spdf <- SpatialPolygonsDataFrame(verdal_1vb_b_polybuf,data=df1_verdal_1vb_b,match.ID = TRUE)

verdal_1vb_b_outerpoly<-lasclip(verdal_1vb_las,verdal_1vb_b_spdf)
verdal_1vb_b_outerpoly<-verdal_1vb_b_outerpoly$`1`
plot(verdal_1vb_b_outerpoly)

writeLAS(verdal_1vb_b_outerpoly,'Trondelag/clipped_las/verdal_1vb_b.las')

#verdal_1vb_ub
verdal_1vb_ub_order<-chull(as.matrix(plotcoords[plotcoords$Name=='1Vbub',4:5]))
verdal_1vb_ub_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='1Vbub',4:5][verdal_1vb_ub_order,]))

verdal_1vb_ub_pl <- Polygons(list(verdal_1vb_ub_poly),1)
verdal_1vb_ub_sp <- SpatialPolygons(list(verdal_1vb_ub_pl))
verdal_1vb_ub_polybuf <- gBuffer(verdal_1vb_ub_sp, width=6)

df1_verdal_1vb_ub<-data.frame(ID=1)
rownames(df1_verdal_1vb_ub)<-'buffer'
verdal_1vb_ub_spdf <- SpatialPolygonsDataFrame(verdal_1vb_ub_polybuf,data=df1_verdal_1vb_ub,match.ID = TRUE)

verdal_1vb_ub_outerpoly<-lasclip(verdal_1vb_las,verdal_1vb_ub_spdf)
verdal_1vb_ub_outerpoly<-verdal_1vb_ub_outerpoly$`1`
plot(verdal_1vb_ub_outerpoly)

writeLAS(verdal_1vb_ub_outerpoly,'Trondelag/clipped_las/verdal_1vb_ub.las')


# Verdal2 -----------------------------------------------------------------
verdal_2vb_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Trondelag/Verdal_2vb.las')
verdal_2vb_las 
plot(verdal_2vb_las)

#verdal_2vb_b

verdal_2vb_b_order<-chull(as.matrix(plotcoords[plotcoords$Name=='2Vbb',4:5]))
verdal_2vb_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='2Vbb',4:5][verdal_2vb_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
verdal_2vb_b_pl <- Polygons(list(verdal_2vb_b_poly),1)
verdal_2vb_b_sp <- SpatialPolygons(list(verdal_2vb_b_pl))
verdal_2vb_b_polybuf <- gBuffer(verdal_2vb_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_verdal_2vb_b<-data.frame(ID=1)
rownames(df1_verdal_2vb_b)<-'buffer' 
verdal_2vb_b_spdf <- SpatialPolygonsDataFrame(verdal_2vb_b_polybuf,data=df1_verdal_2vb_b,match.ID = TRUE)

verdal_2vb_b_outerpoly<-lasclip(verdal_2vb_las,verdal_2vb_b_spdf)
verdal_2vb_b_outerpoly<-verdal_2vb_b_outerpoly$`1`
plot(verdal_2vb_b_outerpoly)

writeLAS(verdal_2vb_b_outerpoly,'Trondelag/clipped_las/verdal_2vb_b.las')

#verdal_2vb_ub
verdal_2vb_ub_order<-chull(as.matrix(plotcoords[plotcoords$Name=='2Vbub',4:5]))
verdal_2vb_ub_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='2Vbub',4:5][verdal_2vb_ub_order,]))

verdal_2vb_ub_pl <- Polygons(list(verdal_2vb_ub_poly),1)
verdal_2vb_ub_sp <- SpatialPolygons(list(verdal_2vb_ub_pl))
verdal_2vb_ub_polybuf <- gBuffer(verdal_2vb_ub_sp, width=6)

df1_verdal_2vb_ub<-data.frame(ID=1)
rownames(df1_verdal_2vb_ub)<-'buffer'
verdal_2vb_ub_spdf <- SpatialPolygonsDataFrame(verdal_2vb_ub_polybuf,data=df1_verdal_2vb_ub,match.ID = TRUE)

verdal_2vb_ub_outerpoly<-lasclip(verdal_2vb_las,verdal_2vb_ub_spdf)
verdal_2vb_ub_outerpoly<-verdal_2vb_ub_outerpoly$`1`
plot(verdal_2vb_ub_outerpoly)

writeLAS(verdal_2vb_ub_outerpoly,'Trondelag/clipped_las/verdal_2vb_ub.las')









# Telemark ----------------------------------------------------------------


# Drangedal1 --------------------------------------------------------------

drangedal1_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Telemark/Drangedal1.las')
drangedal1_las 
plot(drangedal1_las)

#drangedal1_b

drangedal1_b_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Drangedal 1 B',10:9]))
drangedal1_b_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Drangedal 1 B',10:9][drangedal1_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
drangedal1_b_pl <- Polygons(list(drangedal1_b_poly),1)
drangedal1_b_sp <- SpatialPolygons(list(drangedal1_b_pl))
drangedal1_b_polybuf <- gBuffer(drangedal1_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_drangedal1_b<-data.frame(ID=1)
rownames(df1_drangedal1_b)<-'buffer' 
drangedal1_b_spdf <- SpatialPolygonsDataFrame(drangedal1_b_polybuf,data=df1_drangedal1_b,match.ID = TRUE)

drangedal1_b_outerpoly<-lasclip(drangedal1_las,drangedal1_b_spdf)
drangedal1_b_outerpoly<-drangedal1_b_outerpoly$`1`
plot(drangedal1_b_outerpoly)

writeLAS(drangedal1_b_outerpoly,'Telemark/clipped_las/drangedal1_b.las')

#drangedal1_ub
drangedal1_ub_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Drangedal 1 UB',10:9]))
drangedal1_ub_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Drangedal 1 UB',10:9][drangedal1_ub_order,]))

drangedal1_ub_pl <- Polygons(list(drangedal1_ub_poly),1)
drangedal1_ub_sp <- SpatialPolygons(list(drangedal1_ub_pl))
drangedal1_ub_polybuf <- gBuffer(drangedal1_ub_sp, width=6)

df1_drangedal1_ub<-data.frame(ID=1)
rownames(df1_drangedal1_ub)<-'buffer'
drangedal1_ub_spdf <- SpatialPolygonsDataFrame(drangedal1_ub_polybuf,data=df1_drangedal1_ub,match.ID = TRUE)

drangedal1_ub_outerpoly<-lasclip(drangedal1_las,drangedal1_ub_spdf)
drangedal1_ub_outerpoly<-drangedal1_ub_outerpoly$`1`
plot(drangedal1_ub_outerpoly)

writeLAS(drangedal1_ub_outerpoly,'Telemark/clipped_las/drangedal1_ub.las')


# Drangedal 3 -------------------------------------------------------------
drangedal3_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Telemark/Drangedal2.las') #lagret med annet navn på disk, men vi har ikke noe Drangedal 2 egentlig
drangedal3_las 
plot(drangedal3_las)

#drangedal3_b

drangedal3_b_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Drangedal 3 B',10:9]))
drangedal3_b_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Drangedal 3 B',10:9][drangedal3_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
drangedal3_b_pl <- Polygons(list(drangedal3_b_poly),1)
drangedal3_b_sp <- SpatialPolygons(list(drangedal3_b_pl))
drangedal3_b_polybuf <- gBuffer(drangedal3_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_drangedal3_b<-data.frame(ID=1)
rownames(df1_drangedal3_b)<-'buffer' 
drangedal3_b_spdf <- SpatialPolygonsDataFrame(drangedal3_b_polybuf,data=df1_drangedal3_b,match.ID = TRUE)

drangedal3_b_outerpoly<-lasclip(drangedal3_las,drangedal3_b_spdf)
drangedal3_b_outerpoly<-drangedal3_b_outerpoly$`1`
plot(drangedal3_b_outerpoly)

writeLAS(drangedal3_b_outerpoly,'Telemark/clipped_las/drangedal3_b.las')

#drangedal3_ub
drangedal3_ub_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Drangedal 3 UB',10:9]))
drangedal3_ub_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Drangedal 3 UB',10:9][drangedal3_ub_order,]))

drangedal3_ub_pl <- Polygons(list(drangedal3_ub_poly),1)
drangedal3_ub_sp <- SpatialPolygons(list(drangedal3_ub_pl))
drangedal3_ub_polybuf <- gBuffer(drangedal3_ub_sp, width=6)

df1_drangedal3_ub<-data.frame(ID=1)
rownames(df1_drangedal3_ub)<-'buffer'
drangedal3_ub_spdf <- SpatialPolygonsDataFrame(drangedal3_ub_polybuf,data=df1_drangedal3_ub,match.ID = TRUE)

drangedal3_ub_outerpoly<-lasclip(drangedal3_las,drangedal3_ub_spdf)
drangedal3_ub_outerpoly<-drangedal3_ub_outerpoly$`1`
plot(drangedal3_ub_outerpoly)

writeLAS(drangedal3_ub_outerpoly,'Telemark/clipped_las/drangedal3_ub.las')


# Drangedal4 --------------------------------------------------------------
drangedal4_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Telemark/Drangedal4.las') #lagret med annet navn på disk, men vi har ikke noe Drangedal 2 egentlig
drangedal4_las 
plot(drangedal4_las)

#drangedal4_b

drangedal4_b_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Drangedal 4 B',10:9]))
drangedal4_b_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Drangedal 4 B',10:9][drangedal4_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
drangedal4_b_pl <- Polygons(list(drangedal4_b_poly),1)
drangedal4_b_sp <- SpatialPolygons(list(drangedal4_b_pl))
drangedal4_b_polybuf <- gBuffer(drangedal4_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_drangedal4_b<-data.frame(ID=1)
rownames(df1_drangedal4_b)<-'buffer' 
drangedal4_b_spdf <- SpatialPolygonsDataFrame(drangedal4_b_polybuf,data=df1_drangedal4_b,match.ID = TRUE)

drangedal4_b_outerpoly<-lasclip(drangedal4_las,drangedal4_b_spdf)
drangedal4_b_outerpoly<-drangedal4_b_outerpoly$`1`
plot(drangedal4_b_outerpoly)

writeLAS(drangedal4_b_outerpoly,'Telemark/clipped_las/drangedal4_b.las')

#drangedal4_ub
drangedal4_ub_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Drangedal 4 UB',10:9]))
drangedal4_ub_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Drangedal 4 UB',10:9][drangedal4_ub_order,]))

drangedal4_ub_pl <- Polygons(list(drangedal4_ub_poly),1)
drangedal4_ub_sp <- SpatialPolygons(list(drangedal4_ub_pl))
drangedal4_ub_polybuf <- gBuffer(drangedal4_ub_sp, width=6)

df1_drangedal4_ub<-data.frame(ID=1)
rownames(df1_drangedal4_ub)<-'buffer'
drangedal4_ub_spdf <- SpatialPolygonsDataFrame(drangedal4_ub_polybuf,data=df1_drangedal4_ub,match.ID = TRUE)

drangedal4_ub_outerpoly<-lasclip(drangedal4_las,drangedal4_ub_spdf)
drangedal4_ub_outerpoly<-drangedal4_ub_outerpoly$`1`
plot(drangedal4_ub_outerpoly)

writeLAS(drangedal4_ub_outerpoly,'Telemark/clipped_las/drangedal4_ub.las')


# Fritsoe1 -----------------------------------------------------------------
fritsoe1_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Telemark/Fritsoe1.las')
fritsoe1_las 
plot(fritsoe1_las)

#fritsoe1_b

fritsoe1_b_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Fritzøe 1 B',10:9]))
fritsoe1_b_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Fritzøe 1 B',10:9][fritsoe1_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
fritsoe1_b_pl <- Polygons(list(fritsoe1_b_poly),1)
fritsoe1_b_sp <- SpatialPolygons(list(fritsoe1_b_pl))
fritsoe1_b_polybuf <- gBuffer(fritsoe1_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_fritsoe1_b<-data.frame(ID=1)
rownames(df1_fritsoe1_b)<-'buffer' 
fritsoe1_b_spdf <- SpatialPolygonsDataFrame(fritsoe1_b_polybuf,data=df1_fritsoe1_b,match.ID = TRUE)

fritsoe1_b_outerpoly<-lasclip(fritsoe1_las,fritsoe1_b_spdf)
fritsoe1_b_outerpoly<-fritsoe1_b_outerpoly$`1`
plot(fritsoe1_b_outerpoly)

writeLAS(fritsoe1_b_outerpoly,'Telemark/clipped_las/fritsoe1_b.las')

#fritsoe1_ub
fritsoe1_ub_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Fritzøe 1 UB',10:9]))
fritsoe1_ub_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Fritzøe 1 UB',10:9][fritsoe1_ub_order,]))

fritsoe1_ub_pl <- Polygons(list(fritsoe1_ub_poly),1)
fritsoe1_ub_sp <- SpatialPolygons(list(fritsoe1_ub_pl))
fritsoe1_ub_polybuf <- gBuffer(fritsoe1_ub_sp, width=6)

df1_fritsoe1_ub<-data.frame(ID=1)
rownames(df1_fritsoe1_ub)<-'buffer'
fritsoe1_ub_spdf <- SpatialPolygonsDataFrame(fritsoe1_ub_polybuf,data=df1_fritsoe1_ub,match.ID = TRUE)

fritsoe1_ub_outerpoly<-lasclip(fritsoe1_las,fritsoe1_ub_spdf)
fritsoe1_ub_outerpoly<-fritsoe1_ub_outerpoly$`1`
plot(fritsoe1_ub_outerpoly)

writeLAS(fritsoe1_ub_outerpoly,'Telemark/clipped_las/fritsoe1_ub.las')



# Fritsoe2 ----------------------------------------------------------------

fritsoe2_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Telemark/Fritsoe2.las')
fritsoe2_las 
plot(fritsoe2_las)


#fritsoe2_b

fritsoe2_b_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Fritzøe 2 B',10:9]))
fritsoe2_b_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Fritzøe 2 B',10:9][fritsoe2_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
fritsoe2_b_pl <- Polygons(list(fritsoe2_b_poly),1)
fritsoe2_b_sp <- SpatialPolygons(list(fritsoe2_b_pl))
fritsoe2_b_polybuf <- gBuffer(fritsoe2_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_fritsoe2_b<-data.frame(ID=1)
rownames(df1_fritsoe2_b)<-'buffer' 
fritsoe2_b_spdf <- SpatialPolygonsDataFrame(fritsoe2_b_polybuf,data=df1_fritsoe2_b,match.ID = TRUE)

fritsoe2_b_outerpoly<-lasclip(fritsoe2_las,fritsoe2_b_spdf)
fritsoe2_b_outerpoly<-fritsoe2_b_outerpoly$`1`
plot(fritsoe2_b_outerpoly)

writeLAS(fritsoe2_b_outerpoly,'Telemark/clipped_las/fritsoe2_b.las')

#fritsoe2_ub
fritsoe2_ub_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Fritzøe 2 UB',10:9]))
fritsoe2_ub_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Fritzøe 2 UB',10:9][fritsoe2_ub_order,]))

fritsoe2_ub_pl <- Polygons(list(fritsoe2_ub_poly),1)
fritsoe2_ub_sp <- SpatialPolygons(list(fritsoe2_ub_pl))
fritsoe2_ub_polybuf <- gBuffer(fritsoe2_ub_sp, width=6)

df1_fritsoe2_ub<-data.frame(ID=1)
rownames(df1_fritsoe2_ub)<-'buffer'
fritsoe2_ub_spdf <- SpatialPolygonsDataFrame(fritsoe2_ub_polybuf,data=df1_fritsoe2_ub,match.ID = TRUE)

fritsoe2_ub_outerpoly<-lasclip(fritsoe2_las,fritsoe2_ub_spdf)
fritsoe2_ub_outerpoly<-fritsoe2_ub_outerpoly$`1`
plot(fritsoe2_ub_outerpoly)

writeLAS(fritsoe2_ub_outerpoly,'Telemark/clipped_las/fritsoe2_ub.las')


# Kviteseid1 --------------------------------------------------------------
kviteseid1_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Telemark/Kviteseid1.las') 
kviteseid1_las 
plot(kviteseid1_las)


#kviteseid1_b

kviteseid1_b_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Kviteseid 1 B',10:9]))
kviteseid1_b_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Kviteseid 1 B',10:9][kviteseid1_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
kviteseid1_b_pl <- Polygons(list(kviteseid1_b_poly),1)
kviteseid1_b_sp <- SpatialPolygons(list(kviteseid1_b_pl))
kviteseid1_b_polybuf <- gBuffer(kviteseid1_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_kviteseid1_b<-data.frame(ID=1)
rownames(df1_kviteseid1_b)<-'buffer' 
kviteseid1_b_spdf <- SpatialPolygonsDataFrame(kviteseid1_b_polybuf,data=df1_kviteseid1_b,match.ID = TRUE)

kviteseid1_b_outerpoly<-lasclip(kviteseid1_las,kviteseid1_b_spdf)
kviteseid1_b_outerpoly<-kviteseid1_b_outerpoly$`1`
plot(kviteseid1_b_outerpoly)

writeLAS(kviteseid1_b_outerpoly,'Telemark/clipped_las/kviteseid1_b.las')

#kviteseid1_ub
kviteseid1_ub_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Kviteseid 1 UB',10:9]))
kviteseid1_ub_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Kviteseid 1 UB',10:9][kviteseid1_ub_order,]))

kviteseid1_ub_pl <- Polygons(list(kviteseid1_ub_poly),1)
kviteseid1_ub_sp <- SpatialPolygons(list(kviteseid1_ub_pl))
kviteseid1_ub_polybuf <- gBuffer(kviteseid1_ub_sp, width=6)

df1_kviteseid1_ub<-data.frame(ID=1)
rownames(df1_kviteseid1_ub)<-'buffer'
kviteseid1_ub_spdf <- SpatialPolygonsDataFrame(kviteseid1_ub_polybuf,data=df1_kviteseid1_ub,match.ID = TRUE)

kviteseid1_ub_outerpoly<-lasclip(kviteseid1_las,kviteseid1_ub_spdf)
kviteseid1_ub_outerpoly<-kviteseid1_ub_outerpoly$`1`
plot(kviteseid1_ub_outerpoly)

writeLAS(kviteseid1_ub_outerpoly,'Telemark/clipped_las/kviteseid1_ub.las')


# Kviteseid 2 -------------------------------------------------------------
kviteseid2_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Telemark/Kviteseid2.las') 
kviteseid2_las 
plot(kviteseid2_las)


#kviteseid2_b

kviteseid2_b_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Kviteseid 2 B',10:9]))
kviteseid2_b_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Kviteseid 2 B',10:9][kviteseid2_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
kviteseid2_b_pl <- Polygons(list(kviteseid2_b_poly),1)
kviteseid2_b_sp <- SpatialPolygons(list(kviteseid2_b_pl))
kviteseid2_b_polybuf <- gBuffer(kviteseid2_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_kviteseid2_b<-data.frame(ID=1)
rownames(df1_kviteseid2_b)<-'buffer' 
kviteseid2_b_spdf <- SpatialPolygonsDataFrame(kviteseid2_b_polybuf,data=df1_kviteseid2_b,match.ID = TRUE)

kviteseid2_b_outerpoly<-lasclip(kviteseid2_las,kviteseid2_b_spdf)
kviteseid2_b_outerpoly<-kviteseid2_b_outerpoly$`1`
plot(kviteseid2_b_outerpoly)

writeLAS(kviteseid2_b_outerpoly,'Telemark/clipped_las/kviteseid2_b.las')

#kviteseid2_ub
kviteseid2_ub_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Kviteseid 2 UB',10:9]))
kviteseid2_ub_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Kviteseid 2 UB',10:9][kviteseid2_ub_order,]))

kviteseid2_ub_pl <- Polygons(list(kviteseid2_ub_poly),1)
kviteseid2_ub_sp <- SpatialPolygons(list(kviteseid2_ub_pl))
kviteseid2_ub_polybuf <- gBuffer(kviteseid2_ub_sp, width=6)

df1_kviteseid2_ub<-data.frame(ID=1)
rownames(df1_kviteseid2_ub)<-'buffer'
kviteseid2_ub_spdf <- SpatialPolygonsDataFrame(kviteseid2_ub_polybuf,data=df1_kviteseid2_ub,match.ID = TRUE)

kviteseid2_ub_outerpoly<-lasclip(kviteseid2_las,kviteseid2_ub_spdf)
kviteseid2_ub_outerpoly<-kviteseid2_ub_outerpoly$`1`
plot(kviteseid2_ub_outerpoly)

writeLAS(kviteseid2_ub_outerpoly,'Telemark/clipped_las/kviteseid2_ub.las')



# Kviteseid 3 -------------------------------------------------------------
kviteseid3_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Telemark/Kviteseid3.las') 
kviteseid3_las 
plot(kviteseid3_las)


#kviteseid3_b

kviteseid3_b_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Kviteseid 3 B',10:9]))
kviteseid3_b_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Kviteseid 3 B',10:9][kviteseid3_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
kviteseid3_b_pl <- Polygons(list(kviteseid3_b_poly),1)
kviteseid3_b_sp <- SpatialPolygons(list(kviteseid3_b_pl))
kviteseid3_b_polybuf <- gBuffer(kviteseid3_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_kviteseid3_b<-data.frame(ID=1)
rownames(df1_kviteseid3_b)<-'buffer' 
kviteseid3_b_spdf <- SpatialPolygonsDataFrame(kviteseid3_b_polybuf,data=df1_kviteseid3_b,match.ID = TRUE)

kviteseid3_b_outerpoly<-lasclip(kviteseid3_las,kviteseid3_b_spdf)
kviteseid3_b_outerpoly<-kviteseid3_b_outerpoly$`1`
plot(kviteseid3_b_outerpoly)

writeLAS(kviteseid3_b_outerpoly,'Telemark/clipped_las/kviteseid3_b.las')

#kviteseid3_ub
kviteseid3_ub_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Kviteseid 3 UB',10:9]))
kviteseid3_ub_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Kviteseid 3 UB',10:9][kviteseid3_ub_order,]))

kviteseid3_ub_pl <- Polygons(list(kviteseid3_ub_poly),1)
kviteseid3_ub_sp <- SpatialPolygons(list(kviteseid3_ub_pl))
kviteseid3_ub_polybuf <- gBuffer(kviteseid3_ub_sp, width=6)

df1_kviteseid3_ub<-data.frame(ID=1)
rownames(df1_kviteseid3_ub)<-'buffer'
kviteseid3_ub_spdf <- SpatialPolygonsDataFrame(kviteseid3_ub_polybuf,data=df1_kviteseid3_ub,match.ID = TRUE)

kviteseid3_ub_outerpoly<-lasclip(kviteseid3_las,kviteseid3_ub_spdf)
kviteseid3_ub_outerpoly<-kviteseid3_ub_outerpoly$`1`
plot(kviteseid3_ub_outerpoly)

writeLAS(kviteseid3_ub_outerpoly,'Telemark/clipped_las/kviteseid3_ub.las')


# Nome_Cappelen1 ----------------------------------------------------------

nome_cappelen_1_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Telemark/Nome_Cappelen1.las')
nome_cappelen_1_las 
plot(nome_cappelen_1_las)

#nome_cappelen_1_b

nome_cappelen_1_b_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Cappelen 1 B',10:9]))
nome_cappelen_1_b_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Cappelen 1 B',10:9][nome_cappelen_1_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
nome_cappelen_1_b_pl <- Polygons(list(nome_cappelen_1_b_poly),1)
nome_cappelen_1_b_sp <- SpatialPolygons(list(nome_cappelen_1_b_pl))
nome_cappelen_1_b_polybuf <- gBuffer(nome_cappelen_1_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_nome_cappelen_1_b<-data.frame(ID=1)
rownames(df1_nome_cappelen_1_b)<-'buffer' 
nome_cappelen_1_b_spdf <- SpatialPolygonsDataFrame(nome_cappelen_1_b_polybuf,data=df1_nome_cappelen_1_b,match.ID = TRUE)

nome_cappelen_1_b_outerpoly<-lasclip(nome_cappelen_1_las,nome_cappelen_1_b_spdf)
nome_cappelen_1_b_outerpoly<-nome_cappelen_1_b_outerpoly$`1`
plot(nome_cappelen_1_b_outerpoly)

writeLAS(nome_cappelen_1_b_outerpoly,'Telemark/clipped_las/nome_cappelen_1_b.las')

#nome_cappelen_1_ub
nome_cappelen_1_ub_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Cappelen 1 UB',10:9]))
nome_cappelen_1_ub_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Cappelen 1 UB',10:9][nome_cappelen_1_ub_order,]))

nome_cappelen_1_ub_pl <- Polygons(list(nome_cappelen_1_ub_poly),1)
nome_cappelen_1_ub_sp <- SpatialPolygons(list(nome_cappelen_1_ub_pl))
nome_cappelen_1_ub_polybuf <- gBuffer(nome_cappelen_1_ub_sp, width=6)

df1_nome_cappelen_1_ub<-data.frame(ID=1)
rownames(df1_nome_cappelen_1_ub)<-'buffer'
nome_cappelen_1_ub_spdf <- SpatialPolygonsDataFrame(nome_cappelen_1_ub_polybuf,data=df1_nome_cappelen_1_ub,match.ID = TRUE)

nome_cappelen_1_ub_outerpoly<-lasclip(nome_cappelen_1_las,nome_cappelen_1_ub_spdf)
nome_cappelen_1_ub_outerpoly<-nome_cappelen_1_ub_outerpoly$`1`
plot(nome_cappelen_1_ub_outerpoly)

writeLAS(nome_cappelen_1_ub_outerpoly,'Telemark/clipped_las/nome_cappelen_1_ub.las')



# Nome_Cappelen2 ----------------------------------------------------------

nome_cappelen_2_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Telemark/Nome_Cappelen2.las')
nome_cappelen_2_las 
plot(nome_cappelen_2_las)

#nome_cappelen_2_b

nome_cappelen_2_b_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Cappelen 2 B',10:9]))
nome_cappelen_2_b_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Cappelen 2 B',10:9][nome_cappelen_2_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
nome_cappelen_2_b_pl <- Polygons(list(nome_cappelen_2_b_poly),1)
nome_cappelen_2_b_sp <- SpatialPolygons(list(nome_cappelen_2_b_pl))
nome_cappelen_2_b_polybuf <- gBuffer(nome_cappelen_2_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_nome_cappelen_2_b<-data.frame(ID=1)
rownames(df1_nome_cappelen_2_b)<-'buffer' 
nome_cappelen_2_b_spdf <- SpatialPolygonsDataFrame(nome_cappelen_2_b_polybuf,data=df1_nome_cappelen_2_b,match.ID = TRUE)

nome_cappelen_2_b_outerpoly<-lasclip(nome_cappelen_2_las,nome_cappelen_2_b_spdf)
nome_cappelen_2_b_outerpoly<-nome_cappelen_2_b_outerpoly$`1`
plot(nome_cappelen_2_b_outerpoly)

writeLAS(nome_cappelen_2_b_outerpoly,'Telemark/clipped_las/nome_cappelen_2_b.las')

#nome_cappelen_2_ub
nome_cappelen_2_ub_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Cappelen 2 UB',10:9]))
nome_cappelen_2_ub_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Cappelen 2 UB',10:9][nome_cappelen_2_ub_order,]))

nome_cappelen_2_ub_pl <- Polygons(list(nome_cappelen_2_ub_poly),1)
nome_cappelen_2_ub_sp <- SpatialPolygons(list(nome_cappelen_2_ub_pl))
nome_cappelen_2_ub_polybuf <- gBuffer(nome_cappelen_2_ub_sp, width=6)

df1_nome_cappelen_2_ub<-data.frame(ID=1)
rownames(df1_nome_cappelen_2_ub)<-'buffer'
nome_cappelen_2_ub_spdf <- SpatialPolygonsDataFrame(nome_cappelen_2_ub_polybuf,data=df1_nome_cappelen_2_ub,match.ID = TRUE)

nome_cappelen_2_ub_outerpoly<-lasclip(nome_cappelen_2_las,nome_cappelen_2_ub_spdf)
nome_cappelen_2_ub_outerpoly<-nome_cappelen_2_ub_outerpoly$`1`
plot(nome_cappelen_2_ub_outerpoly)

writeLAS(nome_cappelen_2_ub_outerpoly,'Telemark/clipped_las/nome_cappelen_2_ub.las')






# Notodden3 ---------------------------------------------------------------
notodden3_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Telemark/Notodden3.las')
notodden3_las 
plot(notodden3_las)

#notodden3_b

notodden3_b_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Notodden 3 B',10:9]))
notodden3_b_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Notodden 3 B',10:9][notodden3_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
notodden3_b_pl <- Polygons(list(notodden3_b_poly),1)
notodden3_b_sp <- SpatialPolygons(list(notodden3_b_pl))
notodden3_b_polybuf <- gBuffer(notodden3_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_notodden3_b<-data.frame(ID=1)
rownames(df1_notodden3_b)<-'buffer' 
notodden3_b_spdf <- SpatialPolygonsDataFrame(notodden3_b_polybuf,data=df1_notodden3_b,match.ID = TRUE)

notodden3_b_outerpoly<-lasclip(notodden3_las,notodden3_b_spdf)
notodden3_b_outerpoly<-notodden3_b_outerpoly$`1`
plot(notodden3_b_outerpoly)

writeLAS(notodden3_b_outerpoly,'Telemark/clipped_las/notodden3_b.las')

#notodden3_ub
notodden3_ub_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Notodden 3 UB',10:9]))
notodden3_ub_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Notodden 3 UB',10:9][notodden3_ub_order,]))

notodden3_ub_pl <- Polygons(list(notodden3_ub_poly),1)
notodden3_ub_sp <- SpatialPolygons(list(notodden3_ub_pl))
notodden3_ub_polybuf <- gBuffer(notodden3_ub_sp, width=6)

df1_notodden3_ub<-data.frame(ID=1)
rownames(df1_notodden3_ub)<-'buffer'
notodden3_ub_spdf <- SpatialPolygonsDataFrame(notodden3_ub_polybuf,data=df1_notodden3_ub,match.ID = TRUE)

notodden3_ub_outerpoly<-lasclip(notodden3_las,notodden3_ub_spdf)
notodden3_ub_outerpoly<-notodden3_ub_outerpoly$`1`
plot(notodden3_ub_outerpoly)

writeLAS(notodden3_ub_outerpoly,'Telemark/clipped_las/notodden3_ub.las')

# Notodden5 ---------------------------------------------------------------
notodden5_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Telemark/Notodden5.las')
notodden5_las 
plot(notodden5_las)

#notodden5_b

notodden5_b_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Notodden 5 B',10:9]))
notodden5_b_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Notodden 5 B',10:9][notodden5_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
notodden5_b_pl <- Polygons(list(notodden5_b_poly),1)
notodden5_b_sp <- SpatialPolygons(list(notodden5_b_pl))
notodden5_b_polybuf <- gBuffer(notodden5_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_notodden5_b<-data.frame(ID=1)
rownames(df1_notodden5_b)<-'buffer' 
notodden5_b_spdf <- SpatialPolygonsDataFrame(notodden5_b_polybuf,data=df1_notodden5_b,match.ID = TRUE)

notodden5_b_outerpoly<-lasclip(notodden5_las,notodden5_b_spdf)
notodden5_b_outerpoly<-notodden5_b_outerpoly$`1`
plot(notodden5_b_outerpoly)

writeLAS(notodden5_b_outerpoly,'Telemark/clipped_las/notodden5_b.las')

#notodden5_ub
notodden5_ub_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Notodden 5 UB',10:9]))
notodden5_ub_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Notodden 5 UB',10:9][notodden5_ub_order,]))

notodden5_ub_pl <- Polygons(list(notodden5_ub_poly),1)
notodden5_ub_sp <- SpatialPolygons(list(notodden5_ub_pl))
notodden5_ub_polybuf <- gBuffer(notodden5_ub_sp, width=6)

df1_notodden5_ub<-data.frame(ID=1)
rownames(df1_notodden5_ub)<-'buffer'
notodden5_ub_spdf <- SpatialPolygonsDataFrame(notodden5_ub_polybuf,data=df1_notodden5_ub,match.ID = TRUE)

notodden5_ub_outerpoly<-lasclip(notodden5_las,notodden5_ub_spdf)
notodden5_ub_outerpoly<-notodden5_ub_outerpoly$`1`
plot(notodden5_ub_outerpoly)

writeLAS(notodden5_ub_outerpoly,'Telemark/clipped_las/notodden5_ub.las')

# Notodden6 --------------------------------------------------------------
notodden6_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Telemark/Notodden6.las')
notodden6_las 
plot(notodden6_las)


#notodden6_b

notodden6_b_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Notodden 6 B',10:9]))
notodden6_b_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Notodden 6 B',10:9][notodden6_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
notodden6_b_pl <- Polygons(list(notodden6_b_poly),1)
notodden6_b_sp <- SpatialPolygons(list(notodden6_b_pl))
notodden6_b_polybuf <- gBuffer(notodden6_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_notodden6_b<-data.frame(ID=1)
rownames(df1_notodden6_b)<-'buffer' 
notodden6_b_spdf <- SpatialPolygonsDataFrame(notodden6_b_polybuf,data=df1_notodden6_b,match.ID = TRUE)

notodden6_b_outerpoly<-lasclip(notodden6_las,notodden6_b_spdf)
notodden6_b_outerpoly<-notodden6_b_outerpoly$`1`
plot(notodden6_b_outerpoly)

writeLAS(notodden6_b_outerpoly,'Telemark/clipped_las/notodden6_b.las')

#notodden6_ub
notodden6_ub_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Notodden 6 UB',10:9]))
notodden6_ub_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Notodden 6 UB',10:9][notodden6_ub_order,]))

notodden6_ub_pl <- Polygons(list(notodden6_ub_poly),1)
notodden6_ub_sp <- SpatialPolygons(list(notodden6_ub_pl))
notodden6_ub_polybuf <- gBuffer(notodden6_ub_sp, width=6)

df1_notodden6_ub<-data.frame(ID=1)
rownames(df1_notodden6_ub)<-'buffer'
notodden6_ub_spdf <- SpatialPolygonsDataFrame(notodden6_ub_polybuf,data=df1_notodden6_ub,match.ID = TRUE)

notodden6_ub_outerpoly<-lasclip(notodden6_las,notodden6_ub_spdf)
notodden6_ub_outerpoly<-notodden6_ub_outerpoly$`1`
plot(notodden6_ub_outerpoly)

writeLAS(notodden6_ub_outerpoly,'Telemark/clipped_las/notodden6_ub.las')

# Fyresdal ----------------------------------------------------------------

fyresdal_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Telemark/Furesdal.las') 
fyresdal_las 
plot(fyresdal_las)

#fyresdal_b

fyresdal_b_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Fyresdal 1 B',10:9]))
fyresdal_b_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Fyresdal 1 B',10:9][fyresdal_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
fyresdal_b_pl <- Polygons(list(fyresdal_b_poly),1)
fyresdal_b_sp <- SpatialPolygons(list(fyresdal_b_pl))
fyresdal_b_polybuf <- gBuffer(fyresdal_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_fyresdal_b<-data.frame(ID=1)
rownames(df1_fyresdal_b)<-'buffer' 
fyresdal_b_spdf <- SpatialPolygonsDataFrame(fyresdal_b_polybuf,data=df1_fyresdal_b,match.ID = TRUE)

fyresdal_b_outerpoly<-lasclip(fyresdal_las,fyresdal_b_spdf)
fyresdal_b_outerpoly<-fyresdal_b_outerpoly$`1`
plot(fyresdal_b_outerpoly)

writeLAS(fyresdal_b_outerpoly,'Telemark/clipped_las/fyresdal_b.las')

#fyresdal_ub
fyresdal_ub_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Fyresdal 1 UB',10:9]))
fyresdal_ub_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Fyresdal 1 UB',10:9][fyresdal_ub_order,]))

fyresdal_ub_pl <- Polygons(list(fyresdal_ub_poly),1)
fyresdal_ub_sp <- SpatialPolygons(list(fyresdal_ub_pl))
fyresdal_ub_polybuf <- gBuffer(fyresdal_ub_sp, width=6)

df1_fyresdal_ub<-data.frame(ID=1)
rownames(df1_fyresdal_ub)<-'buffer'
fyresdal_ub_spdf <- SpatialPolygonsDataFrame(fyresdal_ub_polybuf,data=df1_fyresdal_ub,match.ID = TRUE)

fyresdal_ub_outerpoly<-lasclip(fyresdal_las,fyresdal_ub_spdf)
fyresdal_ub_outerpoly<-fyresdal_ub_outerpoly$`1`
plot(fyresdal_ub_outerpoly)

writeLAS(fyresdal_ub_outerpoly,'Telemark/clipped_las/fyresdal_ub.las')






# Hedmark_Akershus --------------------------------------------------------

# Didrik Holmsen ----------------------------------------------------------
didrik_holmsen_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Hedmark_Akershus/Didrik_Holmsen.las') 
didrik_holmsen_las 
plot(didrik_holmsen_las)

#didrik_holmsen_b

didrik_holmsen_b_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='DH2',15:14]))
didrik_holmsen_b_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='DH2',15:14][didrik_holmsen_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
didrik_holmsen_b_pl <- Polygons(list(didrik_holmsen_b_poly),1)
didrik_holmsen_b_sp <- SpatialPolygons(list(didrik_holmsen_b_pl))
didrik_holmsen_b_polybuf <- gBuffer(didrik_holmsen_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_didrik_holmsen_b<-data.frame(ID=1)
rownames(df1_didrik_holmsen_b)<-'buffer' 
didrik_holmsen_b_spdf <- SpatialPolygonsDataFrame(didrik_holmsen_b_polybuf,data=df1_didrik_holmsen_b,match.ID = TRUE)

didrik_holmsen_b_outerpoly<-lasclip(didrik_holmsen_las,didrik_holmsen_b_spdf)
didrik_holmsen_b_outerpoly<-didrik_holmsen_b_outerpoly$`1`
plot(didrik_holmsen_b_outerpoly)

writeLAS(didrik_holmsen_b_outerpoly,'Hedmark_Akershus/clipped_las/didrik_holmsen_b.las')

#didrik_holmsen_ub
didrik_holmsen_ub_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='DH1',15:14]))
didrik_holmsen_ub_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='DH1',15:14][didrik_holmsen_ub_order,]))

didrik_holmsen_ub_pl <- Polygons(list(didrik_holmsen_ub_poly),1)
didrik_holmsen_ub_sp <- SpatialPolygons(list(didrik_holmsen_ub_pl))
didrik_holmsen_ub_polybuf <- gBuffer(didrik_holmsen_ub_sp, width=6)

df1_didrik_holmsen_ub<-data.frame(ID=1)
rownames(df1_didrik_holmsen_ub)<-'buffer'
didrik_holmsen_ub_spdf <- SpatialPolygonsDataFrame(didrik_holmsen_ub_polybuf,data=df1_didrik_holmsen_ub,match.ID = TRUE)

didrik_holmsen_ub_outerpoly<-lasclip(didrik_holmsen_las,didrik_holmsen_ub_spdf)
didrik_holmsen_ub_outerpoly<-didrik_holmsen_ub_outerpoly$`1`
plot(didrik_holmsen_ub_outerpoly)

writeLAS(didrik_holmsen_ub_outerpoly,'Hedmark_Akershus/clipped_las/didrik_holmsen_ub.las')


# Eidskog -----------------------------------------------------------------
eidskog_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Hedmark_Akershus/Eidskog.las') 
eidskog_las 
plot(eidskog_las)

#eidskog_b

eidskog_b_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='STSKN2',15:14]))
eidskog_b_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='STSKN2',15:14][eidskog_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
eidskog_b_pl <- Polygons(list(eidskog_b_poly),1)
eidskog_b_sp <- SpatialPolygons(list(eidskog_b_pl))
eidskog_b_polybuf <- gBuffer(eidskog_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_eidskog_b<-data.frame(ID=1)
rownames(df1_eidskog_b)<-'buffer' 
eidskog_b_spdf <- SpatialPolygonsDataFrame(eidskog_b_polybuf,data=df1_eidskog_b,match.ID = TRUE)

eidskog_b_outerpoly<-lasclip(eidskog_las,eidskog_b_spdf)
eidskog_b_outerpoly<-eidskog_b_outerpoly$`1`
plot(eidskog_b_outerpoly)

writeLAS(eidskog_b_outerpoly,'Hedmark_Akershus/clipped_las/eidskog_b.las')

#eidskog_ub
eidskog_ub_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='STSKN1',15:14]))
eidskog_ub_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='STSKN1',15:14][eidskog_ub_order,]))

eidskog_ub_pl <- Polygons(list(eidskog_ub_poly),1)
eidskog_ub_sp <- SpatialPolygons(list(eidskog_ub_pl))
eidskog_ub_polybuf <- gBuffer(eidskog_ub_sp, width=6)

df1_eidskog_ub<-data.frame(ID=1)
rownames(df1_eidskog_ub)<-'buffer'
eidskog_ub_spdf <- SpatialPolygonsDataFrame(eidskog_ub_polybuf,data=df1_eidskog_ub,match.ID = TRUE)

eidskog_ub_outerpoly<-lasclip(eidskog_las,eidskog_ub_spdf)
eidskog_ub_outerpoly<-eidskog_ub_outerpoly$`1`
plot(eidskog_ub_outerpoly)

writeLAS(eidskog_ub_outerpoly,'Hedmark_Akershus/clipped_las/eidskog_ub.las')


# Fet3 --------------------------------------------------------------------

fet3_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Hedmark_Akershus/Fet3.las') 
fet3_las 
plot(fet3_las) 

#fet3_b

fet3_b_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='FK2',15:14]))
fet3_b_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='FK2',15:14][fet3_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
fet3_b_pl <- Polygons(list(fet3_b_poly),1)
fet3_b_sp <- SpatialPolygons(list(fet3_b_pl))
fet3_b_polybuf <- gBuffer(fet3_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_fet3_b<-data.frame(ID=1)
rownames(df1_fet3_b)<-'buffer' 
fet3_b_spdf <- SpatialPolygonsDataFrame(fet3_b_polybuf,data=df1_fet3_b,match.ID = TRUE)

fet3_b_outerpoly<-lasclip(fet3_las,fet3_b_spdf)
fet3_b_outerpoly<-fet3_b_outerpoly$`1`
plot(fet3_b_outerpoly)

writeLAS(fet3_b_outerpoly,'Hedmark_Akershus/clipped_las/fet3_b.las')

#fet3_ub
fet3_ub_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='FK1',15:14]))
fet3_ub_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='FK1',15:14][fet3_ub_order,]))

fet3_ub_pl <- Polygons(list(fet3_ub_poly),1)
fet3_ub_sp <- SpatialPolygons(list(fet3_ub_pl))
fet3_ub_polybuf <- gBuffer(fet3_ub_sp, width=6)

df1_fet3_ub<-data.frame(ID=1)
rownames(df1_fet3_ub)<-'buffer'
fet3_ub_spdf <- SpatialPolygonsDataFrame(fet3_ub_polybuf,data=df1_fet3_ub,match.ID = TRUE)

fet3_ub_outerpoly<-lasclip(fet3_las,fet3_ub_spdf)
fet3_ub_outerpoly<-fet3_ub_outerpoly$`1`
plot(fet3_ub_outerpoly)

writeLAS(fet3_ub_outerpoly,'Hedmark_Akershus/clipped_las/fet3_ub.las')



# halvard_pramhus ---------------------------------------------------------------

halvard_pramhus_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Hedmark_Akershus/Halvard_Pramhus.las') 
halvard_pramhus_las 
plot(halvard_pramhus_las)

#halvard_pramhus_b

halvard_pramhus_b_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='HP1',15:14]))
halvard_pramhus_b_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='HP1',15:14][halvard_pramhus_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
halvard_pramhus_b_pl <- Polygons(list(halvard_pramhus_b_poly),1)
halvard_pramhus_b_sp <- SpatialPolygons(list(halvard_pramhus_b_pl))
halvard_pramhus_b_polybuf <- gBuffer(halvard_pramhus_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_halvard_pramhus_b<-data.frame(ID=1)
rownames(df1_halvard_pramhus_b)<-'buffer' 
halvard_pramhus_b_spdf <- SpatialPolygonsDataFrame(halvard_pramhus_b_polybuf,data=df1_halvard_pramhus_b,match.ID = TRUE)

halvard_pramhus_b_outerpoly<-lasclip(halvard_pramhus_las,halvard_pramhus_b_spdf)
halvard_pramhus_b_outerpoly<-halvard_pramhus_b_outerpoly$`1`
plot(halvard_pramhus_b_outerpoly) #noen høytliggende punkter, helt blå flate. 20x20 flatene var fine

writeLAS(halvard_pramhus_b_outerpoly,'Hedmark_Akershus/clipped_las/halvard_pramhus_b.las')

#halvard_pramhus_ub
halvard_pramhus_ub_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='HP2',15:14]))
halvard_pramhus_ub_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='HP2',15:14][halvard_pramhus_ub_order,]))

halvard_pramhus_ub_pl <- Polygons(list(halvard_pramhus_ub_poly),1)
halvard_pramhus_ub_sp <- SpatialPolygons(list(halvard_pramhus_ub_pl))
halvard_pramhus_ub_polybuf <- gBuffer(halvard_pramhus_ub_sp, width=6)

df1_halvard_pramhus_ub<-data.frame(ID=1)
rownames(df1_halvard_pramhus_ub)<-'buffer'
halvard_pramhus_ub_spdf <- SpatialPolygonsDataFrame(halvard_pramhus_ub_polybuf,data=df1_halvard_pramhus_ub,match.ID = TRUE)

halvard_pramhus_ub_outerpoly<-lasclip(halvard_pramhus_las,halvard_pramhus_ub_spdf)
halvard_pramhus_ub_outerpoly<-halvard_pramhus_ub_outerpoly$`1`
plot(halvard_pramhus_ub_outerpoly) #helt blå flate. 20x20 flaten var fin

writeLAS(halvard_pramhus_ub_outerpoly,'Hedmark_Akershus/clipped_las/halvard_pramhus_ub.las')



# Stangeskovene Aurskog ---------------------------------------------------

stangeskovene_aurskog_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Hedmark_Akershus/Stangeskovene_Aurskog.las') 
stangeskovene_aurskog_las 
plot(stangeskovene_aurskog_las)


#stangeskovene_aurskog_b
stangeskovene_aurskog_b_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='SSA1',15:14]))
stangeskovene_aurskog_b_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='SSA1',15:14][stangeskovene_aurskog_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
stangeskovene_aurskog_b_pl <- Polygons(list(stangeskovene_aurskog_b_poly),1)
stangeskovene_aurskog_b_sp <- SpatialPolygons(list(stangeskovene_aurskog_b_pl))
stangeskovene_aurskog_b_polybuf <- gBuffer(stangeskovene_aurskog_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_stangeskovene_aurskog_b<-data.frame(ID=1)
rownames(df1_stangeskovene_aurskog_b)<-'buffer' 
stangeskovene_aurskog_b_spdf <- SpatialPolygonsDataFrame(stangeskovene_aurskog_b_polybuf,data=df1_stangeskovene_aurskog_b,match.ID = TRUE)

stangeskovene_aurskog_b_outerpoly<-lasclip(stangeskovene_aurskog_las,stangeskovene_aurskog_b_spdf)
stangeskovene_aurskog_b_outerpoly<-stangeskovene_aurskog_b_outerpoly$`1`
plot(stangeskovene_aurskog_b_outerpoly) 

writeLAS(stangeskovene_aurskog_b_outerpoly,'Hedmark_Akershus/clipped_las/stangeskovene_aurskog_b.las')

#stangeskovene_aurskog_ub
stangeskovene_aurskog_ub_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='SSA2',15:14]))
stangeskovene_aurskog_ub_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='SSA2',15:14][stangeskovene_aurskog_ub_order,]))

stangeskovene_aurskog_ub_pl <- Polygons(list(stangeskovene_aurskog_ub_poly),1)
stangeskovene_aurskog_ub_sp <- SpatialPolygons(list(stangeskovene_aurskog_ub_pl))
stangeskovene_aurskog_ub_polybuf <- gBuffer(stangeskovene_aurskog_ub_sp, width=6)

df1_stangeskovene_aurskog_ub<-data.frame(ID=1)
rownames(df1_stangeskovene_aurskog_ub)<-'buffer'
stangeskovene_aurskog_ub_spdf <- SpatialPolygonsDataFrame(stangeskovene_aurskog_ub_polybuf,data=df1_stangeskovene_aurskog_ub,match.ID = TRUE)

stangeskovene_aurskog_ub_outerpoly<-lasclip(stangeskovene_aurskog_las,stangeskovene_aurskog_ub_spdf)
stangeskovene_aurskog_ub_outerpoly<-stangeskovene_aurskog_ub_outerpoly$`1`
plot(stangeskovene_aurskog_ub_outerpoly) 

writeLAS(stangeskovene_aurskog_ub_outerpoly,'Hedmark_Akershus/clipped_las/stangeskovene_aurskog_ub.las')


# Stangeskovene Eidskog ---------------------------------------------------
stangeskovene_eidskog_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Hedmark_Akershus/Stangeskovene_Eidskog.las') 
stangeskovene_eidskog_las 
plot(stangeskovene_eidskog_las)


#stangeskovene_eidskog_b
stangeskovene_eidskog_b_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='SSB1',15:14]))
stangeskovene_eidskog_b_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='SSB1',15:14][stangeskovene_eidskog_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
stangeskovene_eidskog_b_pl <- Polygons(list(stangeskovene_eidskog_b_poly),1)
stangeskovene_eidskog_b_sp <- SpatialPolygons(list(stangeskovene_eidskog_b_pl))
stangeskovene_eidskog_b_polybuf <- gBuffer(stangeskovene_eidskog_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_stangeskovene_eidskog_b<-data.frame(ID=1)
rownames(df1_stangeskovene_eidskog_b)<-'buffer' 
stangeskovene_eidskog_b_spdf <- SpatialPolygonsDataFrame(stangeskovene_eidskog_b_polybuf,data=df1_stangeskovene_eidskog_b,match.ID = TRUE)

stangeskovene_eidskog_b_outerpoly<-lasclip(stangeskovene_eidskog_las,stangeskovene_eidskog_b_spdf)
stangeskovene_eidskog_b_outerpoly<-stangeskovene_eidskog_b_outerpoly$`1`
plot(stangeskovene_eidskog_b_outerpoly) 

writeLAS(stangeskovene_eidskog_b_outerpoly,'Hedmark_Akershus/clipped_las/stangeskovene_eidskog_b.las')

#stangeskovene_eidskog_ub
stangeskovene_eidskog_ub_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='SSB2',15:14]))
stangeskovene_eidskog_ub_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='SSB2',15:14][stangeskovene_eidskog_ub_order,]))

stangeskovene_eidskog_ub_pl <- Polygons(list(stangeskovene_eidskog_ub_poly),1)
stangeskovene_eidskog_ub_sp <- SpatialPolygons(list(stangeskovene_eidskog_ub_pl))
stangeskovene_eidskog_ub_polybuf <- gBuffer(stangeskovene_eidskog_ub_sp, width=6)

df1_stangeskovene_eidskog_ub<-data.frame(ID=1)
rownames(df1_stangeskovene_eidskog_ub)<-'buffer'
stangeskovene_eidskog_ub_spdf <- SpatialPolygonsDataFrame(stangeskovene_eidskog_ub_polybuf,data=df1_stangeskovene_eidskog_ub,match.ID = TRUE)

stangeskovene_eidskog_ub_outerpoly<-lasclip(stangeskovene_eidskog_las,stangeskovene_eidskog_ub_spdf)
stangeskovene_eidskog_ub_outerpoly<-stangeskovene_eidskog_ub_outerpoly$`1`
plot(stangeskovene_eidskog_ub_outerpoly) 

writeLAS(stangeskovene_eidskog_ub_outerpoly,'Hedmark_Akershus/clipped_las/stangeskovene_eidskog_ub.las')


# Stig Dahlen -------------------------------------------------------------
stig_dahlen_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Hedmark_Akershus/Stig_Dahlen.las') 
stig_dahlen_las 
plot(stig_dahlen_las)


#stig_dahlen_b
stig_dahlen_b_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='SD2',15:14]))
stig_dahlen_b_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='SD2',15:14][stig_dahlen_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
stig_dahlen_b_pl <- Polygons(list(stig_dahlen_b_poly),1)
stig_dahlen_b_sp <- SpatialPolygons(list(stig_dahlen_b_pl))
stig_dahlen_b_polybuf <- gBuffer(stig_dahlen_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_stig_dahlen_b<-data.frame(ID=1)
rownames(df1_stig_dahlen_b)<-'buffer' 
stig_dahlen_b_spdf <- SpatialPolygonsDataFrame(stig_dahlen_b_polybuf,data=df1_stig_dahlen_b,match.ID = TRUE)

stig_dahlen_b_outerpoly<-lasclip(stig_dahlen_las,stig_dahlen_b_spdf)
stig_dahlen_b_outerpoly<-stig_dahlen_b_outerpoly$`1`
plot(stig_dahlen_b_outerpoly) 

writeLAS(stig_dahlen_b_outerpoly,'Hedmark_Akershus/clipped_las/stig_dahlen_b.las')

#stig_dahlen_ub
stig_dahlen_ub_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='SD1',15:14]))
stig_dahlen_ub_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='SD1',15:14][stig_dahlen_ub_order,]))

stig_dahlen_ub_pl <- Polygons(list(stig_dahlen_ub_poly),1)
stig_dahlen_ub_sp <- SpatialPolygons(list(stig_dahlen_ub_pl))
stig_dahlen_ub_polybuf <- gBuffer(stig_dahlen_ub_sp, width=6)

df1_stig_dahlen_ub<-data.frame(ID=1)
rownames(df1_stig_dahlen_ub)<-'buffer'
stig_dahlen_ub_spdf <- SpatialPolygonsDataFrame(stig_dahlen_ub_polybuf,data=df1_stig_dahlen_ub,match.ID = TRUE)

stig_dahlen_ub_outerpoly<-lasclip(stig_dahlen_las,stig_dahlen_ub_spdf)
stig_dahlen_ub_outerpoly<-stig_dahlen_ub_outerpoly$`1`
plot(stig_dahlen_ub_outerpoly) 

writeLAS(stig_dahlen_ub_outerpoly,'Hedmark_Akershus/clipped_las/stig_dahlen_ub.las')

# Truls Holm --------------------------------------------------------------
truls_holm_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Hedmark_Akershus/Truls_Holm.las') 
truls_holm_las 
plot(truls_holm_las)

#truls_holm_b
truls_holm_b_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='TH1',15:14]))
truls_holm_b_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='TH1',15:14][truls_holm_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
truls_holm_b_pl <- Polygons(list(truls_holm_b_poly),1)
truls_holm_b_sp <- SpatialPolygons(list(truls_holm_b_pl))
truls_holm_b_polybuf <- gBuffer(truls_holm_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_truls_holm_b<-data.frame(ID=1)
rownames(df1_truls_holm_b)<-'buffer' 
truls_holm_b_spdf <- SpatialPolygonsDataFrame(truls_holm_b_polybuf,data=df1_truls_holm_b,match.ID = TRUE)

truls_holm_b_outerpoly<-lasclip(truls_holm_las,truls_holm_b_spdf)
truls_holm_b_outerpoly<-truls_holm_b_outerpoly$`1`
plot(truls_holm_b_outerpoly) 

writeLAS(truls_holm_b_outerpoly,'Hedmark_Akershus/clipped_las/truls_holm_b.las')

#truls_holm_ub
truls_holm_ub_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='TH2',15:14]))
truls_holm_ub_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='TH2',15:14][truls_holm_ub_order,]))

truls_holm_ub_pl <- Polygons(list(truls_holm_ub_poly),1)
truls_holm_ub_sp <- SpatialPolygons(list(truls_holm_ub_pl))
truls_holm_ub_polybuf <- gBuffer(truls_holm_ub_sp, width=6)

df1_truls_holm_ub<-data.frame(ID=1)
rownames(df1_truls_holm_ub)<-'buffer'
truls_holm_ub_spdf <- SpatialPolygonsDataFrame(truls_holm_ub_polybuf,data=df1_truls_holm_ub,match.ID = TRUE)

truls_holm_ub_outerpoly<-lasclip(truls_holm_las,truls_holm_ub_spdf)
truls_holm_ub_outerpoly<-truls_holm_ub_outerpoly$`1`
plot(truls_holm_ub_outerpoly) 

writeLAS(truls_holm_ub_outerpoly,'Hedmark_Akershus/clipped_las/truls_holm_ub.las')


################################################################################################
#New sites added Oct 2019###

################################################################################################
# Sørem1 --------------------------------------------------------------
sorem_las <-  readLAS('T:\\vm\\inh\\botanisk\\Bruker\\James\\Ingrid LAS files\\hedmark_new_las_version\\SKB_2013_2p_0_5m\\121\\data\\eksport_193575_121_1.laz') 
sorem_las 
plot(sorem_las)

#sorem_b
sorem_b_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='SK1',15:14]))
sorem_b_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='SK1',15:14][sorem_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
sorem_b_pl <- Polygons(list(sorem_b_poly),1)
sorem_b_sp <- SpatialPolygons(list(sorem_b_pl))
sorem_b_polybuf <- gBuffer(sorem_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_sorem_b<-data.frame(ID=1)
rownames(df1_sorem_b)<-'buffer' 
sorem_b_spdf <- SpatialPolygonsDataFrame(sorem_b_polybuf,data=df1_sorem_b,match.ID = TRUE)

sorem_b_outerpoly<-lasclip(sorem_las,sorem_b_spdf)
sorem_b_outerpoly<-sorem_b_outerpoly$`1`
plot(sorem_b_outerpoly) 

writeLAS(sorem_b_outerpoly,'data/clipped_las/sorem_b.las')

#sorem_ub
sorem_ub_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='SK2',15:14]))
sorem_ub_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='SK2',15:14][sorem_ub_order,]))

sorem_ub_pl <- Polygons(list(sorem_ub_poly),1)
sorem_ub_sp <- SpatialPolygons(list(sorem_ub_pl))
sorem_ub_polybuf <- gBuffer(sorem_ub_sp, width=6)

df1_sorem_ub<-data.frame(ID=1)
rownames(df1_sorem_ub)<-'buffer'
sorem_ub_spdf <- SpatialPolygonsDataFrame(sorem_ub_polybuf,data=df1_sorem_ub,match.ID = TRUE)

sorem_ub_outerpoly<-lasclip(sorem_las,sorem_ub_spdf)
sorem_ub_outerpoly<-sorem_ub_outerpoly$`1`
plot(sorem_ub_outerpoly) 

writeLAS(sorem_ub_outerpoly,'data/clipped_las/sorem_ub.las')


# Nes1 --------------------------------------------------------------
nes1_las <-  readLAS('T:\\vm\\inh\\botanisk\\Bruker\\James\\Ingrid LAS files\\hedmark_new_las_version\\DDB_2019_5p_0_25m\\1097\\data\\eksport_193592_1097_1.laz') 
nes1_las 
plot(nes1_las)

#nes1_b
nes1_b_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='DD2',15:14]))
nes1_b_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='DD2',15:14][nes1_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
nes1_b_pl <- Polygons(list(nes1_b_poly),1)
nes1_b_sp <- SpatialPolygons(list(nes1_b_pl))
nes1_b_polybuf <- gBuffer(nes1_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_nes1_b<-data.frame(ID=1)
rownames(df1_nes1_b)<-'buffer' 
nes1_b_spdf <- SpatialPolygonsDataFrame(nes1_b_polybuf,data=df1_nes1_b,match.ID = TRUE)

nes1_b_outerpoly<-lasclip(nes1_las,nes1_b_spdf)
nes1_b_outerpoly<-nes1_b_outerpoly$`1`
plot(nes1_b_outerpoly) 

writeLAS(nes1_b_outerpoly,'data/clipped_las/nes1_b.las')

#nes1_ub
nes1_ub_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='DD1',15:14]))
nes1_ub_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='DD1',15:14][nes1_ub_order,]))

nes1_ub_pl <- Polygons(list(nes1_ub_poly),1)
nes1_ub_sp <- SpatialPolygons(list(nes1_ub_pl))
nes1_ub_polybuf <- gBuffer(nes1_ub_sp, width=6)

df1_nes1_ub<-data.frame(ID=1)
rownames(df1_nes1_ub)<-'buffer'
nes1_ub_spdf <- SpatialPolygonsDataFrame(nes1_ub_polybuf,data=df1_nes1_ub,match.ID = TRUE)

nes1_ub_outerpoly<-lasclip(nes1_las,nes1_ub_spdf)
nes1_ub_outerpoly<-nes1_ub_outerpoly$`1`
plot(nes1_ub_outerpoly) 

writeLAS(nes1_ub_outerpoly,'data/clipped_las/nes1_ub.las')

# Nes2 --------------------------------------------------------------
nes2_las <-  readLAS('T:\\vm\\inh\\botanisk\\Bruker\\James\\Ingrid LAS files\\hedmark_new_las_version\\OLB_2019_5p_0_25m\\1097\\data\\eksport_193604_1097_1.laz') 
nes2_las 
plot(nes2_las)

#nes2_b
nes2_b_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='OL2',15:14]))
nes2_b_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='OL2',15:14][nes2_b_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
nes2_b_pl <- Polygons(list(nes2_b_poly),1)
nes2_b_sp <- SpatialPolygons(list(nes2_b_pl))
nes2_b_polybuf <- gBuffer(nes2_b_sp, width=6) #buffer: 6 m on each side

#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_nes2_b<-data.frame(ID=1)
rownames(df1_nes2_b)<-'buffer' 
nes2_b_spdf <- SpatialPolygonsDataFrame(nes2_b_polybuf,data=df1_nes2_b,match.ID = TRUE)

nes2_b_outerpoly<-lasclip(nes2_las,nes2_b_spdf)
nes2_b_outerpoly<-nes2_b_outerpoly$`1`
plot(nes2_b_outerpoly) 

writeLAS(nes2_b_outerpoly,'data/clipped_las/nes2_b.las')

#nes2_ub
nes2_ub_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='OL1',15:14]))
nes2_ub_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='OL1',15:14][nes2_ub_order,]))

nes2_ub_pl <- Polygons(list(nes2_ub_poly),1)
nes2_ub_sp <- SpatialPolygons(list(nes2_ub_pl))
nes2_ub_polybuf <- gBuffer(nes2_ub_sp, width=6)

df1_nes2_ub<-data.frame(ID=1)
rownames(df1_nes2_ub)<-'buffer'
nes2_ub_spdf <- SpatialPolygonsDataFrame(nes2_ub_polybuf,data=df1_nes2_ub,match.ID = TRUE)

nes2_ub_outerpoly<-lasclip(nes2_las,nes2_ub_spdf)
nes2_ub_outerpoly<-nes2_ub_outerpoly$`1`
plot(nes2_ub_outerpoly) 

writeLAS(nes2_ub_outerpoly,'data/clipped_las/nes2_ub.las')

