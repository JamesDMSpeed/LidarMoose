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

library(ggplot2)


# Field data VS Lidar data ------------------------------------------------


#Field median VS LIDAR median
#wilcox.test(MyData6$Median, MyData6$Field_median, paired = T) Sjekker istedet om korrelasjonen er signifikant, ikke om forskjellen er det
#V = 453, p-value = 5.229e-05

#Scatterplot ggplot
median_comparison <- ggplot(data = MyData6, aes(x=Field_median, y=Median))+geom_point()+ xlim(c(0,max(MyData6$Field_median, na.rm = T)))+ ylim(c(0,max(MyData6$Median, na.rm = T)))
median_comparison <- median_comparison+  geom_abline() #linja blir litt "hakkete"
median_comparison <- median_comparison + xlab("Median from field data")+ylab("Median from lidar data")+ theme(axis.text.y   = element_text(size=12),
                                                                                                              axis.text.x   = element_text(size=12),
                                                                                                              axis.title.y  = element_text(size=12),
                                                                                                              axis.title.x  = element_text(size=12),
                                                                                                              panel.background = element_blank(),
                                                                                                              panel.grid.major = element_blank(), 
                                                                                                              panel.grid.minor = element_blank(),
                                                                                                              axis.line = element_line(colour = "black"),
                                                                                                              panel.border = element_rect(colour = "black", fill=NA, size=1))  

median_comparison

#Scatterplot with origin
plot(MyData6$Field_median, MyData6$Median,
     xlab = "Median from field data",
     ylab = "Median from lidar data",
     xlim = c(0,max(MyData6$Field_median, na.rm = T)),
     ylim = c(0,max(MyData6$Median, na.rm = T)))
#add reference line
abline(coef = c(0,1))

#Check correlation between field median and lidar median data
cor.test(MyData6$Field_median, MyData6$Median, alternative = "two.sided", method = "pearson")

#Alternative=two.sided ->       cor 0.7621236   
#Alternative=greater   ->       cor 0.7621236 
# samme for "Less" også
#when the term "correlation coefficient" is used without further qualification, it usually refers to the Pearson


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
par(mfrow=c(1,2))
##Field median of mean vs lidar median
plot(MyData6$median_of_mean, MyData6$Median,
     xlab = "Median of mean, field values",
     ylab = "Median from lidar data",
     xlim = c(0,max(MyData6$median_of_mean, na.rm = T)),
     ylim = c(0,max(MyData6$Median, na.rm = T)))
#add reference line
abline(coef = c(0,1))

#checking correation
cor.test(MyData6$median_of_mean, MyData6$Median, alternative = "two.sided", method = "pearson")
#cor: 0.7786235  

##Field mean of median vs lidar median
plot(MyData6$mean_of_median, MyData6$Median,
     xlab = "Mean of median, field values",
     ylab = "Median from lidar data",
     xlim = c(0,max(MyData6$mean_of_median, na.rm = T)),
     ylim = c(0,max(MyData6$Median, na.rm = T)))
#add reference line
abline(coef = c(0,1))

#checking correation
cor.test(MyData6$mean_of_median, MyData6$Median, alternative = "two.sided", method = "pearson")
#cor: 0.7685942  










# Productivity plots without Stig Dahlen------------------------------------------------------
MyData7 <- MyData6[MyData6$LocalityName!="Stig Dahlen",] #Same as MyData6, but without Stig Dahlen

##Median
# standardizing for year since clear cutting
MyData7$Median_std <- MyData7$Median/(MyData7$LiDAR.data.from.year-MyData7$Year.initiated)
#MyData7$duration <- MyData7$LiDAR.data.from.year-MyData7$Clear.cut
MyData7$duration <- MyData7$LiDAR.data.from.year-MyData7$Year.initiated

plot(MyData7$duration)

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
# lmer_median_std <- lmer(Median_std ~ productivity 
#                     +Treatment 
#                     +Treatment:productivity
#                     +duration
#                     +duration:Treatment  
#                     +(1|LocalityName), data = MyData7)
# summary(lmer_median_std) #noen ikke signifikante linjer

# model validation - looks ok
plot(lmer_median)
qqnorm(resid(lmer_median))

# How does the predict() function do?:
mymod2 <- lm(data = MyData7,
             log(Median_std)~productivity*Treatment)
