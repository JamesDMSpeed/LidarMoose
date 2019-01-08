#Clipping_script

require(lidR)
require(raster)
require(rasterVis)
require(rgeos)

############TRONDELAG##################################################################
#BRATSBERG
#Import plot coords
plotcoords<-read.csv('Troendelag_20m_flater_pkt.csv',header=T,sep=';',dec=',')
#Import las file
bratsberglas <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Trondelag/bratsberg.las')
bratsberglas 
plot(bratsberglas)

#This function tells the order of the points to make a complete ring
bratsberg_b_order<-chull(as.matrix(plotcoords[plotcoords$Name=='Brb',4:5]))
#This function makes a polygon using the bratsberg_b coordinates, ordered by the convex hull
bratsberg_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Brb',4:5][bratsberg_b_order,]))
#Making the polygon bigger to identify large trees on the edge - 10m

#Expand plot by Xm to include overhanging trees
#Make it a spatial polygon
bbpl<-Polygons(list(bratsberg_b_poly),1)
bbpsp<-SpatialPolygons(list(bbpl))
bratsberg_b_outerpoly<-gBuffer(bbpsp,width=6)

plot(bratsberg_b_outerpoly)


#This one clips the las to the polygon
bratsberg_b_plot<-lasclip(bratsberglas,bratsberg_b_poly)
plot(bratsberg_b_plot)
bratsberg_b_plot

bratsberg_ub_order<-chull(as.matrix(plotcoords[plotcoords$Name=='Brub',4:5]))
bratsberg_ub_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Brub',4:5][bratsberg_ub_order,]))
bratsberg_ub_plot<-lasclip(bratsberglas,bratsberg_ub_poly)
plot(bratsberg_ub_plot)
bratsberg_ub_plot

writeLAS(bratsberg_b_plot,'Trondelag/clipped_las/bratsberg_b.las')
writeLAS(bratsberg_ub_plot,'Trondelag/clipped_las/bratsberg_ub.las')

#############################################################################
#Hi_Tydal

hi_tydal_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Trondelag/Hi_tydal.las')
hi_tydal_las 
plot(hi_tydal_las)


hi_tydal_b_order<-chull(as.matrix(plotcoords[plotcoords$Name=='Hib',4:5]))
hi_tydal_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Hib',4:5][hi_tydal_b_order,]))
hi_tydal_b_cut<-lasclip(hi_tydal_las,hi_tydal_b_poly)
hi_tydal_b_cut
plot(hi_tydal_b_cut)

hi_tydal_ub_order<-chull(as.matrix(plotcoords[plotcoords$Name=='Hiub',4:5]))
hi_tydal_ub_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Hiub',4:5][hi_tydal_ub_order,]))
hi_tydal_ub_cut<-lasclip(hi_tydal_las,hi_tydal_ub_poly)
hi_tydal_ub_cut
plot(hi_tydal_ub_cut)

writeLAS(hi_tydal_b_cut,'Trondelag/clipped_las/hi_tydal_b.las')
writeLAS(hi_tydal_ub_cut,'Trondelag/clipped_las/hi_tydal_ub.las')

####################################################################
#Malvik

malvik_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Trondelag/Malvik.las')
malvik_las 
plot(malvik_las)

malvik_b_order<-chull(as.matrix(plotcoords[plotcoords$Name=='Mab',4:5]))
malvik_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Mab',4:5][malvik_b_order,]))
malvik_b_cut<-lasclip(malvik_las,malvik_b_poly)
malvik_b_cut
plot(malvik_b_cut)

malvik_ub_order<-chull(as.matrix(plotcoords[plotcoords$Name=='Maub',4:5]))
malvik_ub_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Maub',4:5][malvik_ub_order,]))
malvik_ub_cut<-lasclip(malvik_las,malvik_ub_poly)
malvik_ub_cut
plot(malvik_ub_cut)

writeLAS(malvik_b_cut,'Trondelag/clipped_las/malvik_b.las')
writeLAS(malvik_ub_cut,'Trondelag/clipped_las/malvik_ub.las')
##########################################################################
#Namdalseid_1kub

namdalseid_1kub_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Trondelag/namdalseid_1kub.las')
namdalseid_1kub_las 
plot(namdalseid_1kub_las)

namdalseid_1kub_b_order<-chull(as.matrix(plotcoords[plotcoords$Name=='1Kb',4:5]))
namdalseid_1kub_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='1Kb',4:5][namdalseid_1kub_b_order,]))
namdalseid_1kub_b_cut<-lasclip(namdalseid_1kub_las,namdalseid_1kub_b_poly)
namdalseid_1kub_b_cut
plot(namdalseid_1kub_b_cut)

namdalseid_1kub_ub_order<-chull(as.matrix(plotcoords[plotcoords$Name=='1Kub',4:5]))
namdalseid_1kub_ub_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='1Kub',4:5][namdalseid_1kub_ub_order,]))

#Make it a spatial polygon, and then expand polygon to include overhanging trees
namdalseid_1kub_ub_pl <- Polygons(list(namdalseid_1kub_ub_poly),1)
namdalseid_1kub_ub_sp <- SpatialPolygons(list(namdalseid_1kub_ub_pl))
namdalseid_1kub_ub_polybuf <- gBuffer(namdalseid_1kub_ub_sp, width=6)
#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1<-data.frame(ID=1)
rownames(df1)<-'buffer'
namdalseid_1kub_ub_spdf <- SpatialPolygonsDataFrame(namdalseid_1kub_ub_polybuf,data=df1,match.ID = TRUE)
#test <-  (namdalseid_1kub_ub_outerpoly)

namdalseid_1kub_ub_outerpoly<-lasclip(namdalseid_1kub_las,namdalseid_1kub_ub_spdf)
namdalseid_1kub_ub_outerpoly<-namdalseid_1kub_ub_outerpoly$`1`
plot(namdalseid_1kub_ub_outerpoly)


