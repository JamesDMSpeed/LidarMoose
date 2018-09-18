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
