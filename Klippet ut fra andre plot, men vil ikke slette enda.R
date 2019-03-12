

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

