#Analysis script - Nov 2019
library(cowplot)
library(sp)
library(raster)
library(rgdal) #read OGS
sustherbsites<-read.table('Metadata_stats.csv',header=T,sep=',')

#Correct coordinates
sustherbsites$Longitude<-as.numeric(ifelse(substr(sustherbsites$Longitude,1,1)==1,
  paste0(substr(sustherbsites$Longitude,1,2),'.',substr(sustherbsites$Longitude,3,nchar(sustherbsites$Longitude))),
  paste0(substr(sustherbsites$Longitude,1,1),'.',substr(sustherbsites$Longitude,2,nchar(sustherbsites$Longitude)))))
sustherbsites$Latitude<-as.numeric(paste0(substr(sustherbsites$Latitude,1,2),'.',substr(sustherbsites$Latitude,3,nchar(sustherbsites$Latitude))))

#Set clear cut year to autumns
sustherbsites$Clear.cut<-as.numeric(substr(sustherbsites$Clear.cut,1,4))

#Correct encoding of Trøndelag
levels(sustherbsites$Region.x)[3]<-'Trøndelag'

View(sustherbsites)

#Extract herbivore data
norway<-getData('GADM',country='NOR',level=0)
sustherbsites_sp<-SpatialPointsDataFrame(coords=cbind(sustherbsites$Longitude,sustherbsites$Latitude),
                                         sustherbsites,proj4string = crs(norway))
plot(sustherbsites_sp)
norwayherbivores<-readOGR('data/HerbivoreBiomass','NorwayLargeHerbivores')
norwayherbivoresLL<-spTransform(norwayherbivores,crs(norway))
sustherb_herbivoredens<-over(sustherbsites_sp,norwayherbivoresLL)
sustherbsites_sp$Moose2015<-sustherb_herbivoredens$Ms_2015
sustherbsites_sp$Reddeer2015<-sustherb_herbivoredens$Rd__2015
sustherbsites_sp$Roedeer2015<-sustherb_herbivoredens$R_d_2015

#Age of expt at lidar sampling
sustherbsites_sp$YrsSinceExclosure<-sustherbsites_sp$LiDAR.data.from.year-sustherbsites_sp$Year.initiated
#Canopy height growth
sustherbsites_sp$canopygrowth<-sustherbsites_sp$md/sustherbsites_sp$YrsSinceExclosure

dat <- as.data.frame(sustherbsites_sp@data)
#Now for the plots etcs
ggplot(data=sustherbsites_sp@data,
       aes(x = Treatment, y = canopygrowth,group=LocalityName))+
  geom_line()

x1<- sustherbsites_sp@data$Treatment 
levels(x1) = c('Open plot','Exclosure')

chg_treat <- ggplot(sustherbsites_sp@data, aes(x=x1, y=canopygrowth, group=LocalityName))+
  geom_line()+
  labs(y=expression(paste('Canopy height growth (m year'^'-1', ')')), x='Treatment')+
  scale_linetype_manual(breaks = c("Exclosure", "Open plot"), 
                        labels = c("Open plots", "Exclosures"), values=c(1,2))+
  scale_x_discrete(limits = c('Open plot', 'Exclosure'), 
                   breaks = c('Open plot', 'Exclosure'), expand = c(0.1,0))+
  theme_bw()+
  theme(text = element_text(size = 20))+
  ylim(0, 0.4)
chg_treat

#Productivity
#Remove sites with top prod.
prodmoddat<-sustherbsites_sp@data[sustherbsites_sp$Productivity<0.8,]

# fit linear model for plotting (can also be done with geom_smooth())
prodchg_mod <- lm(data = prodmoddat,
             (canopygrowth)~(Productivity)*Treatment)
summary(prodchg_mod)
prodmoddat$pred <- predict(prodchg_mod, prodmoddat)
prodmoddat$pred_us <- (prodmoddat$pred)

chg_prod <- ggplot()+
  geom_point(aes(x = Productivity, y = canopygrowth, 
                 colour= Treatment, shape=Region.x),data = prodmoddat)+
  geom_line(aes(x = Productivity, y = pred_us, 
                colour = Treatment), data = prodmoddat, size = 1.5)+
  labs(y=expression(paste('Canopy height growth (m year'^'-1', ')')), x='Productivity')+
  theme_bw()+
  scale_color_manual(values = c("gray0", "gray60"))+
  labs(colour="Treatment", shape="Region")+
  theme(text = element_text(size = 20))+
  ylim(0, 0.4)+
  theme(legend.position = 'right',
                             legend.justification = c("left", "top"),
                             legend.box.just = "left",
                             #legend.margin = margin(5, 5, 5, 5),
                             legend.text = element_text(size=12))
chg_prod

tiff("output/Nov2019/CanopyHt.tiff", units = "cm", res = 300, height = 20, width = 35) 
plot_grid(chg_treat, chg_prod+theme(legend.position = c(0.05, 0.95)), ncol=2, labels = c("A", "B"))
dev.off()
