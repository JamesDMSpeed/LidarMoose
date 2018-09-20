#Clipping_script

require(lidR)
require(raster)
require(rasterVis)

#BRATSBERG
#Import plot coords
plotcoords<-read.csv('Troendelag_20m_flater_pkt.csv',header=T,sep=';',dec=',')
#Import las file
bratsberglas <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/bratsberg.las')
bratsberglas 
plot(bratsberglas)

#This function tells the order of the points to make a complete ring
bratsberg_b_order<-chull(as.matrix(plotcoords[plotcoords$Name=='Brb',4:5]))
#This function makes a polygon using the bratsberg_b coordinates, ordered by the convex hull
bratsberg_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Brb',4:5][bratsberg_b_order,]))
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

hi_tydal_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Hi_tydal.las')
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

malvik_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Malvik.las')
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

namdalseid_1kub_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/namdalseid_1kub.las')
namdalseid_1kub_las 
plot(namdalseid_1kub_las)

namdalseid_1kub_b_order<-chull(as.matrix(plotcoords[plotcoords$Name=='1Kb',4:5]))
namdalseid_1kub_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='1Kb',4:5][namdalseid_1kub_b_order,]))
namdalseid_1kub_b_cut<-lasclip(namdalseid_1kub_las,namdalseid_1kub_b_poly)
namdalseid_1kub_b_cut
plot(namdalseid_1kub_b_cut)

namdalseid_1kub_ub_order<-chull(as.matrix(plotcoords[plotcoords$Name=='1Kub',4:5]))
namdalseid_1kub_ub_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='1Kub',4:5][namdalseid_1kub_ub_order,]))
namdalseid_1kub_ub_cut<-lasclip(namdalseid_1kub_las,namdalseid_1kub_ub_poly)
namdalseid_1kub_ub_cut
plot(malvik_ub_cut)

writeLAS(namdalseid_1kub_b_cut,'Trondelag/clipped_las/namdalseid_1kub_b.las')
writeLAS(namdalseid_1kub_ub_cut,'Trondelag/clipped_las/namdalseid_1kub_ub.las')
###################################################################################
#Nsb_Verdal OBS! Error i linja som starter med nsb_verdal_ub_poly (112)

nsb_verdal_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Nsb_Verdal.las')
nsb_verdal_las 
plot(nsb_verdal_las)

nsb_verdal_b_order<-chull(as.matrix(plotcoords[plotcoords$Name=='1Nsb',4:5]))
nsb_verdal_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='1Nsb',4:5][nsb_verdal_b_order,]))
nsb_verdal_b_cut<-lasclip(malvik_las,malvik_b_poly)
nsb_verdal_b_cut
plot(nsb_verdal_b_cut)

nsb_verdal_ub_order<-chull(as.matrix(plotcoords[plotcoords$Name=='1Nsub',4:5]))
nsb_verdal_ub_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='1Nsub',4:5][nsb_verdal_ub_order,]))
nsb_verdal_ub_cut<-lasclip(nsb_verdal_las,nsb_verdal_ub_poly)
nsb_verdal_ub_cut
plot(nsb_verdal_ub_cut)

writeLAS(nsb_verdal_b_cut,'Trondelag/clipped_las/nsb_verdal_b.las')
writeLAS(nsb_verdal_ub_cut,'Trondelag/clipped_las/nsb_verdal_ub.las')
###########################################################################
#Selbu_flub
selbu_flub_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Selbu_flub.las')
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

selbu_kl_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Selbu_kl.las')
selbu_kl_las 
plot(selbu_kl_las)

selbu_kl_b_order<-chull(as.matrix(plotcoords[plotcoords$Name=='Klb',4:5]))
selbu_kl_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Klb',4:5][selbu_kl_b_order,]))
selbu_kl_b_cut<-lasclip(selbu_kl_las,selbu_kl_b_poly)
selbu_kl_b_cut
plot(selbu_kl_b_cut)

selbu_kl_ub_order<-chull(as.matrix(plotcoords[plotcoords$Name=='Klub',4:5]))
selbu_kl_ub_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Klub',4:5][selbu_kl_ub_order,]))
selbu_kl_ub_cut<-lasclip(selbu_kl_las,selbu_kl_ub_poly)
selbu_kl_ub_cut
plot(selbu_kl_ub_cut)

writeLAS(selbu_kl_b_cut,'Trondelag/clipped_las/selbu_kl_b.las')
writeLAS(selbu_kl_ub_cut,'Trondelag/clipped_las/selbu_kl_ub.las')
############################################################################
#Selbu_sl

selbu_sl_las <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/Selbu_sl.las')
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