MyData7$pred <- predict(mymod2, MyData7)
MyData7$pred_us <- exp(MyData7$pred)
ggplot()+
  geom_point(aes(x = productivity, y = Median_std, colour= Treatment), data = MyData7)+
  geom_line(aes(x = productivity, y = pred_us, colour = Treatment), data = MyData7, size = 1.5)+
  labs(y="Canopy height growth (m/year)", x="Productivity")+
  theme(axis.text.y   = element_text(size=12),
       axis.text.x   = element_text(size=12),
       axis.title.y  = element_text(size=12),
       axis.title.x  = element_text(size=12),
       panel.background = element_blank(),
       panel.grid.major = element_blank(), 
       panel.grid.minor = element_blank(),
       axis.line = element_line(colour = "black"),
       panel.border = element_rect(colour = "black", fill=NA, size=1))  



# #Adding model to data frame to be able to plot it. 
# MyData7$ALKpred <- predict(lmer_median, MyData7, se.fit=F)
# MyData7$ALKpred_bt <- exp(MyData7$ALKpred)
# ALKmod <- lm(log(MyData7$Median_std)~MyData7$productivity*MyData7$Treatment)
# newdf<-data.frame(Treatment = MyData7$Treatment, 
#   productivity=seq(min(MyData7$productivity),max(MyData7$productivity),length.out =  nrow(MyData7)))
# 
# newdfpred<-predict(ALKmod,newdf,se.fit=F)
# newdf$pred_bf<-exp(newdfpred)
# 
# 
# MyData7$model_med <- predict(ALKmod)
# MyData7$BT_model_med <- exp(MyData7$model_med)
# MyData7$Median_l <- log(MyData7$Median)


# summary(MyData7$Median)
# #plotting predicited and observed values together. 
# library(ggplot2)
# ggplot(MyData7,aes(x=productivity, y=Median, colour=Treatment)) + 
#   geom_point(alpha = 0.3) +
#   geom_line(aes(y=MyData7$ALKpred_bt))
#   #geom_line(aes(y=newdf$pred_bf, x=newdf$productivity))
#   #stat_smooth(method = "lm")+
# 
# plot(MyData7$ALKpred_bt[MyData7$Treatment=="Exclosure"], MyData7$productivity[MyData7$Treatment=="Exclosure"])
# lines(MyData7$Median,MyData7$productivity)
# #plotting
# ggplot(data=MyData7,
#        aes(x = Treatment, y = Median_std))+
#   geom_boxplot()
# ggplot(data=MyData7,
#        aes(x = productivity, y = (Median_std), group = Treatment, colour = Treatment))+
#   geom_smooth(method = "lm")+
#   geom_point()+
#   labs(x= "Productivity", y=('Median / (years from project start to lidar data) (m)'))+
#   theme(axis.text.y   = element_text(size=12),
#         axis.text.x   = element_text(size=12),
#         axis.title.y  = element_text(size=12),
#         axis.title.x  = element_text(size=12),
#         panel.background = element_blank(),
#         panel.grid.major = element_blank(), 
#         panel.grid.minor = element_blank(),
#         axis.line = element_line(colour = "black"),
#         panel.border = element_rect(colour = "black", fill=NA, size=1))  

  

MAD   
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
ggplot()+
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

#geom_smooth:Level of confidence interval 0.95 by default



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
ggplot()+
  geom_point(aes(x = productivity, y = MAD_med, colour= Treatment), data = MyData7)+
  geom_line(aes(x = productivity, y = pred_us3, colour = Treatment), data = MyData7, size = 1.5)+
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
x1<- factor(MyData6$Treatment, levels = c('Exclosure', 'Open plot'))
p2 <- ggplot(data=MyData6, aes(x=x1, y=Median_std, group=LocalityName, color=Region.x))+geom_line()+labs(y='Median / (years from project start to lidar data) (m)', x='Treatment')+scale_linetype_manual(breaks = c("Exclosure", "Open plot"), labels = c("Open plots", "Exclosures"), values=c(1,2))
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

#Getting figures side-by side (mad and median)
library(egg)
MAD_madmed <- egg::ggarrange(p3,p10, ncol=2)


#vioplot
p11 <- ggplot(data=MyData6, aes(x=Treatment, y=MAD_med))+geom_violin()
p11
