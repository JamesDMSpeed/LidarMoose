#Plots and analysis

library(readr)
Data_prod_field <- read_csv("~/Master - Sustherb/LidarMoose/Data_prod_field.csv")
View(Data_prod_field)

library(ggplot2)


# Field data VS Lidar data ------------------------------------------------


#Field median VS LIDAR median
wilcox.test(Data_prod_field$Median, Data_prod_field$Field_median, paired = T)
#V = 541, p-value = 6.834e-05

#Scatterplot ggplot
median_comparison <- ggplot(data = Data_prod_field, aes(x=Field_median, y=Median))+geom_point()+ xlim(c(0,max(Data_prod_field$Field_median, na.rm = T)))+ ylim(c(0,max(Data_prod_field$Median, na.rm = T)))
median_comparison <- median_comparison+  geom_abline() #linja blir litt "hakkete"
median_comparison <- median_comparison + xlab("Median from field data")+ylab("Median from lidar data")
median_comparison

  #Scatterplot with origin
plot(Data_prod_field$Field_median, Data_prod_field$Median,
     xlab = "Median from field data",
     ylab = "Median from lidar data",
     xlim = c(0,max(Data_prod_field$Field_median, na.rm = T)),
     ylim = c(0,max(Data_prod_field$Median, na.rm = T)))
#add reference line
abline(coef = c(0,1))

#Check correlation between field median and lidar median data
cor.test(Data_prod_field$Field_median, Data_prod_field$Median, alternative = "less", method = "pearson")

#Alternative=two.sided -> 0.7621236 
#Alternative=greater   -> 0.7621236
# samme for "Less" også
#when the term "correlation coefficient" is used without further qualification, it usually refers to the Pearson


##consider field mean also?