writeLAS(namdalseid_1kub_b_cut,'Trondelag/clipped_las/namdalseid_1kub_b.las')
writeLAS(namdalseid_1kub_ub_outerpoly,'Trondelag/clipped_las/namdalseid_1kub_ub.las')
###################################################################################
#Nsb_Verdal 

nsb_verdal_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Trondelag/Nsb_Verdal.las')
nsb_verdal_las 
plot(nsb_verdal_las)

nsb_verdal_b_order<-chull(as.matrix(plotcoords[plotcoords$Name=='1Nsb',4:5]))
nsb_verdal_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='1Nsb',4:5][nsb_verdal_b_order,]))
nsb_verdal_b_cut<-lasclip(nsb_verdal_las,nsb_verdal_b_poly)
nsb_verdal_b_cut
plot(nsb_verdal_b_cut)

nsb_verdal_ub_order<-chull(as.matrix(plotcoords[plotcoords$Name==' 1Nsub',4:5]))
nsb_verdal_ub_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name==' 1Nsub',4:5][nsb_verdal_ub_order,]))
nsb_verdal_ub_cut<-lasclip(nsb_verdal_las,nsb_verdal_ub_poly)
nsb_verdal_ub_cut
plot(nsb_verdal_ub_cut)

writeLAS(nsb_verdal_b_cut,'Trondelag/clipped_las/nsb_verdal_b.las')
writeLAS(nsb_verdal_ub_cut,'Trondelag/clipped_las/nsb_verdal_ub.las')
###########################################################################
#Selbu_flub
selbu_flub_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Trondelag/Selbu_flub.las')
selbu_flub_las 
plot(selbu_flub_las)

selbu_flub_b_order<-chull(as.matrix(plotcoords[plotcoords$Name=='Flb',4:5]))
selbu_flub_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Flb',4:5][selbu_flub_b_order,]))
selbu_flub_b_cut<-lasclip(selbu_flub_las,selbu_flub_b_poly)
selbu_flub_b_cut
plot(selbu_flub_b_cut)

selbu_flub_ub_order<-chull(as.matrix(plotcoords[plotcoords$Name=='Flub',4:5]))
selbu_flub_ub_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Flub',4:5][selbu_flub_ub_order,]))
selbu_flub_ub_cut<-lasclip(selbu_flub_las,selbu_flub_ub_poly)
selbu_flub_ub_cut
plot(selbu_flub_ub_cut)

writeLAS(selbu_flub_b_cut,'Trondelag/clipped_las/selbu_flub_b.las')
writeLAS(selbu_flub_ub_cut,'Trondelag/clipped_las/selbu_flub_ub.las')
########################################################################################
#Selbu_kl

selbu_kl_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Trondelag/Selbu_kl.las')
selbu_kl_las 
plot(selbu_kl_las)

selbu_kl_b_order<-chull(as.matrix(plotcoords[plotcoords$Name=='Klb',4:5]))
selbu_kl_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Klb',4:5][selbu_kl_b_order,]))
#Make it a spatial polygon, and then expand polygon to include overhanging trees
selbu_kl_b_pl <- Polygons(list(selbu_kl_b_poly),1)
selbu_kl_b_sp <- SpatialPolygons(list(selbu_kl_b_pl))
selbu_kl_b_polybuf <- gBuffer(selbu_kl_b_sp, width=6)
#The polygon is now a spatial polygon, need to make it a SpatialPolygonsDataFrame
df1_klb<-data.frame(ID=1)
rownames(df1_klb)<-'buffer'
selbu_kl_b_spdf <- SpatialPolygonsDataFrame(selbu_kl_b_polybuf,data=df1,match.ID = TRUE)
#test <-  (namdalseid_1kub_ub_outerpoly)

#selbu_kl_b_cut<-lasclip(selbu_kl_las,selbu_kl_b_poly)
#selbu_kl_b_cut
#plot(selbu_kl_b_cut)

selbu_kl_b_outerpoly<-lasclip(selbu_kl_las,selbu_kl_b_spdf)
selbu_kl_b_outerpoly<-selbu_kl_b_outerpoly$`1`
plot(selbu_kl_b_outerpoly)


selbu_kl_ub_order<-chull(as.matrix(plotcoords[plotcoords$Name=='Klub',4:5]))
selbu_kl_ub_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Klub',4:5][selbu_kl_ub_order,]))
selbu_kl_ub_cut<-lasclip(selbu_kl_las,selbu_kl_ub_poly)
selbu_kl_ub_cut
plot(selbu_kl_ub_cut)

writeLAS(selbu_kl_b_outerpoly,'Trondelag/clipped_las/selbu_kl_b.las')
writeLAS(selbu_kl_ub_cut,'Trondelag/clipped_las/selbu_kl_ub.las')
############################################################################
#Selbu_sl

selbu_sl_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Trondelag/Selbu_sl.las')
selbu_sl_las 
plot(selbu_sl_las)

selbu_sl_b_order<-chull(as.matrix(plotcoords[plotcoords$Name=='Slb',4:5]))
selbu_sl_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Slb',4:5][selbu_sl_b_order,]))
selbu_sl_b_cut<-lasclip(selbu_sl_las,selbu_sl_b_poly)
selbu_sl_b_cut
plot(selbu_sl_b_cut)

selbu_sl_ub_order<-chull(as.matrix(plotcoords[plotcoords$Name=='Slub',4:5]))
selbu_sl_ub_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Slub',4:5][selbu_sl_ub_order,]))
selbu_sl_ub_cut<-lasclip(selbu_sl_las,selbu_sl_ub_poly)
selbu_sl_ub_cut
plot(selbu_sl_ub_cut)

writeLAS(selbu_sl_b_cut,'Trondelag/clipped_las/selbu_sl_b.las')
writeLAS(selbu_sl_ub_cut,'Trondelag/clipped_las/selbu_sl_ub.las')
#############################################################################
#Singsaas
singsaas_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Trondelag/Singsaas.las')
singsaas_las 
plot(singsaas_las)

