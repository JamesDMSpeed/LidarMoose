#Clipping_script

#LidR
#install.packages("lidR")
#installed.packages("raster")
#install.packages("rasterVis")

require(lidR)
require(raster)
require(rasterVis)


#Import data

#Import plot coords
plotcoords<-read.csv('Troendelag_20m_flater_pkt.csv',header=T,sep=';',dec=',')

bratsbserg_b_poly<-Polygon(as.matrix(plotcoords[plotcoords$Name=='Brb',4:5]))

bratsberglas <-  readLAS('C:/Users/Ingrid/Documents/Master - Sustherb/orginale_las/bratsberg.las')
bratsberglas 
plot(bratsberglas)

bbx<-lasclip(bratsberglas,bratsbserg_b_poly) #what does this one do?
bbx
plot(bbx)

bratsberg_b<-lasclipRectangle(bratsberglas,573723,7025715,573750,7025741) #this one is not 20x20 m, it has an area of 700m^2. Bruk lasclipPoly
bratsberg_ub<-lasclipRectangle(bratsberglas,573675,7025681,573695,7025701)
bratsberg_b
plot(bratsberg_b)
bratsberg_ub
plot(bratsberg_ub)

writeLAS(bratsberg_b,'clipped_las/bratsberg_b.las')
writeLAS(bratsberg_ub,'clipped_las/bratsberg_ub.las')
