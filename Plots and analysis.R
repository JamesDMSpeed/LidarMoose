#Plots and analysis

# Loading -----------------------------------------------------------------


#The most complete dataset
library(readr)
Data_prod_field <- read_csv("~/Master - Sustherb/LidarMoose/Data_prod_field.csv")
View(Data_prod_field)

#A subset of data_prod_field
library(readr)
MyData5 <- read_csv("~/Master - Sustherb/LidarMoose/MyData5.csv")
View(MyData5)

#Rydder litt i data_prod_field, fjerner intetsigende kolonner
colnames(Data_prod_field)
keeps <- c('LocalityCode', "LocalityName", "ExperimentID","Region.x", "DistrictID", "Treatment" , "Longitude","Latitude","Clear.cut", "Year.initiated","LiDAR.data.from.year", "Point.density...m.2.", "Resolution..m.","Mean","Median","SD", "Min", "Max", "X1st.Qu." ,"X3rd.Qu.", "IQR","ClearCutToLidar","CV","IQR_med","MAD", "MAD_med","productivity","Field_median","link","mean_of_mean", "mean_of_median","median_of_mean", "median_of_median")
MyData6 <-Data_prod_field[keeps]

write.csv(MyData6,'MyData6.csv')

library(readr)
MyData6 <- read_csv("~/Master - Sustherb/LidarMoose/MyData6.csv")
View(MyData6)

library(readr)
MyData7 <- read_csv("~/Master - Sustherb/LidarMoose/MyData7.csv")
View(MyData7)

library(ggplot2)


# Field data VS Lidar data ------------------------------------------------


#Field median VS LIDAR median
#wilcox.test(MyData6$Median, MyData6$Field_median, paired = T) Sjekker istedet om korrelasjonen er signifikant, ikke om forskjellen er det
#V = 453, p-value = 5.229e-05

#Scatterplot ggplot with colour representing point density
median_comparison <- ggplot(data = MyData6, aes(x=Field_median, y=Median, colour=as.factor(Point.density...m.2.)))+geom_point()+ xlim(c(0,max(MyData6$Field_median, na.rm = T)))+ ylim(c(0,max(MyData6$Median, na.rm = T)))
median_comparison <- median_comparison+  geom_abline() 
median_comparison <- median_comparison + xlab("Median from field data")+ylab("Median from lidar data")+ theme(axis.text.y   = element_text(size=12),
                                                                                                              axis.text.x   = element_text(size=12),
                                                                                                              axis.title.y  = element_text(size=12),
                                                                                                              axis.title.x  = element_text(size=12),
                                                                                                              panel.background = element_blank(),
                                                                                                              panel.grid.major = element_blank(), 
                                                                                                              panel.grid.minor = element_blank(),
                                                                                                              axis.line = element_line(colour = "black"),
                                                                                                              panel.border = element_rect(colour = "black", fill=NA, size=1))
median_comparison <- median_comparison+ labs(color=expression(paste(ext="Point density m"^"-2")))
median_comparison

#Check correlation between field median and lidar median data
cor.test(MyData6$Field_median, MyData6$Median, alternative = "two.sided", method = "pearson")



#Plot comparing field and lidar median where the dots represent the difference in median between treatments at each site
library(reshape2)
#Difference lidar data
MyData6_cast <- dcast(data = MyData6,
                      LocalityName+Region.x+Point.density...m.2. ~ Treatment, 
                      value.var = "Median")
MyData6_cast$median_diff <- MyData6_cast$Exclosure-MyData6_cast$`Open plot`

#difference field data
MyData6_cast_f <- dcast(data = MyData6,
                      LocalityName+Region.x ~ Treatment, 
                      value.var = "Field_median")
MyData6_cast_f$median_diff_f <- MyData6_cast_f$Exclosure-MyData6_cast_f$`Open plot`

MyData_cast <- merge(MyData6_cast_f, MyData6_cast, by="LocalityName" )

p1 <- ggplot(data = MyData_cast, aes(x=median_diff_f, y=median_diff, colour=as.factor(Point.density...m.2.)))+geom_point()+ xlim(c(0,max(MyData_cast$median_diff_f, na.rm = T)))+ ylim(c(0,max(MyData_cast$median_diff, na.rm = T)))
p1 <- p1+  geom_abline() #linja blir litt "hakkete"
p1 <- p1 + xlab("Difference in median between treatments from field data")+ylab("Difference in median from lidar data")+ theme(axis.text.y   = element_text(size=12),
                                                                                                              axis.text.x   = element_text(size=12),
                                                                                                              axis.title.y  = element_text(size=12),
                                                                                                              axis.title.x  = element_text(size=12),
                                                                                                              panel.background = element_blank(),
                                                                                                              panel.grid.major = element_blank(), 
                                                                                                              panel.grid.minor = element_blank(),
                                                                                                              axis.line = element_line(colour = "black"),
                                                                                                              panel.border = element_rect(colour = "black", fill=NA, size=1))  