singsaas_b_order<-chull(as.matrix(plotcoords[plotcoords$Name=='Lab',4:5]))
singsaas_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Lab',4:5][singsaas_b_order,]))
singsaas_b_cut<-lasclip(singsaas_las,singsaas_b_poly)
singsaas_b_cut
plot(singsaas_b_cut)

singsaas_ub_order<-chull(as.matrix(plotcoords[plotcoords$Name=='Laub',4:5]))
singsaas_ub_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Laub',4:5][singsaas_ub_order,]))
singsaas_ub_cut<-lasclip(singsaas_las,singsaas_ub_poly)
singsaas_ub_cut
plot(singsaas_ub_cut)

writeLAS(singsaas_b_cut,'Trondelag/clipped_las/singsaas_b.las')
writeLAS(singsaas_ub_cut,'Trondelag/clipped_las/singsaas_ub.las')
#################################################################################
#Sl_Tydal

sl_tydal_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Trondelag/Sl_Tydal.las')
sl_tydal_las 
plot(sl_tydal_las) #all blue??

sl_tydal_b_order<-chull(as.matrix(plotcoords[plotcoords$Name=='Seb',4:5]))
sl_tydal_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Seb',4:5][sl_tydal_b_order,]))
sl_tydal_b_cut<-lasclip(sl_tydal_las,sl_tydal_b_poly)
sl_tydal_b_cut
plot(sl_tydal_b_cut)

sl_tydal_ub_order<-chull(as.matrix(plotcoords[plotcoords$Name=='Seub',4:5]))
sl_tydal_ub_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Seub',4:5][sl_tydal_ub_order,]))
sl_tydal_ub_cut<-lasclip(sl_tydal_las,sl_tydal_ub_poly)
sl_tydal_ub_cut
plot(sl_tydal_ub_cut)

writeLAS(sl_tydal_b_cut,'Trondelag/clipped_las/sl_tydal_b.las')
writeLAS(sl_tydal_ub_cut,'Trondelag/clipped_las/sl_tydal_ub.las')
#######################################################################
#Steinkjer_1BBb

steinkjer_1BBb_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Trondelag/Steinkjer_1BBb.las')
steinkjer_1BBb_las 
plot(steinkjer_1BBb_las)

steinkjer_1BBb_b_order<-chull(as.matrix(plotcoords[plotcoords$Name=='1Bbb',4:5]))
steinkjer_1BBb_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='1Bbb',4:5][steinkjer_1BBb_b_order,]))
steinkjer_1BBb_b_cut<-lasclip(steinkjer_1BBb_las,steinkjer_1BBb_b_poly)
steinkjer_1BBb_b_cut
plot(steinkjer_1BBb_b_cut)

steinkjer_1BBb_ub_order<-chull(as.matrix(plotcoords[plotcoords$Name=='1Bbub',4:5]))
steinkjer_1BBb_ub_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='1Bbub',4:5][steinkjer_1BBb_ub_order,]))
steinkjer_1BBb_ub_cut<-lasclip(steinkjer_1BBb_las,steinkjer_1BBb_ub_poly)
steinkjer_1BBb_ub_cut
plot(steinkjer_1BBb_ub_cut)

writeLAS(steinkjer_1BBb_b_cut,'Trondelag/clipped_las/steinkjer_1BBb_b.las')
writeLAS(steinkjer_1BBb_ub_cut,'Trondelag/clipped_las/steinkjer_1BBb_ub.las')
#########################################################################################################
#Steinkjer_2BBb

steinkjer_2BBb_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Trondelag/Steinkjer_2BBb.las')
steinkjer_2BBb_las 
plot(steinkjer_2BBb_las)

steinkjer_2BBb_b_order<-chull(as.matrix(plotcoords[plotcoords$Name=='2Bbb',4:5]))
steinkjer_2BBb_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='2Bbb',4:5][steinkjer_2BBb_b_order,])) 
steinkjer_2BBb_b_cut<-lasclip(steinkjer_2BBb_las,steinkjer_2BBb_b_poly)
steinkjer_2BBb_b_cut
plot(steinkjer_2BBb_b_cut)

steinkjer_2BBb_ub_order<-chull(as.matrix(plotcoords[plotcoords$Name=='2Bbub',4:5]))
steinkjer_2BBb_ub_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='2Bbub',4:5][steinkjer_2BBb_ub_order,]))
steinkjer_2BBb_ub_cut<-lasclip(steinkjer_2BBb_las,steinkjer_2BBb_ub_poly)
steinkjer_2BBb_ub_cut
plot(steinkjer_2BBb_ub_cut)

writeLAS(steinkjer_2BBb_b_cut,'Trondelag/clipped_las/steinkjer_2BBb_b.las')
writeLAS(steinkjer_2BBb_ub_cut,'Trondelag/clipped_las/steinkjer_2BBb_ub.las')
##########################################################################################
# Sub_Namdalseid
sub_namdalseid_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Trondelag/Sub_Namdalseid.las')
sub_namdalseid_las 
plot(sub_namdalseid_las)

sub_namdalseid_b_order<-chull(as.matrix(plotcoords[plotcoords$Name=='1Sb',4:5]))
sub_namdalseid_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='1Sb',4:5][sub_namdalseid_b_order,]))
sub_namdalseid_b_cut<-lasclip(sub_namdalseid_las,sub_namdalseid_b_poly)
sub_namdalseid_b_cut
plot(sub_namdalseid_b_cut)

sub_namdalseid_ub_order<-chull(as.matrix(plotcoords[plotcoords$Name=='1Sub',4:5]))
sub_namdalseid_ub_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='1Sub',4:5][sub_namdalseid_ub_order,]))
sub_namdalseid_ub_cut<-lasclip(sub_namdalseid_las,sub_namdalseid_ub_poly)
sub_namdalseid_ub_cut
plot(sub_namdalseid_ub_cut)

writeLAS(sub_namdalseid_b_cut,'Trondelag/clipped_las/sub_namdalseid_b.las')
writeLAS(sub_namdalseid_ub_cut,'Trondelag/clipped_las/sub_namdalseid_ub.las')
########################################################################################
#Verdal_1vb
verdal_1vb_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Trondelag/Verdal_1vb.las')
verdal_1vb_las 
plot(verdal_1vb_las)

