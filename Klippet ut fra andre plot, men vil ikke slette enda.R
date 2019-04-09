

# Productivity plots without Stig Dahlen------------------------------------------------------

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



####Fra plotting seksjon 3.2####
#Scatterplot ggplot with colour representing point density

# MyData6$density <- as.factor(MyData6$Point.density...m.2.)
# 
# med_comp <- ggplot(data = MyData6, 
#                    aes(x=Field_median, y=Median, 
#   shape=Region.x, 
#   fill=density))+
#   
#   scale_fill_manual(name = "Density", values = c("white", "black"))+
#   
#   geom_point(aes(size = density))+
#   
#   scale_size_manual(name = "density", values = c(3, 3.01))+
#                
#   xlim(c(0,max(MyData6$Field_median, na.rm = T)))+ ylim(c(0,max(MyData6$Median, na.rm = T)))
# #med_comp <- med_comp + scale_shape_manual(values = c(1,16))
# med_comp <- med_comp+  geom_abline() 
# med_comp <- med_comp+ xlab("Median from field data")+ylab("Median from lidar data")
# #med_comp <- med_comp+ labs(colour=expression(paste(ext="Point density m"^"-2")), shape="Region")
# med_comp <- med_comp + theme_bw()
# #med_comp <- med_comp + scale_color_manual(values =c("darkgoldenrod1","deepskyblue1"))
# med_comp
# 
# p <- ggplot(data=MyData6,aes(x =Field_median, y = Median, shape=Region.x, fill=density))+geom_point()
# p <- p + scale_shape_manual(values=c(21, 22, 23))
# p <- p + scale_fill_manual(values = c("black", "white"))
# 
# p <- p +  labs(y="Median absolute deviation / median", x='Productivity')
# p <- p + theme_bw()
# 
# p <- p + labs(colour="Treatment", shape="Region")
# p
# 
# 
# 
# p <- ggplot(data=MyData6,aes(x =Field_median, y = Median, shape=Region.x, fill=density))+geom_point()
# p <- p + scale_shape_manual(values=c(21, 22, 23))
# p <- p + scale_fill_manual(values = c("black", "white"))
# 
# p <- p +  labs(y="Median absolute deviation / median", x='Productivity')
# p <- p + theme_bw()
# 
# p <- p + labs(fill="Treatment", shape="Region")
# p
# # p <- ggplot(data = MyData6, aes(x=Field_median, y=Median,
# #                                 shape=Region.x,
# #                                 fill=ifelse(density=="2",Field_median, density)))
# # p  
# p <- ggplot(data=MyData6,aes(x =Field_median, y = Median, shape=Region.x, colour=density) )+geom_point()
# p <- p + scale_color_manual(values = c("black", "white"))
# p
# #Try to do it with baseplot
# plot(MyData6$Field_median, MyData6$Median,
#      xlab = "Median from field data",
#      ylab = "Median from lidar data",
#      xlim = c(0,max(MyData6$mean_of_mean, na.rm = T)),
#      ylim = c(0,max(MyData6$Median, na.rm = T)))
# #add reference line
# abline(coef = c(0,1))
# 

# med_diff <- ggplot(data = MyData_cast, aes(x=median_diff_f, y=median_diff, colour=as.factor(Point.density...m.2..x), shape=Region.x.x))+geom_point()+ xlim(c(0,max(MyData_cast$median_diff_f, na.rm = T)))+ ylim(c(0,max(MyData_cast$median_diff, na.rm = T)))
# med_diff <- med_diff+  geom_abline() #linja blir litt "hakkete"
# med_diff <- med_diff + xlab("Difference in median between treatments from field data")+ylab("Difference in median from lidar data") 
# med_diff <- med_diff+labs(color=expression(paste(ext="Point density m"^"-2")))
# med_diff <- med_diff+theme_bw()
# med_diff