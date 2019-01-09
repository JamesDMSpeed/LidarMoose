
# Top ---------------------------------------------------------------------

require(lidR)
require(raster)
require(rasterVis)
require(rgeos)

plotcoords<-read.csv('Troendelag_20m_flater_pkt.csv',header=T,sep=';',dec=',')


# Trondelag ---------------------------------------------------------------




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



