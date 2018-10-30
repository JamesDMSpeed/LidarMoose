#Clipping_script

require(lidR)
require(raster)
require(rasterVis)

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
namdalseid_1kub_ub_cut<-lasclip(namdalseid_1kub_las,namdalseid_1kub_ub_poly)
namdalseid_1kub_ub_cut
plot(malvik_ub_cut)

writeLAS(namdalseid_1kub_b_cut,'Trondelag/clipped_las/namdalseid_1kub_b.las')
writeLAS(namdalseid_1kub_ub_cut,'Trondelag/clipped_las/namdalseid_1kub_ub.las')
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

fritsoel_2FR_b_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Fritzøe 2 B',10:9]))
fritsoel_2FR_b_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Fritzøe 2 B',10:9][fritsoel_2FR_b_order,]))
fritsoel_2FR_b_cut<-lasclip(fritsoe2_2FR_las,fritsoel_2FR_b_poly)
fritsoel_2FR_b_cut
plot(fritsoel_2FR_b_cut)

fritsoel_2FR_ub_order<-chull(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Fritzøe 2 UB',10:9]))
fritsoel_2FR_ub_poly<-Polygon(as.matrix(plotcoords_telemark[plotcoords_telemark$flatenavn=='Fritzøe 2 UB',10:9][fritsoel_2FR_ub_order,]))
fritsoel_2FR_ub_cut<-lasclip(fritsoe2_2FR_las,fritsoel_2FR_ub_poly)
fritsoel_2FR_ub_cut
plot(fritsoel_2FR_ub_cut)

writeLAS(fritsoel_2FR_b_cut,'Telemark/clipped_las/fritsoel_2FR_b.las')
writeLAS(fritsoel_2FR_ub_cut,'Telemark/clipped_las/fritsoel_2FR_ub.las')