verdal_1vb_b_order<-chull(as.matrix(plotcoords[plotcoords$Name=='1Vbb',4:5]))
verdal_1vb_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='1Vbb',4:5][verdal_1vb_b_order,]))
verdal_1vb_b_cut<-lasclip(verdal_1vb_las,verdal_1vb_b_poly)
verdal_1vb_b_cut
plot(verdal_1vb_b_cut)

verdal_1vb_ub_order<-chull(as.matrix(plotcoords[plotcoords$Name=='1Vbub',4:5]))
verdal_1vb_ub_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='1Vbub',4:5][verdal_1vb_ub_order,]))
verdal_1vb_ub_cut<-lasclip(verdal_1vb_las,verdal_1vb_ub_poly)
verdal_1vb_ub_cut
plot(verdal_1vb_ub_cut)

writeLAS(verdal_1vb_b_cut,'Trondelag/clipped_las/verdal_1vb_b.las')
writeLAS(verdal_1vb_ub_cut,'Trondelag/clipped_las/verdal_1vb_ub.las')

#########################################################################################
#Verdal_2vb
verdal_2vb_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Trondelag/Verdal_2vb.las')
verdal_2vb_las 
plot(verdal_2vb_las)

verdal_2vb_b_order<-chull(as.matrix(plotcoords[plotcoords$Name=='2Vbb',4:5]))
verdal_2vb_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='2Vbb',4:5][verdal_2vb_b_order,]))
verdal_2vb_b_cut<-lasclip(verdal_2vb_las,verdal_2vb_b_poly)
verdal_2vb_b_cut
plot(verdal_2vb_b_cut)

verdal_2vb_ub_order<-chull(as.matrix(plotcoords[plotcoords$Name=='2Vbub',4:5]))
verdal_2vb_ub_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='2Vbub',4:5][verdal_2vb_ub_order,]))
verdal_2vb_ub_cut<-lasclip(verdal_2vb_las,verdal_2vb_ub_poly)
verdal_2vb_ub_cut
plot(verdal_2vb_ub_cut)

writeLAS(verdal_2vb_b_cut,'Trondelag/clipped_las/verdal_2vb_b.las')
writeLAS(verdal_2vb_ub_cut,'Trondelag/clipped_las/verdal_2vb_ub.las')


##############################TELEMARK#################################################################

#Import plot coords
plotcoords_telemark<-read.csv('Koordinater_20x20_Telemark.csv',header=T,sep=';',dec=',')

#Fritsoe1
fritsoe1_1FR_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Telemark/Fritsoe1.las')
fritsoe1_1FR_las 
plot(fritsoe1_1FR_las)

fritsoel_1FR_b_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Fritzøe 1 B',10:9]))
fritsoel_1FR_b_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Fritzøe 1 B',10:9][fritsoel_1FR_b_order,]))
fritsoel_1FR_b_cut<-lasclip(fritsoe1_1FR_las,fritsoel_1FR_b_poly)
fritsoel_1FR_b_cut
plot(fritsoel_1FR_b_cut)

fritsoel_1FR_ub_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Fritzøe 1 UB',10:9]))
fritsoel_1FR_ub_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Fritzøe 1 UB',10:9][fritsoel_1FR_ub_order,]))
fritsoel_1FR_ub_cut<-lasclip(fritsoe1_1FR_las,fritsoel_1FR_ub_poly)
fritsoel_1FR_ub_cut
plot(fritsoel_1FR_ub_cut)

writeLAS(fritsoel_1FR_b_cut,'Telemark/clipped_las/fritsoel_1FR_b.las')
writeLAS(fritsoel_1FR_ub_cut,'Telemark/clipped_las/fritsoel_1FR_ub.las')
######################################################################################

#Fritsoe2
fritsoe2_2FR_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Telemark/Fritsoe2.las')
fritsoe2_2FR_las 
plot(fritsoe2_2FR_las)

fritsoe2_2FR_b_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Fritzøe 2 B',10:9]))
fritsoe2_2FR_b_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Fritzøe 2 B',10:9][fritsoe2_2FR_b_order,]))
fritsoe2_2FR_b_cut<-lasclip(fritsoe2_2FR_las,fritsoe2_2FR_b_poly)
fritsoe2_2FR_b_cut
plot(fritsoe2_2FR_b_cut)

fritsoe2_2FR_ub_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Fritzøe 2 UB',10:9]))
fritsoe2_2FR_ub_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Fritzøe 2 UB',10:9][fritsoe2_2FR_ub_order,]))
fritsoe2_2FR_ub_cut<-lasclip(fritsoe2_2FR_las,fritsoe2_2FR_ub_poly)
fritsoe2_2FR_ub_cut
plot(fritsoe2_2FR_ub_cut)

writeLAS(fritsoe2_2FR_b_cut,'Telemark/clipped_las/fritsoe2_2FR_b.las')
writeLAS(fritsoe2_2FR_ub_cut,'Telemark/clipped_las/fritsoe2_2FR_ub.las')
##############################################################################

#Nome_Cappelen_1 
nome_cappelen_1_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Telemark/Nome_Cappelen1.las')
nome_cappelen_1_las 
plot(nome_cappelen_1_las)

nome_cappelen_1_b_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Cappelen 1 B',10:9]))
nome_cappelen_1_b_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Cappelen 1 B',10:9][nome_cappelen_1_b_order,]))
nome_cappelen_1_b_cut<-lasclip(nome_cappelen_1_las,nome_cappelen_1_b_poly)
nome_cappelen_1_b_cut
plot(nome_cappelen_1_b_cut)

nome_cappelen_1_ub_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Cappelen 1 UB',10:9]))
nome_cappelen_1_ub_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Cappelen 1 UB',10:9][nome_cappelen_1_ub_order,]))
nome_cappelen_1_ub_cut<-lasclip(nome_cappelen_1_las,nome_cappelen_1_ub_poly)
nome_cappelen_1_ub_cut
plot(nome_cappelen_1_ub_cut)