p1 <- p1+labs(color=expression(paste(ext="Point density m"^"-2")))
p1



cor.test(MyData_cast$median_diff_f, MyData_cast$median_diff, alternative = "two.sided", method = "pearson")
# cor 0.6446853 



#Making panel plot
library(egg)
p2 <- egg::ggarrange(median_comparison+ theme(legend.position="none"),p1, ncol=2)



##consider field mean also
plot(MyData6$mean_of_mean, MyData6$Median,
     xlab = "Mean from field data",
     ylab = "Median from lidar data",
     xlim = c(0,max(MyData6$mean_of_mean, na.rm = T)),
     ylim = c(0,max(MyData6$Median, na.rm = T)))
#add reference line
abline(coef = c(0,1))

#checking correation
cor.test(MyData6$mean_of_mean, MyData6$Median, alternative = "two.sided", method = "pearson")
#cor: 0.7812088  





# Productivity plots without Stig Dahlen------------------------------------------------------
MyData7 <- MyData6[MyData6$LocalityName!="Stig Dahlen",] #Same as MyData6, but without Stig Dahlen

##Median
# standardizing for year since clear cutting
MyData6$Median_std <- MyData6$Median/(MyData7$LiDAR.data.from.year-MyData6$Year.initiated)
MyData7$Median_std <- MyData7$Median/(MyData7$LiDAR.data.from.year-MyData7$Year.initiated)
MyData7$duration <- MyData7$LiDAR.data.from.year-MyData7$Year.initiated

write.csv(MyData7,'MyData7.csv')

plot(MyData7$duration)
ggplot(data=MyData7, aes(x=X1, y=duration,colour=Region.x))+geom_point()
  
#Mixed effect model
library(lmerTest)
lmer_median <- lmer(log(Median) ~ productivity 
                             +Treatment 
                             +Treatment:productivity
                             +duration
                             #+duration:Treatment  
                    +(1|LocalityName), data = MyData7)
summary(lmer_median)
anova(lmer_median)

# model validation - looks ok
plot(lmer_median)
qqnorm(resid(lmer_median))

# How does the predict() function do?:
mymod2 <- lm(data = MyData7,
             log(Median_std)~productivity*Treatment)
MyData7$pred <- predict(mymod2, MyData7)
MyData7$pred_us <- exp(MyData7$pred)
p3 <- ggplot()+
  geom_point(aes(x = productivity, y = Median_std, colour= Treatment), data = MyData7)+
  geom_line(aes(x = productivity, y = pred_us, colour = Treatment), data = MyData7, size = 1.5)+
  labs(y=expression(paste('Canopy height growth (m year'^'-1', ')')), x='Productivity')+
  theme(axis.text.y   = element_text(size=12),
       axis.text.x   = element_text(size=12),
       axis.title.y  = element_text(size=12),
       axis.title.x  = element_text(size=12),
       panel.background = element_blank(),
       panel.grid.major = element_blank(), 
       panel.grid.minor = element_blank(),
       axis.line = element_line(colour = "black"),
       panel.border = element_rect(colour = "black", fill=NA, size=1))  
p3

chg_prod <- ggplot()+
  geom_point(aes(x = productivity, y = Median_std, colour= Treatment, shape=Region.x),data = MyData7)+
  geom_line(aes(x = productivity, y = pred_us, colour = Treatment), data = MyData7, size = 1.5)+
  labs(y=expression(paste('Canopy height growth (m year'^'-1', ')')), x='Productivity')+
  theme(axis.text.y   = element_text(size=12),
        axis.text.x   = element_text(size=12),
        axis.title.y  = element_text(size=12),
        axis.title.x  = element_text(size=12),
        panel.background = element_blank(),
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black"),
        panel.border = element_rect(colour = "black", fill=NA, size=1))  
chg_prod <- chg_prod+labs(colour="Treatment",shape="Region", size=8)
chg_prod


#Making panel plot
library(egg)
canopy_height_growth_panel <- egg::ggarrange(chg_treat,chg_prod, ncol=2)
library(cowplot)
plot_grid(chg_treat, chg_prod, nrow=2)

#MAD   
#Mixed effect model
library(lmerTest)
lmer_mad <- lmer(log(MAD) ~ productivity 
                    +Treatment 
                    +Treatment:productivity
                    +duration
                    #+duration:Treatment  
                    +(1|LocalityName), data = MyData7)
summary(lmer_mad)

#Validation -looks ok
plot(lmer_mad)
qqnorm(resid(lmer_mad))

#Plot with linear model and predict()
mymod3 <- lm(data = MyData7,
             log(MAD)~productivity*Treatment)
MyData7$pred2 <- predict(mymod3, MyData7)
MyData7$pred_us2 <- exp(MyData7$pred2)
mad_prod_plot <- ggplot()+
  geom_point(aes(x = productivity, y = MAD, colour= Treatment), data = MyData7)+
  geom_line(aes(x = productivity, y = pred_us2, colour = Treatment), data = MyData7, size = 1.5)+
  labs(x="Productivity", y="Median absolute deviation")+
  theme(axis.text.y   = element_text(size=12),
        axis.text.x   = element_text(size=12),
        axis.title.y  = element_text(size=12),
        axis.title.x  = element_text(size=12),
        panel.background = element_blank(),
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black"),
        panel.border = element_rect(colour = "black", fill=NA, size=1))
  

