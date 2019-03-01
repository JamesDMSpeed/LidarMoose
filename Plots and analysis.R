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

library(ggplot2)


# Field data VS Lidar data ------------------------------------------------


#Field median VS LIDAR median
wilcox.test(MyData6$Median, MyData6$Field_median, paired = T)
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

#Alternative=two.sided -> 0.747673  
#Alternative=greater   -> 0.747673 
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
#cor: 0.7663498 

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
#cor: 0.7603712 

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
#cor: 0.754108 










# Productivity plots ------------------------------------------------------
#Median
 df_open <- MyData6[MyData6$Treatment=='Open plot',] #blue
 df_exc <- MyData6[MyData6$Treatment=='Exclosure',] #red

# First curve is plotted
plot(df_open$productivity, df_open$Median, col="blue", xlab = "Productiviy", ylab = "Median (m)")

# Add second curve to the same plot by calling points() and lines()
points(df_exc$productivity, df_exc$Median, col="red")
abline(lm(df_open$Median ~ df_open$productivity), col="blue")
abline(lm(df_exc$Median ~ df_exc$productivity), col="red")


#MAD
# First curve is plotted
plot(df_open$productivity, df_open$MAD, col="blue",xlab = "Productiviy", ylab = "MAD")

# Add second curve to the same plot by calling points() and lines()
points(df_exc$productivity, df_exc$MAD, col="red")
abline(lm(df_open$MAD ~ df_open$productivity), col="blue")
abline(lm(df_exc$MAD ~ df_exc$productivity), col="red")

#Labels on ablines???


#ANOVA
anova(lm(df_open$Median ~ df_open$productivity))
anova(lm(df_exc$Median ~ df_exc$productivity))