writeLAS(nome_cappelen_1_b_cut,'Telemark/clipped_las/nome_cappelen_1_b.las')
writeLAS(nome_cappelen_1_ub_cut,'Telemark/clipped_las/nome_cappelen_1_ub.las')
#####################################################################################################################

#Notodden 1 Something wrong with the las file

#notodden1_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Telemark/Notodden1_new.las')
#notodden1_las 
#plot(notodden1_las)

#notodden1_las@data$Z[notodden1_las@data$Z<300]<-NA
#notodden1_las@data$Z[notodden1_las@data$Z>600]<-NA

#notodden1_b_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Notodden 1 B',10:9]))
#notodden1_b_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Notodden 1 B',10:9][notodden1_b_order,]))
#notodden1_b_cut<-lasclip(notodden1_las,notodden1_b_poly)
#notodden1_b_cut
#plot(notodden1_b_cut)

#notodden1_ub_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Notodden 1 UB',10:9]))
#notodden1_ub_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Notodden 1 UB',10:9][notodden1_ub_order,]))
#notodden1_ub_cut<-lasclip(notodden1_las,notodden1_ub_poly)
#notodden1_ub_cut
#plot(notodden1_ub_cut)

#writeLAS(notodden1_b_cut,'Telemark/clipped_las/notodden1_b.las')
#writeLAS(notodden1_ub_cut,'Telemark/clipped_las/notodden1_ub.las')
#########################################################################################################

#Notodden3
notodden3_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Telemark/Notodden3.las')
notodden3_las 
plot(notodden3_las)

notodden3_b_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Notodden 3 B',10:9]))
notodden3_b_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Notodden 3 B',10:9][notodden3_b_order,]))
notodden3_b_cut<-lasclip(notodden3_las,notodden3_b_poly)
notodden3_b_cut
plot(notodden3_b_cut)

notodden3_ub_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Notodden 3 UB',10:9]))
notodden3_ub_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Notodden 3 UB',10:9][notodden3_ub_order,]))
notodden3_ub_cut<-lasclip(notodden3_las,notodden3_ub_poly)
notodden3_ub_cut
plot(notodden3_ub_cut)

writeLAS(notodden3_b_cut,'Telemark/clipped_las/notodden3_b.las')
writeLAS(notodden3_ub_cut,'Telemark/clipped_las/notodden3_ub.las')
############################################################################################

#Notodden 4
#notodden4_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Telemark/Notodden4_new.las')
#notodden4_las 
#plot(notodden4_las) #helt blått,med noen røde prikker høyt oppe

#notodden4_b_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Notodden 4 B',10:9]))
#notodden4_b_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Notodden 4 B',10:9][notodden4_b_order,]))
#notodden4_b_cut<-lasclip(notodden4_las,notodden4_b_poly)
#notodden4_b_cut
#plot(notodden4_b_cut)#ser normal ut, normalt areal

#notodden4_ub_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Notodden 4 UB',10:9]))
#notodden4_ub_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Notodden 4 UB',10:9][notodden4_ub_order,]))
#notodden4_ub_cut<-lasclip(notodden4_las,notodden4_ub_poly)
#notodden4_ub_cut
#plot(notodden4_ub_cut) #areal 182m^2?

#writeLAS(notodden4_b_cut,'Telemark/clipped_las/notodden4_b.las')
#writeLAS(notodden4_ub_cut,'Telemark/clipped_las/notodden4_ub.las')
###############################################################################################

#Notodden 5
notodden5_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Telemark/Notodden5.las')
notodden5_las 
plot(notodden5_las)

notodden5_b_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Notodden 5 B',10:9]))
notodden5_b_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Notodden 5 B',10:9][notodden5_b_order,]))
notodden5_b_cut<-lasclip(notodden5_las,notodden5_b_poly)
notodden5_b_cut
plot(notodden5_b_cut)

notodden5_ub_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Notodden 5 UB',10:9]))
notodden5_ub_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Notodden 5 UB',10:9][notodden5_ub_order,]))
notodden5_ub_cut<-lasclip(notodden5_las,notodden5_ub_poly)
notodden5_ub_cut
plot(notodden5_ub_cut)

writeLAS(notodden5_b_cut,'Telemark/clipped_las/notodden5_b.las')
writeLAS(notodden5_ub_cut,'Telemark/clipped_las/notodden5_ub.las')
####################################################################################

#Notodden 6
notodden6_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Telemark/Notodden6.las')
notodden6_las 
plot(notodden6_las)

notodden6_b_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Notodden 6 B',10:9]))
notodden6_b_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Notodden 6 B',10:9][notodden6_b_order,]))
notodden6_b_cut<-lasclip(notodden6_las,notodden6_b_poly)
notodden6_b_cut
plot(notodden6_b_cut)

notodden6_ub_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Notodden 6 UB',10:9]))
notodden6_ub_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Notodden 6 UB',10:9][notodden6_ub_order,]))
notodden6_ub_cut<-lasclip(notodden6_las,notodden6_ub_poly)
notodden6_ub_cut
plot(notodden6_ub_cut)

writeLAS(notodden6_b_cut,'Telemark/clipped_las/notodden6_b.las')
writeLAS(notodden6_ub_cut,'Telemark/clipped_las/notodden6_ub.las')
##################################################################################

#Drangedal1
drangedal1_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Telemark/Drangedal1.las')
drangedal1_las 
plot(drangedal1_las)

drangedal1_b_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Drangedal 1 B',10:9]))
drangedal1_b_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Drangedal 1 B',10:9][drangedal1_b_order,]))
drangedal1_b_cut<-lasclip(drangedal1_las,drangedal1_b_poly)
drangedal1_b_cut
plot(drangedal1_b_cut)

