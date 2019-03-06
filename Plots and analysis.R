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
median_comparison <- median_comparison + xlab("Median from field data")+ylab("Median from lidar data")
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










# Productivity plots ------------------------------------------------------
MyData7 <- MyData6[MyData6$LocalityName!="Stig Dahlen",] #Same as MyData6, but without Stig Dahlen

##Median
# standardizing for year since clear cutting
MyData7$Median_std <- MyData7$Median/(MyData7$LiDAR.data.from.year-MyData7$Year.initiated)
#MyData7$duration <- MyData7$LiDAR.data.from.year-MyData7$Clear.cut
MyData7$duration <- MyData7$LiDAR.data.from.year-MyData7$Year.initiated

plot(MyData7$duration)

#Mixed effect model
library(lmerTest)
lmer_median <- lmer(Median ~ productivity 
                             +Treatment 
                             +Treatment:productivity
                             +duration
                             +duration:Treatment  
                    +(1|LocalityName), data = MyData7)
summary(lmer_median)

lmer_median_std <- lmer(Median_std ~ productivity 
                    +Treatment 
                    +Treatment:productivity
                    +duration
                    +duration:Treatment  
                    +(1|LocalityName), data = MyData7)
summary(lmer_median_std) #noen ikke signifikante linjer

# model validation
plot(lmer_median)
qqnorm(resid(lmer_median))

plot(lmer_median_std)
qqnorm(resid(lmer_median_std))

#plot
ggplot(data=MyData7,
       aes(x = Treatment, y = Median))+
  geom_boxplot()
ggplot(data=MyData7,
       aes(x = productivity, y = Median, group = Treatment, colour = Treatment))+
  geom_smooth(method = "lm")+
  geom_point()

ggplot(data=MyData7,
       aes(x = Treatment, y = Median_std))+
  geom_boxplot()
ggplot(data=MyData7,
       aes(x = productivity, y = Median_std, group = Treatment, colour = Treatment))+
  geom_smooth(method = "lm")+
  geom_point()+
  labs(x= "Productivity", y=("Standardized Median"))

# #linear model
# lmProd<-lm(Median~productivity*Treatment,data=MyData6 )
# summary(lmProd)
# newdf<-data.frame(Treatment=c('Open plot','Exclosure'),
#                   productivity=seq(min(MyData6$productivity),max(MyData6$productivity),length.out =  100))
# newdfpred<-predict(lmProd,newdf,se.fit=T)
# newdf$pred<-newdfpred$fit
# newdf$predse<-newdfpred$se.fit
# 
# plot(df_open$productivity, df_open$Median, col="blue", xlab = "Productiviy",las=1, ylab = "Median (m)")
# points(df_exc$productivity, df_exc$Median, col="red")
# with(newdf[newdf$Treatment=='Open plot',],lines(productivity,pred,col='blue'))
# with(newdf[newdf$Treatment=='Open plot',],lines(productivity,pred+predse,col='blue',lty=2))
# with(newdf[newdf$Treatment=='Open plot',],lines(productivity,pred-predse,col='blue',lty=2))
# with(newdf[newdf$Treatment=='Exclosure',],lines(productivity,pred,col='red'))
# with(newdf[newdf$Treatment=='Exclosure',],lines(productivity,pred+predse,col='red',lty=2))
# with(newdf[newdf$Treatment=='Exclosure',],lines(productivity,pred-predse,col='red',lty=2))
# legend('topr',c('Open plot','Exclosure'),pch=1,col=c('blue','red'))

#MAD   
#Mixed effect model
library(lmerTest)
lmer_mad <- lmer(MAD ~ productivity 
                    +Treatment 
                    +Treatment:productivity
                    +duration
                    +duration:Treatment  
                    +(1|LocalityName), data = MyData7)
summary(lmer_mad)

#Validation
plot(lmer_mad)
qqnorm(resid(lmer_mad))

#plot
ggplot(data=MyData7,
       aes(x = Treatment, y = MAD))+
  geom_boxplot()
ggplot(data=MyData7,
       aes(x = productivity, y = MAD, group = Treatment, colour = Treatment))+
  geom_smooth(method = "lm")+
  geom_point()

#geom_smooth:Level of confidence interval 0.95 by default


