
# Top ---------------------------------------------------------------------

require(lidR)
require(raster)
require(rasterVis)
require(rgeos)

plotcoords<-read.csv('Troendelag_20m_flater_pkt.csv',header=T,sep=';',dec=',')
plotcoords_telemark<-read.csv('Koordinater_20x20_Telemark.csv',header=T,sep=';',dec=',')


# Trondelag ---------------------------------------------------------------


# Bratsberg ---------------------------------------------------------------

bratsberg_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Trondelag/bratsberg.las')
bratsberg_las 
plot(bratsberglas)

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