drangedal1_ub_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Drangedal 1 UB',10:9]))
drangedal1_ub_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Drangedal 1 UB',10:9][drangedal1_ub_order,]))
drangedal1_ub_cut<-lasclip(drangedal1_las,drangedal1_ub_poly)
drangedal1_ub_cut
plot(drangedal1_ub_cut)

writeLAS(drangedal1_b_cut,'Telemark/clipped_las/drangedal1_b.las')
writeLAS(drangedal1_ub_cut,'Telemark/clipped_las/drangedal1_ub.las')
#####################################################################################

#Drangedal 3
drangedal3_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Telemark/Drangedal2.las') #lagret med annet navn på disk, men vi har ikke noe Drangedal 2 egentlig
drangedal3_las 
plot(drangedal3_las)

drangedal3_b_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Drangedal 3 B',10:9]))
drangedal3_b_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Drangedal 3 B',10:9][drangedal3_b_order,]))
drangedal3_b_cut<-lasclip(drangedal3_las,drangedal3_b_poly)
drangedal3_b_cut
plot(drangedal3_b_cut)

drangedal3_ub_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Drangedal 3 UB',10:9]))
drangedal3_ub_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Drangedal 3 UB',10:9][drangedal3_ub_order,]))
drangedal3_ub_cut<-lasclip(drangedal3_las,drangedal3_ub_poly)
drangedal3_ub_cut
plot(drangedal3_ub_cut)

writeLAS(drangedal3_b_cut,'Telemark/clipped_las/drangedal3_b.las')
writeLAS(drangedal3_ub_cut,'Telemark/clipped_las/drangedal3_ub.las')
############################################################################################

#Drangedal 4
drangedal4_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Telemark/Drangedal4.las') #lagret med annet navn på disk, men vi har ikke noe Drangedal 2 egentlig
drangedal4_las 
plot(drangedal4_las)

drangedal4_b_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Drangedal 4 B',10:9]))
drangedal4_b_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Drangedal 4 B',10:9][drangedal4_b_order,]))
drangedal4_b_cut<-lasclip(drangedal4_las,drangedal4_b_poly)
drangedal4_b_cut
plot(drangedal4_b_cut)

drangedal4_ub_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Drangedal 4 UB',10:9]))
drangedal4_ub_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Drangedal 4 UB',10:9][drangedal4_ub_order,]))
drangedal4_ub_cut<-lasclip(drangedal4_las,drangedal4_ub_poly)
drangedal4_ub_cut
plot(drangedal4_ub_cut)

writeLAS(drangedal4_b_cut,'Telemark/clipped_las/drangedal4_b.las')
writeLAS(drangedal4_ub_cut,'Telemark/clipped_las/drangedal4_ub.las')
############################################################################################
#Nome_Cappelen_2 
nome_cappelen_2_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Telemark/Nome_Cappelen2.las')
nome_cappelen_2_las 
plot(nome_cappelen_2_las)

nome_cappelen_2_b_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Cappelen 2 B',10:9]))
nome_cappelen_2_b_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Cappelen 2 B',10:9][nome_cappelen_2_b_order,]))
nome_cappelen_2_b_cut<-lasclip(nome_cappelen_2_las,nome_cappelen_2_b_poly)
nome_cappelen_2_b_cut
plot(nome_cappelen_2_b_cut)

nome_cappelen_2_ub_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Cappelen 2 UB',10:9]))
nome_cappelen_2_ub_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Cappelen 2 UB',10:9][nome_cappelen_2_ub_order,]))
nome_cappelen_2_ub_cut<-lasclip(nome_cappelen_2_las,nome_cappelen_2_ub_poly)
nome_cappelen_2_ub_cut
plot(nome_cappelen_2_ub_cut)

writeLAS(nome_cappelen_2_b_cut,'Telemark/clipped_las/nome_cappelen_2_b.las')
writeLAS(nome_cappelen_2_ub_cut,'Telemark/clipped_las/nome_cappelen_2_ub.las')
###########################################################################################
#Kviteseid1
kviteseid1_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Telemark/Kviteseid1.las') 
kviteseid1_las 
plot(kviteseid1_las)

kviteseid1_b_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Kviteseid 1 B',10:9]))
kviteseid1_b_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Kviteseid 1 B',10:9][kviteseid1_b_order,]))
kviteseid1_b_cut<-lasclip(kviteseid1_las,kviteseid1_b_poly)
kviteseid1_b_cut
plot(kviteseid1_b_cut)

kviteseid1_ub_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Kviteseid 1 UB',10:9]))
kviteseid1_ub_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Kviteseid 1 UB',10:9][kviteseid1_ub_order,]))
kviteseid1_ub_cut<-lasclip(kviteseid1_las,kviteseid1_ub_poly)
kviteseid1_ub_cut
plot(kviteseid1_ub_cut)

writeLAS(kviteseid1_b_cut,'Telemark/clipped_las/kviteseid1_b.las')
writeLAS(kviteseid1_ub_cut,'Telemark/clipped_las/kviteseid1_ub.las')
#####################################################################################

#Kviteseid2
kviteseid2_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Telemark/Kviteseid2.las') 
kviteseid2_las 
plot(kviteseid2_las)

kviteseid2_b_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Kviteseid 2 B',10:9]))
kviteseid2_b_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Kviteseid 2 B',10:9][kviteseid2_b_order,]))
kviteseid2_b_cut<-lasclip(kviteseid2_las,kviteseid2_b_poly)
kviteseid2_b_cut
plot(kviteseid2_b_cut)

kviteseid2_ub_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Kviteseid 2 UB',10:9]))
kviteseid2_ub_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Kviteseid 2 UB',10:9][kviteseid2_ub_order,]))
kviteseid2_ub_cut<-lasclip(kviteseid2_las,kviteseid2_ub_poly)
kviteseid2_ub_cut
plot(kviteseid2_ub_cut)

writeLAS(kviteseid2_b_cut,'Telemark/clipped_las/kviteseid2_b.las')
writeLAS(kviteseid2_ub_cut,'Telemark/clipped_las/kviteseid2_ub.las')
#####################################################################################