#plot
ggplot(data=MyData7,
       aes(x = Treatment, y = MAD))+
  geom_boxplot()
mad_prod <- ggplot(data=MyData7,
       aes(x = productivity, y = MAD, group = Treatment, colour = Treatment))+
  geom_smooth(method = "lm")+
  geom_point()+labs(x="Productivity", y="Median Absolute Deviation")
mad_prod <- mad_prod +  theme(axis.text.y   = element_text(size=12),
                              axis.text.x   = element_text(size=12),
                              axis.title.y  = element_text(size=12),
                              axis.title.x  = element_text(size=12),
                              panel.background = element_blank(),
                              panel.grid.major = element_blank(), 
                              panel.grid.minor = element_blank(),
                              axis.line = element_line(colour = "black"),
                              panel.border = element_rect(colour = "black", fill=NA, size=1))  
mad_prod




#MAD/Median  <-- not significant
#Mixed effect model: fjernet alle sites med median < 0.01 m
library(lmerTest)
lmer_madmed <- lmer(log(MAD_med) ~ productivity 
                 +Treatment 
                 #+Treatment:productivity
                 #+duration
                 #+duration:Treatment  
                 +(1|LocalityName), data = MyData7[MyData7$Median > 0.01,])
summary(lmer_madmed) #ingen signifikant interaksjon

#test <- MyData7[MyData7$Median > 0.01,]

#Validation
plot(lmer_madmed)
qqnorm(resid(lmer_madmed))


#Plot
mymod4 <- lm(data = MyData7,
             log(MAD_med)~productivity*Treatment)
MyData7$pred3 <- predict(mymod4, MyData7)
MyData7$pred_us3 <- exp(MyData7$pred3)
mad_med_prod <- ggplot()+
  geom_point(aes(x = productivity, y = MAD_med, colour= Treatment), data = MyData7[MyData7$Median > 0.01,])+
  #geom_line(aes(x = productivity, y = pred_us3, colour = Treatment), data = MyData7[MyData7$Median > 0.01,], size = 1.5)+
  labs(x="Productivity", y="Median absolute deviation / median")+
  theme(axis.text.y   = element_text(size=12),
        axis.text.x   = element_text(size=12),
        axis.title.y  = element_text(size=12),
        axis.title.x  = element_text(size=12),
        panel.background = element_blank(),
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black"),
        panel.border = element_rect(colour = "black", fill=NA, size=1))


library(egg)
MAD_madmed_prod <- egg::ggarrange(mad_prod_plot + theme(legend.position="none"),mad_med_prod, ncol=2)
panel_plot_spagh<- egg::ggarrange(p2+ theme(legend.position="none"),p5, ncol=2) #common.legend = T)


#Namdalseid_1kub open plot, outlier -removed that site

#plot
ggplot(data=MyData7,
       aes(x = Treatment, y = MAD_med))+
  geom_boxplot()
ggplot(data=MyData7,
       aes(x = productivity, y = MAD_med, group = Treatment, colour = Treatment))+
  geom_smooth(method = "lm")+
  geom_point()+
  labs(x="Productivity", y= "Median absolute deviation / Median")+
  theme(axis.text.y   = element_text(size=12),
        axis.text.x   = element_text(size=12),
        axis.title.y  = element_text(size=12),
        axis.title.x  = element_text(size=12),
        panel.background = element_blank(),
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black"),
        panel.border = element_rect(colour = "black", fill=NA, size=1))  




# Productivity plots with Stig Dahlen -------------------------------------

MyData6$Median_std <- MyData6$Median/(MyData6$LiDAR.data.from.year-MyData6$Year.initiated)
MyData6$duration <- MyData6$LiDAR.data.from.year-MyData6$Year.initiated

plot(MyData6$duration)

#Mixed effect model
library(lmerTest)
lmer_median <- lmer(Median ~ productivity 
                    +Treatment 
                    +Treatment:productivity
                    +duration
                    +duration:Treatment  
                    +(1|LocalityName), data = MyData6)
summary(lmer_median)

lmer_median_std <- lmer(Median_std ~ productivity 
                        +Treatment 
                        +Treatment:productivity
                        +duration
                        +duration:Treatment  
                        +(1|LocalityName), data = MyData6)
summary(lmer_median_std) #noen ikke signifikante linjer

# model validation
plot(lmer_median)
qqnorm(resid(lmer_median))

plot(lmer_median_std)
qqnorm(resid(lmer_median_std))

#plot
ggplot(data=MyData6,
       aes(x = Treatment, y = Median))+
  geom_boxplot()
ggplot(data=MyData6,
       aes(x = productivity, y = Median, group = Treatment, colour = Treatment))+
  geom_smooth(method = "lm")+
  geom_point()