# lmProd_MAD<-lm(MAD~productivity*Treatment,data=MyData6 )
# summary(lmProd_MAD)
# newdf_MAD<-data.frame(Treatment=c('Open plot','Exclosure'),
#                   productivity=seq(min(MyData6$productivity),max(MyData6$productivity),length.out =  100))
# newdfpred2<-predict(lmProd_MAD,newdf_MAD,se.fit=T)
# newdf_MAD$pred<-newdfpred2$fit
# newdf_MAD$predse<-newdfpred2$se.fit
# 
# plot(df_open$productivity, df_open$Median, col="blue", xlab = "Productiviy",las=1, ylab = "MAD")
# points(df_exc$productivity, df_exc$Median, col="red")
# with(newdf_MAD[newdf_MAD$Treatment=='Open plot',],lines(productivity,pred,col='blue'))
# with(newdf_MAD[newdf_MAD$Treatment=='Open plot',],lines(productivity,pred+predse,col='blue',lty=2))
# with(newdf_MAD[newdf_MAD$Treatment=='Open plot',],lines(productivity,pred-predse,col='blue',lty=2))
# with(newdf_MAD[newdf_MAD$Treatment=='Exclosure',],lines(productivity,pred,col='red'))
# with(newdf_MAD[newdf_MAD$Treatment=='Exclosure',],lines(productivity,pred+predse,col='red',lty=2))
# with(newdf_MAD[newdf_MAD$Treatment=='Exclosure',],lines(productivity,pred-predse,col='red',lty=2))
# legend('top',c('Open plot','Exclosure'),pch=1,col=c('blue','red'))
# 


#MAD/Median  <-- not significant
#Mixed effect model
library(lmerTest)
lmer_madmed <- lmer(MAD_med ~ productivity 
                 +Treatment 
                 +Treatment:productivity
                 +duration
                 +duration:Treatment  
                 +(1|LocalityName), data = MyData7)
summary(lmer_madmed)

#Validation
plot(lmer_mad)
qqnorm(resid(lmer_mad))

#plot
ggplot(data=MyData7,
       aes(x = Treatment, y = MAD))+
  geom_boxplot()
ggplot(data=MyData7,
       aes(x = productivity, y = MAD, group = Treatment, colour = Treatment))+
  geom_smooth(method = "lm")+
  geom_point()+
  labs(x="Productivity", y= "Median absolute deviation")

# lmProd_madmed<-lm(MAD_med~productivity*Treatment,data=MyData6 )
# summary(lmProd_madmed)
# newdf_madmed<-data.frame(Treatment=c('Open plot','Exclosure'),
#                   productivity=seq(min(MyData6$productivity),max(MyData6$productivity),length.out =  100))
# newdfpred3<-predict(lmProd_madmed,newdf_madmed,se.fit=T)
# newdf_madmed$pred<-newdfpred3$fit
# newdf_madmed$predse<-newdfpred3$se.fit
# 
# plot(df_open$productivity, df_open$Median, col="blue", xlab = "Productiviy",las=1, ylab = "MAD/Median")
# points(df_exc$productivity, df_exc$Median, col="red")
# with(newdf_madmed[newdf_madmed$Treatment=='Open plot',],lines(productivity,pred,col='blue'))
# with(newdf_madmed[newdf_madmed$Treatment=='Open plot',],lines(productivity,pred+predse,col='blue',lty=2))
# with(newdf_madmed[newdf_madmed$Treatment=='Open plot',],lines(productivity,pred-predse,col='blue',lty=2))
# with(newdf_madmed[newdf_madmed$Treatment=='Exclosure',],lines(productivity,pred,col='red'))
# with(newdf_madmed[newdf_madmed$Treatment=='Exclosure',],lines(productivity,pred+predse,col='red',lty=2))
# with(newdf_madmed[newdf_madmed$Treatment=='Exclosure',],lines(productivity,pred-predse,col='red',lty=2))
# legend('bottomr',c('Open plot','Exclosure'),pch=1,col=c('blue','red'))
# 



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
p2 <- ggplot(data=MyData6, aes(x=x1, y=Median, group=LocalityName,color=Region))+geom_line()+labs(y='Median Canopy Height (m)', x='Treatment')+scale_linetype_manual(breaks = c("Exclosure", "Open plot"), labels = c("Open plots", "Exclosures"), values=c(1,2))
p2 

p2 <- p2+theme(rect=element_rect(fill='white')
               ,panel.background = element_rect(fill = 'white')
               ,panel.grid = element_blank()
               ,panel_border(colour="black", remove=FALSE)
               ,axis.text=element_text(size=12,color="black")
               ,axis.title.y=element_text(size=12,color="black")
               ,axis.title.x=element_text(size=12,color="black")
               ,axis.text.x=element_text(size=12,color="black")
               ,text=element_text(size=12))+
  scale_x_discrete(limits = c("Exclosure", "Open plot"), breaks = c("Exclosure", "Open plot"), expand = c(0.1,0))

#p2 <- p2+scale_color_manual(values=c('black','gray29','gray87')) #changing colours of lines
p2 <- p2+theme(legend.position="top")
p2 

# Median absolute deviation -----------------------------------------------

#Wilcox test
wilcox.test(MyData6$MAD[MyData6$Treatment=='Open plot'],MyData6$MAD[MyData6$Treatment=='Exclosure'],paired=T)
#p-value = p-value = 1.103e-07

#Boxplot mad-treatment
p3 <- ggplot(data=MyData6, aes(x=Treatment, y=MAD))+geom_boxplot()
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