#Kviteseid3
kviteseid3_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Telemark/Kviteseid3.las') 
kviteseid3_las 
plot(kviteseid3_las)

kviteseid3_b_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Kviteseid 3 B',10:9]))
kviteseid3_b_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Kviteseid 3 B',10:9][kviteseid3_b_order,]))
kviteseid3_b_cut<-lasclip(kviteseid3_las,kviteseid3_b_poly)
kviteseid3_b_cut
plot(kviteseid3_b_cut)

kviteseid3_ub_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Kviteseid 3 UB',10:9]))
kviteseid3_ub_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Kviteseid 3 UB',10:9][kviteseid3_ub_order,]))
kviteseid3_ub_cut<-lasclip(kviteseid3_las,kviteseid3_ub_poly)
kviteseid3_ub_cut
plot(kviteseid3_ub_cut)

writeLAS(kviteseid3_b_cut,'Telemark/clipped_las/kviteseid3_b.las')
writeLAS(kviteseid3_ub_cut,'Telemark/clipped_las/kviteseid3_ub.las')
########################################################################################

#Furesdal
Furesdal_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Telemark/Furesdal.las') 
Furesdal_las 
plot(Furesdal_las)

Furesdal_b_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Fyresdal 1 B',10:9]))
Furesdal_b_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Fyresdal 1 B',10:9][Furesdal_b_order,]))
Furesdal_b_cut<-lasclip(Furesdal_las,Furesdal_b_poly)
Furesdal_b_cut
plot(Furesdal_b_cut)

Furesdal_ub_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Fyresdal 1 UB',10:9]))
Furesdal_ub_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Fyresdal 1 UB',10:9][Furesdal_ub_order,]))
Furesdal_ub_cut<-lasclip(Furesdal_las,Furesdal_ub_poly)
Furesdal_ub_cut
plot(Furesdal_ub_cut)

writeLAS(Furesdal_b_cut,'Telemark/clipped_las/Furesdal_b.las')
writeLAS(Furesdal_ub_cut,'Telemark/clipped_las/Furesdal_ub.las')


#########################HEDMARK_AKERSHUS#############################################################
#Import plot coords
plotcoords_hedmark_akershus<-read.csv('Koordinater_20x20_Hedmark_Akershus.csv',header=T,sep=';',dec=',')

#Didrik Holmsen
didrik_holmsen_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Hedmark_Akershus/Didrik_Holmsen.las') 
didrik_holmsen_las 
plot(didrik_holmsen_las)

didrik_holmsen_b_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='DH2',15:14]))
didrik_holmsen_b_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='DH2',15:14][didrik_holmsen_b_order,]))
didrik_holmsen_b_cut<-lasclip(didrik_holmsen_las,didrik_holmsen_b_poly)
didrik_holmsen_b_cut
plot(didrik_holmsen_b_cut)

didrik_holmsen_ub_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='DH1',15:14]))
didrik_holmsen_ub_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='DH1',15:14][didrik_holmsen_ub_order,]))
didrik_holmsen_ub_cut<-lasclip(didrik_holmsen_las,didrik_holmsen_ub_poly)
didrik_holmsen_ub_cut
plot(didrik_holmsen_ub_cut)

writeLAS(didrik_holmsen_b_cut,'Hedmark_Akershus/clipped_las/didrik_holmsen_b.las')
writeLAS(didrik_holmsen_ub_cut,'Hedmark_Akershus/clipped_las/didrik_holmsen_ub.las')
######################################################################################################

# Stangeskovene Aurskog
stangeskovene_aurskog_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Hedmark_Akershus/Stangeskovene_Aurskog.las') 
stangeskovene_aurskog_las 
plot(stangeskovene_aurskog_las)

stangeskovene_aurskog_b_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='SSA1',15:14]))
stangeskovene_aurskog_b_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='SSA1',15:14][stangeskovene_aurskog_b_order,]))
stangeskovene_aurskog_b_cut<-lasclip(stangeskovene_aurskog_las,stangeskovene_aurskog_b_poly)
stangeskovene_aurskog_b_cut
plot(stangeskovene_aurskog_b_cut)

stangeskovene_aurskog_ub_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='SSA2',15:14]))
stangeskovene_aurskog_ub_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='SSA2',15:14][stangeskovene_aurskog_ub_order,]))
stangeskovene_aurskog_ub_cut<-lasclip(stangeskovene_aurskog_las,stangeskovene_aurskog_ub_poly)
stangeskovene_aurskog_ub_cut
plot(stangeskovene_aurskog_ub_cut)

writeLAS(stangeskovene_aurskog_b_cut,'Hedmark_Akershus/clipped_las/stangeskovene_aurskog_b.las')
writeLAS(stangeskovene_aurskog_ub_cut,'Hedmark_Akershus/clipped_las/stangeskovene_aurskog_ub.las')
#######################################################################################################

#Stig Dæhlen
stig_dahlen_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Hedmark_Akershus/Stig_Dahlen.las') 
stig_dahlen_las 
plot(stig_dahlen_las)

stig_dahlen_b_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='SD2',15:14]))
stig_dahlen_b_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='SD2',15:14][stig_dahlen_b_order,]))
stig_dahlen_b_cut<-lasclip(stig_dahlen_las,stig_dahlen_b_poly)
stig_dahlen_b_cut
plot(stig_dahlen_b_cut)

stig_dahlen_ub_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='SD1',15:14]))
stig_dahlen_ub_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='SD1',15:14][stig_dahlen_ub_order,]))
stig_dahlen_ub_cut<-lasclip(stig_dahlen_las,stig_dahlen_ub_poly)
stig_dahlen_ub_cut
plot(stig_dahlen_ub_cut)

writeLAS(stig_dahlen_b_cut,'Hedmark_Akershus/clipped_las/stig_dahlen_b.las')
writeLAS(stig_dahlen_ub_cut,'Hedmark_Akershus/clipped_las/stig_dahlen_ub.las')
##################################################################################################