ggplot(data=MyData6,
       aes(x = Treatment, y = Median_std))+
  geom_boxplot()
ggplot(data=MyData6,
       aes(x = productivity, y = Median_std, group = Treatment, colour = Treatment))+
  geom_smooth(method = "lm")+
  geom_point()+
  labs(x= "Productivity", y=("Standardized Median"))

#MAD   
#Mixed effect model
library(lmerTest)
lmer_mad <- lmer(log(MAD) ~ productivity 
                 +Treatment 
                #+Treatment:productivity
                 +duration
                 +duration:Treatment  
                 +(1|LocalityName), data = MyData6)
summary(lmer_mad)

#Validation
plot(lmer_mad)
qqnorm(resid(lmer_mad))

#plot
ggplot(data=MyData6,
       aes(x = Treatment, y = MAD))+
  geom_boxplot()
ggplot(data=MyData6,
       aes(x = productivity, y = MAD, group = Treatment, colour = Treatment))+
  geom_smooth(method = "lm")+
  geom_point()


#MAD/Median  <-- not significant
#Mixed effect model
library(lmerTest)
lmer_madmed <- lmer(MAD_med ~ productivity 
                    +Treatment 
                    +Treatment:productivity
                    +duration
                    +duration:Treatment  
                    +(1|LocalityName), data = MyData6)
summary(lmer_madmed)

#Validation
plot(lmer_madmed)
qqnorm(resid(lmer_madmed))

#plot
ggplot(data=MyData6,
       aes(x = Treatment, y = MAD_med))+
  geom_boxplot()
ggplot(data=MyData6,
       aes(x = productivity, y = MAD_med, group = Treatment, colour = Treatment))+
  geom_smooth(method = "lm")+
  geom_point()+
  labs(x="Productivity", y= "Median absolute deviation")


# Median canopy height - plots --------------------------------------------

#Wilcox test
wilcox.test(MyData6$Median[MyData6$Treatment=='Open plot'],MyData6$Median[MyData6$Treatment=='Exclosure'],paired=T)
#p-value =3.148e-07
wilcox.test(MyData6$Median_std[MyData6$Treatment=='Open plot'],MyData6$Median_std[MyData6$Treatment=='Exclosure'],paired=T)
#p-value = 2.054e-06

#boxplot median - treatment
p1 <- ggplot(data=MyData6, aes(x=Treatment, y=Median))+geom_boxplot()
p1 <- print(p1+labs(y='Median Canopy Height'))

#vioplot median - treatment
library(ggplot2)
vioplot_median <- ggplot(data=MyData6, aes(x=Treatment, y=Median))+geom_violin()


#Median spaghetti plot
x1<- factor(MyData6$Treatment, levels = c('Exclosure', 'Open plot'))
p2 <- ggplot(data=MyData6, aes(x=x1, y=Median, group=LocalityName, color=Region.x))+geom_line()+labs(y='Median Canopy Height (m)', x='Treatment')+scale_linetype_manual(breaks = c("Exclosure", "Open plot"), labels = c("Open plots", "Exclosures"), values=c(1,2))
p2  <- p2+
  theme(axis.text.y   = element_text(size=12),
          axis.text.x   = element_text(size=12),
          axis.title.y  = element_text(size=12),
          axis.title.x  = element_text(size=12),
          panel.background = element_blank(),
          panel.grid.major = element_blank(), 
          panel.grid.minor = element_blank(),
          axis.line = element_line(colour = "black"),
          panel.border = element_rect(colour = "black", fill=NA, size=1))#,
          #legend.position = "top")
p2 <- p2+ scale_x_discrete(limits = c("Exclosure", "Open plot"), breaks = c("Exclosure", "Open plot"), expand = c(0.1,0))
p2 <- p2+labs(colour="Region")   
p2

#Median/(time from fencing to lidar data prod)
x1<- factor(MyData7$Treatment, levels = c('Exclosure', 'Open plot'))
chg_treat <- ggplot(data=MyData7, aes(x=x1, y=Median_std, group=LocalityName, color=Region.x))+geom_line()+labs(y=expression(paste('Canopy height growth (m year'^'-1', ')')), x='Treatment')+scale_linetype_manual(breaks = c("Exclosure", "Open plot"), labels = c("Open plots", "Exclosures"), values=c(1,2))
chg_treat  <- chg_treat+
  theme(axis.text.y   = element_text(size=12),
        axis.text.x   = element_text(size=12),
        axis.title.y  = element_text(size=12),
        axis.title.x  = element_text(size=12),
        panel.background = element_blank(),
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black"),
        panel.border = element_rect(colour = "black", fill=NA, size=1))#,
#legend.position = "top")
chg_treat <- chg_treat+ scale_x_discrete(limits = c("Exclosure", "Open plot"), breaks = c("Exclosure", "Open plot"), expand = c(0.1,0))
chg_treat <- chg_treat+labs(colour="Region", size=10)   
chg_treat


# Median absolute deviation -----------------------------------------------

#Wilcox test
wilcox.test(MyData6$MAD[MyData6$Treatment=='Open plot'],MyData6$MAD[MyData6$Treatment=='Exclosure'],paired=T)
#p-value = p-value = 1.103e-07

#Boxplot mad-treatment
p3 <- ggplot(data=MyData6, aes(x=Treatment, y=MAD))+geom_boxplot()+ labs(y="Median Absolute Deviation")+
  theme(axis.text.y   = element_text(size=12),
        axis.text.x   = element_text(size=12),
        axis.title.y  = element_text(size=12),
        axis.title.x  = element_text(size=12),
        panel.background = element_blank(),
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black"),
        panel.border = element_rect(colour = "black", fill=NA, size=1))
p3

#vioplot mad-treatment
p4 <- ggplot(data=MyData6, aes(x=Treatment, y=MAD))+geom_violin()
p4

#mad spaghetti plot
#reorder x-axis
#x1 <- factor(MyData6$Treatment, levels =  c('Exclosure', 'Open plot'))
#p5 <- ggplot(data=MyData6, aes(x=x1, y=MAD, group=LocalityName, color=Region))+geom_line()+labs(y='Median Absolute Deviation', x='Treatment')+theme(text=element_text(size=18))
#p5
x1<- factor(MyData6$Treatment, levels = c('Exclosure', 'Open plot'))
p5 <- ggplot(data=MyData6, aes(x=x1, y=MAD, group=LocalityName,color=Region.x))+geom_line()+labs(y='Median Absolute Deviation (m)', x='Treatment')+scale_linetype_manual(breaks = c("Exclosure", "Open plot"), labels = c("Open plots", "Exclosures"), values=c(1,2))
p5 <- p5+theme(axis.text.y   = element_text(size=12),
               axis.text.x   = element_text(size=12),
               axis.title.y  = element_text(size=12),
               axis.title.x  = element_text(size=12),
               panel.background = element_blank(),
               panel.grid.major = element_blank(), 
               panel.grid.minor = element_blank(),
               axis.line = element_line(colour = "black"),
               panel.border = element_rect(colour = "black", fill=NA, size=1))#,
#legend.position = "top")
p5 <- p5+ scale_x_discrete(limits = c("Exclosure", "Open plot"), breaks = c("Exclosure", "Open plot"), expand = c(0.1,0))
p5 <- p5+labs(colour="Region")   
p5





ifelse(MyData3$Median!=MyData6$Median, print("TRUE"), print("FALSE"))
summary(MyData6$Median)
summary(MyData3$Median)
length(MyData3$Median)
length(MyData6$Median)




# MAD/median --------------------------------------------------------------

#Wilcox test
wilcox.test(MyData6$MAD_med[MyData6$Treatment=='Open plot'],MyData6$MAD_med[MyData6$Treatment=='Exclosure'],paired=T)
#p-value= 0.6982 - not significant

#Boxplot
p10 <- ggplot(data= MyData7[MyData7$Median > 0.01,], aes(x=Treatment, y=MAD_med))+geom_boxplot()+labs(y="Median Absolute Deviation / Median")+
  theme(axis.text.y   = element_text(size=12),
        axis.text.x   = element_text(size=12),
        axis.title.y  = element_text(size=12),
        axis.title.x  = element_text(size=12),
        panel.background = element_blank(),
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black"),
        panel.border = element_rect(colour = "black", fill=NA, size=1))
p10

#spaghetti plot
x1<- factor(MyData6$Treatment, levels = c('Exclosure', 'Open plot'))
p6 <- ggplot(data=MyData6[MyData6$Median > 0.01,], aes(x=x1, y=MAD_med, group=LocalityName,color=Region.x))+geom_line()+labs(y='Median Absolute Deviation/median', x='Treatment')+scale_linetype_manual(breaks = c("Exclosure", "Open plot"), labels = c("Open plots", "Exclosures"), values=c(1,2))
p6 <- p6+theme(axis.text.y   = element_text(size=12),
               axis.text.x   = element_text(size=12),
               axis.title.y  = element_text(size=12),
               axis.title.x  = element_text(size=12),
               panel.background = element_blank(),
               panel.grid.major = element_blank(), 
               panel.grid.minor = element_blank(),
               axis.line = element_line(colour = "black"),
               panel.border = element_rect(colour = "black", fill=NA, size=1))#,
#legend.position = "top")
p6 <- p6+ scale_x_discrete(limits = c("Exclosure", "Open plot"), breaks = c("Exclosure", "Open plot"), expand = c(0.1,0))
p6 <- p6+labs(colour="Region")   
p6

#Getting figures side-by side (mad and median)
library(egg)
MAD_madmed_box <- egg::ggarrange(p,p10, ncol=2)
MAD_madmed_spag <- egg::ggarrange(p5+ theme(legend.position="none"),p6, ncol=2)

#vioplot
p11 <- ggplot(data=MyData6, aes(x=Treatment, y=MAD_med))+geom_violin()
p11