#Truls Holm
truls_holm_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Hedmark_Akershus/Truls_Holm.las') 
truls_holm_las 
plot(truls_holm_las)

truls_holm_b_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='TH1',15:14]))
truls_holm_b_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='TH1',15:14][truls_holm_b_order,]))
truls_holm_b_cut<-lasclip(truls_holm_las,truls_holm_b_poly)
truls_holm_b_cut
plot(truls_holm_b_cut)

truls_holm_ub_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='TH2',15:14]))
truls_holm_ub_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='TH2',15:14][truls_holm_ub_order,]))
truls_holm_ub_cut<-lasclip(truls_holm_las,truls_holm_ub_poly)
truls_holm_ub_cut
plot(truls_holm_ub_cut)

writeLAS(truls_holm_b_cut,'Hedmark_Akershus/clipped_las/truls_holm_b.las')
writeLAS(truls_holm_ub_cut,'Hedmark_Akershus/clipped_las/truls_holm_ub.las')
####################################################################################################

#Fet3
fet3_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Hedmark_Akershus/Fet3.las') 
fet3_las 
plot(fet3_las) #helt blått terreng, noen røde prikker høyt oppe -fugler?

fet3_b_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='FK2',15:14]))
fet3_b_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='FK2',15:14][fet3_b_order,]))
fet3_b_cut<-lasclip(fet3_las,fet3_b_poly)
fet3_b_cut
plot(fet3_b_cut)

fet3_ub_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='FK1',15:14]))
fet3_ub_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='FK1',15:14][fet3_ub_order,]))
fet3_ub_cut<-lasclip(fet3_las,fet3_ub_poly)
fet3_ub_cut
plot(fet3_ub_cut) #flatenes vi undersøker ser ok ut

writeLAS(fet3_b_cut,'Hedmark_Akershus/clipped_las/fet3_b.las')
writeLAS(fet3_ub_cut,'Hedmark_Akershus/clipped_las/fet3_ub.las')
#####################################################################################################

#Eidskog
eidskog_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Hedmark_Akershus/Eidskog.las') 
eidskog_las 
plot(eidskog_las) #helt blå flate

eidskog_b_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='STSKN2',15:14]))
eidskog_b_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='STSKN2',15:14][eidskog_b_order,]))
eidskog_b_cut<-lasclip(eidskog_las,eidskog_b_poly)
eidskog_b_cut
plot(eidskog_b_cut)

eidskog_ub_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='STSKN1',15:14]))
eidskog_ub_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='STSKN1',15:14][eidskog_ub_order,]))
eidskog_ub_cut<-lasclip(eidskog_las,eidskog_ub_poly)
eidskog_ub_cut
plot(eidskog_ub_cut)

writeLAS(eidskog_b_cut,'Hedmark_Akershus/clipped_las/eidskog_b.las')
writeLAS(eidskog_ub_cut,'Hedmark_Akershus/clipped_las/eidskog_ub.las')
################################################################################################

#Halvard Pramhus
halvard_pramhus_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Hedmark_Akershus/Halvard_Pramhus.las') 
halvard_pramhus_las 
plot(halvard_pramhus_las)

halvard_pramhus_b_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='HP1',15:14]))
halvard_pramhus_b_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='HP1',15:14][halvard_pramhus_b_order,]))
halvard_pramhus_b_cut<-lasclip(halvard_pramhus_las,halvard_pramhus_b_poly)
halvard_pramhus_b_cut
plot(halvard_pramhus_b_cut)

halvard_pramhus_ub_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='HP2',15:14]))
halvard_pramhus_ub_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='HP2',15:14][halvard_pramhus_ub_order,]))
halvard_pramhus_ub_cut<-lasclip(halvard_pramhus_las,halvard_pramhus_ub_poly)
halvard_pramhus_ub_cut
plot(halvard_pramhus_ub_cut)

#1 outlying very high point (like a bird?)-Fix in canopy terrain instead
#summary(halvard_pramhus_ub_cut@data$Z)
#Set the outliers to NA
#halvard_pramhus_ub_cut@data$Z[halvard_pramhus_ub_cut@data$Z>500]<-NA
#hist(halvard_pramhus_ub_cut@data$Z)
#plot(halvard_pramhus_ub_cut)

writeLAS(halvard_pramhus_b_cut,'Hedmark_Akershus/clipped_las/halvard_pramhus_b.las')
writeLAS(halvard_pramhus_ub_cut,'Hedmark_Akershus/clipped_las/halvard_pramhus_ub.las')
################################################################################################

#Stangeskovene Eidskog
stangeskovene_eidskog_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Hedmark_Akershus/Stangeskovene_Eidskog.las') 
stangeskovene_eidskog_las 
plot(stangeskovene_eidskog_las) #helt blå

stangeskovene_eidskog_b_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='SSB1',15:14]))
stangeskovene_eidskog_b_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='SSB1',15:14][stangeskovene_eidskog_b_order,]))
stangeskovene_eidskog_b_cut<-lasclip(stangeskovene_eidskog_las,stangeskovene_eidskog_b_poly)
stangeskovene_eidskog_b_cut
plot(stangeskovene_eidskog_b_cut)

stangeskovene_eidskog_ub_order<-chull(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='SSB2',15:14]))
stangeskovene_eidskog_ub_poly<-Polygon(as.matrix(plotcoords_hedmark_akershus[plotcoords_hedmark_akershus$Uthegningi=='SSB2',15:14][stangeskovene_eidskog_ub_order,]))
stangeskovene_eidskog_ub_cut<-lasclip(stangeskovene_eidskog_las,stangeskovene_eidskog_ub_poly)
stangeskovene_eidskog_ub_cut
plot(stangeskovene_eidskog_ub_cut)

writeLAS(stangeskovene_eidskog_b_cut,'Hedmark_Akershus/clipped_las/stangeskovene_eidskog_b.las')
writeLAS(stangeskovene_eidskog_ub_cut,'Hedmark_Akershus/clipped_las/stangeskovene_eidskog_ub.las')