# Roughness index ---------------------------------------------------------

#Rumple_index from lidR
#Loaded all the rasters for each site (and treatment) in making table script. 
require(lidR)
MyData6$rumple_index <- NA

MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="BRB", rumple_index(bratsberg_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="BRUB", rumple_index(bratsberg_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="DHB", rumple_index(didrik_holmsen_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="DHUB", rumple_index(didrik_holmsen_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="1DRB", rumple_index(drangedal1_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="1DRUB", rumple_index(drangedal1_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="3DRB", rumple_index(drangedal3_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="3DRUB", rumple_index(drangedal3_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="4DRB", rumple_index(drangedal4_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="4DRUB", rumple_index(drangedal4_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="STSKNB", rumple_index(eidskog_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="STSKNUB", rumple_index(eidskog_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="FKB", rumple_index(fet3_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="FKUB", rumple_index(fet3_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="1FRB", rumple_index(fritsoe1_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="1FRUB", rumple_index(fritsoe1_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="2FRB", rumple_index(fritsoe2_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="2FRUB", rumple_index(fritsoe2_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="1FYB", rumple_index(fyresdal_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="1FYUB", rumple_index(fyresdal_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="HPB", rumple_index(h_pramhus_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="HPUB", rumple_index(h_pramhus_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="HIB", rumple_index(hi_tydal_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="HIUB", rumple_index(hi_tydal_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="1KVB", rumple_index(kviteseid1_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="1KVUB", rumple_index(kviteseid1_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="2KVB", rumple_index(kviteseid2_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="2KVUB", rumple_index(kviteseid2_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="3KVB", rumple_index(kviteseid3_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="3KVUB", rumple_index(kviteseid3_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="MAB", rumple_index(malvik_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="MAUB", rumple_index(malvik_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="1KB", rumple_index(namdalseid_1kub_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="1KUB", rumple_index(namdalseid_1kub_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="1CAB", rumple_index(n_cappelen1_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="1CAUB", rumple_index(n_cappelen1_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="2CAB", rumple_index(n_cappelen2_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="2CAUB", rumple_index(n_cappelen2_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="3NOB", rumple_index(notodden3_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="3NOUB", rumple_index(notodden3_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="5NOB", rumple_index(notodden5_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="5NOUB", rumple_index(notodden5_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="6NOB", rumple_index(notodden6_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="6NOUB", rumple_index(notodden6_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="1NSB", rumple_index(nsb_verdal_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="1NSUB", rumple_index(nsb_verdal_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="FLB", rumple_index(selbu_flub_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="FLUB", rumple_index(selbu_flub_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="KLB", rumple_index(selbu_kl_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="KLUB", rumple_index(selbu_kl_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="SLB", rumple_index(selbu_sl_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="SLUB", rumple_index(selbu_sl_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="LAB", rumple_index(singsaas_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="LAUB", rumple_index(singsaas_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="SEB", rumple_index(sl_tydal_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="SEUB", rumple_index(sl_tydal_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="SSAB", rumple_index(stangesk_aurskog_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="SSAUB", rumple_index(stangesk_aurskog_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="SSBB", rumple_index(stangesk_eidskog_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="SSBUB", rumple_index(stangesk_eidskog_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="1BBB", rumple_index(steinkjer_1BBb_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="1BBUB", rumple_index(steinkjer_1BBb_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="2BBB", rumple_index(steinkjer_2BBb_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="2BBUB", rumple_index(steinkjer_2BBb_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="SDB", rumple_index(stig_dahlen_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="SDUB", rumple_index(stig_dahlen_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="1SB", rumple_index(sub_namdalseid_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="1SUB", rumple_index(sub_namdalseid_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="THB", rumple_index(truls_holm_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="THUB", rumple_index(truls_holm_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="1VBB", rumple_index(verdal1_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="1VBUB", rumple_index(verdal1_ub_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="2VBB", rumple_index(verdal2_b_canopyheight), MyData6$rumple_index)
MyData6$rumple_index <- ifelse(MyData6$LocalityCode=="2VBUB", rumple_index(verdal2_ub_canopyheight), MyData6$rumple_index)

write.csv(MyData6,'MyData6.csv')



# Plotting surface roughness ----------------------------------------------
library(ggplot2)

ggplot(data=MyData6, aes(x=Treatment, y=rumple_index))+geom_boxplot()+labs(y="Roughness index")+
  theme(axis.text.y   = element_text(size=12),
        axis.text.x   = element_text(size=12),
        axis.title.y  = element_text(size=12),
        axis.title.x  = element_text(size=12),
        panel.background = element_blank(),
        panel.grid.major = element_blank(), 
        panel.grid.minor = element_blank(),
        axis.line = element_line(colour = "black"),
        panel.border = element_rect(colour = "black", fill=NA, size=1))  
wilcox.test(MyData6$rumple_index[MyData6$Treatment=='Open plot'],MyData6$rumple_index[MyData6$Treatment=='Exclosure'],paired=T)
#p-value = 1.654e-07 


#Check correlation bewteen MAD and rumpleindex
p2 <- ggplot(data=MyData6, aes(x=rumple_index, y=MAD))+geom_point()
p2


cor.test(MyData6$rumple_index, MyData6$MAD, alternative = "two.sided", method = "pearson")
#      cor 0.8451068 



# Testing -----------------------------------------------------------------
#Median of median values within the different treatments
exclosure <- MyData6[MyData6$Treatment=="Exclosure",]
summary(exclosure$Median) 
hist(exclosure$Median_std) # not normally distributed --- using median
summary(exclosure$MAD)
hist(exclosure$MAD)
summary(exclosure$Median_std)

open_p <- MyData6[MyData6$Treatment=="Open plot",]
summary(open_p$Median)
hist(open_p$Median)
summary(open_p$MAD)
hist(open_p$MAD)
summary(open_p$Median_std)



# Plots presented in results ----------------------------------------------
library(readr)
MyData6 <- read_csv("~/Master - Sustherb/LidarMoose/MyData6.csv")
View(MyData6)

library(readr)
MyData7 <- read_csv("~/Master - Sustherb/LidarMoose/MyData7.csv")
View(MyData6)

library(ggplot2)

####Part 3.1####

#Canopy height growth - treatment
x1<- factor(MyData7$Treatment, levels = c('Open plot', 'Exclosure'))
chg_treat <- ggplot(data=MyData7, aes(x=x1, y=Median_std, group=LocalityName))+geom_line()+labs(y=expression(paste('Canopy height growth (m year'^'-1', ')')), x='Treatment')+scale_linetype_manual(breaks = c("Exclosure", "Open plot"), labels = c("Open plots", "Exclosures"), values=c(1,2))
chg_treat <- chg_treat+ scale_x_discrete(limits = c('Open plot', 'Exclosure'), breaks = c('Open plot', 'Exclosure'), expand = c(0.1,0))
chg_treat <- chg_treat + theme_bw()
chg_treat <- chg_treat + theme(text = element_text(size = 20))
chg_treat

#Canopy height growth - productivity
mymod2 <- lm(data = MyData7,
             log(Median_std)~productivity*Treatment)
MyData7$pred <- predict(mymod2, MyData7)
MyData7$pred_us <- exp(MyData7$pred)

chg_prod <- ggplot()+geom_point(aes(x = productivity, y = Median_std, colour= Treatment, shape=Region.x),data = MyData7)
chg_prod <- chg_prod + geom_line(aes(x = productivity, y = pred_us, colour = Treatment), data = MyData7, size = 1.5)
chg_prod <- chg_prod +  labs(y=expression(paste('Canopy height growth (m year'^'-1', ')')), x='Productivity')
chg_prod <- chg_prod + theme_bw()
chg_prod <- chg_prod + scale_color_manual(values = c("gray0", "gray60"))
chg_prod <- chg_prod + labs(colour="Treatment", shape="Region")
chg_prod <- chg_prod + theme(text = element_text(size = 20))
chg_prod

#Combining them to one panel plot
library(cowplot)
plot_grid(chg_treat, chg_prod+theme(legend.position = "none"), ncol=2)

####Part 3.2####
#Median absolute deviation - treatment
x1<- factor(MyData7$Treatment, levels = c('Open plot', 'Exclosure'))
mad_treat <- ggplot(data=MyData7, aes(x=x1, y=MAD, group=LocalityName))+geom_line()+labs(y='Median absolute deviation (m)', x='Treatment')+scale_linetype_manual(breaks = c('Open plot', 'Exclosure'), labels = c("Open plots", "Exclosures"), values=c(1,2))
mad_treat <- mad_treat+ scale_x_discrete(limits = c('Open plot', 'Exclosure'), breaks = c('Open plot', 'Exclosure'), expand = c(0.1,0))
mad_treat <- mad_treat + theme_bw()
mad_treat


#Median absolute deviation/median - treatment
x1<- factor(MyData7$Treatment, levels = c('Open plot', 'Exclosure'))
madmed_treat <- ggplot(data=MyData7, aes(x=x1, y=MAD_med, group=LocalityName))+geom_line()+labs(y='Median absolute deviation / median', x='Treatment')+scale_linetype_manual(breaks = c('Open plot', 'Exclosure'), labels = c("Open plots", "Exclosures"), values=c(1,2))
madmed_treat <- madmed_treat+ scale_x_discrete(limits = c('Open plot', 'Exclosure'), breaks = c('Open plot', 'Exclosure'), expand = c(0.1,0))
madmed_treat <- madmed_treat + theme_bw()
madmed_treat

#Median absolute deviation - productivity
mymod3 <- lm(data = MyData7,
             log(MAD)~productivity*Treatment)
MyData7$pred3 <- predict(mymod3, MyData7)
MyData7$pred_us3 <- exp(MyData7$pred3)

mad_prod <- ggplot()+geom_point(aes(x = productivity, y = MAD, colour= Treatment, shape=Region.x),data = MyData7)
mad_prod <- mad_prod + geom_line(aes(x = productivity, y = pred_us3, colour = Treatment), data = MyData7, size = 1.5)
mad_prod <- mad_prod +  labs(y="Median absolute deviation (m)", x='Productivity')
mad_prod <- mad_prod + theme_bw()
mad_prod <- mad_prod + scale_color_manual(values = c("gray0", "gray60"))
mad_prod <- mad_prod + labs(colour="Treatment", shape="Region")
mad_prod

#Median absolute deviation/median - productivity
mymod4 <- lm(data = MyData7,
             log(MAD_med)~productivity*Treatment)
MyData7$pred4 <- predict(mymod4, MyData7)
MyData7$pred_us4 <- exp(MyData7$pred4)

madmed_prod <- ggplot()+geom_point(aes(x = productivity, y = MAD_med, colour= Treatment, shape=Region.x),data = MyData7[MyData7$Median > 0.01,])
madmed_prod <- madmed_prod +  labs(y="Median absolute deviation / median", x='Productivity')
madmed_prod <- madmed_prod + theme_bw()
madmed_prod <- madmed_prod + scale_color_manual(values = c("gray0", "gray60"))
madmed_prod <- madmed_prod + labs(colour="Treatment", shape="Region")
madmed_prod

#Combining them to one panel plot
library(cowplot)
plot_grid(mad_treat,madmed_treat,mad_prod+theme(legend.position = "none"),madmed_prod+theme(legend.position = "none"))
# library(grid)
# library(gtable)
# p1 <- ggplotGrob(mad_treat)
# p2 <- ggplotGrob(madmed_treat)
# p3 <- ggplotGrob(mad_prod)
# p4 <- ggplotGrob(madmed_prod)
# 
# g1 <- rbind(p1,p2,size="last")
# g2 <- rbind(p3,p4,size="last")
# g3 <- cbind(g1,g2, size="last")
# 
# vp <- viewport(x=0.5, y=0.5, width = 0.95, height = 0.9)
# pushViewport(vp)
# grid.newpage()
# grid.draw(g3)

####Part 3.3####                  
#Correlation plots
#Scatterplot ggplot with colour representing point density

med_comp <- ggplot(data = MyData6, aes(x=Field_median, y=Median, shape=Region.x, colour=as.factor(Point.density...m.2.)))+geom_point()+ xlim(c(0,max(MyData6$Field_median, na.rm = T)))+ ylim(c(0,max(MyData6$Median, na.rm = T)))
#med_comp <- med_comp + scale_shape_manual(values = c(1,16))
med_comp <- med_comp+  geom_abline() 
med_comp <- med_comp+ xlab("Median from field data")+ylab("Median from lidar data")
med_comp <- med_comp+ labs(colour=expression(paste(ext="Point density m"^"-2")), shape="Region")
med_comp <- med_comp + theme_bw()
med_comp <- med_comp + scale_color_manual(values =c("darkgoldenrod1","deepskyblue1"))
med_comp

#Try to do it with baseplot
plot(MyData6$Field_median, MyData6$Median,
     xlab = "Median from field data",
     ylab = "Median from lidar data",
     xlim = c(0,max(MyData6$mean_of_mean, na.rm = T)),
     ylim = c(0,max(MyData6$Median, na.rm = T)))
#add reference line
abline(coef = c(0,1))


#Plot comparing field and lidar median where the dots represent the difference in median between treatments at each site
library(reshape2)
#Difference lidar data
MyData6_cast <- dcast(data = MyData6,
                      LocalityName+Region.x+Point.density...m.2. ~ Treatment, 
                      value.var = "Median")
MyData6_cast$median_diff <- MyData6_cast$Exclosure-MyData6_cast$`Open plot`

#difference field data
MyData6_cast_f <- dcast(data = MyData6,
                        LocalityName+Region.x+Point.density...m.2. ~ Treatment, 
                        value.var = "Field_median")
MyData6_cast_f$median_diff_f <- MyData6_cast_f$Exclosure-MyData6_cast_f$`Open plot`

MyData_cast <- merge(MyData6_cast_f, MyData6_cast, by="LocalityName" )
# MyData_cast[7] <- NULL
View(MyData_cast)

med_diff <- ggplot(data = MyData_cast, aes(x=median_diff_f, y=median_diff, colour=as.factor(Point.density...m.2..x), shape=Region.x.x))+geom_point()+ xlim(c(0,max(MyData_cast$median_diff_f, na.rm = T)))+ ylim(c(0,max(MyData_cast$median_diff, na.rm = T)))
med_diff <- med_diff+  geom_abline() #linja blir litt "hakkete"
med_diff <- med_diff + xlab("Difference in median between treatments from field data")+ylab("Difference in median from lidar data") 
med_diff <- med_diff+labs(color=expression(paste(ext="Point density m"^"-2")))
med_diff <- med_diff+theme_bw()
med_diff




#Making panel plot
library(egg)
p2 <- egg::ggarrange(median_comparison+ theme(legend.position="none"),p1, ncol=2)







