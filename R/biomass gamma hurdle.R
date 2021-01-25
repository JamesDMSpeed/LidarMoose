
```{r}
dat2$non_zero <- ifelse(dat2$AGB==0, 0,1)
ggplot(dat2, aes(x = prod, y = AGB, colour = as.factor(non_zero))) + geom_point()

```
```{r}
m1 <- glmmTMB(data = dat2, 
              non_zero ~ Treatment*prod + (1|LocalityName), 
              family = binomial(link = logit))
summary(m1)
m1v2 <- glmmTMB(data = dat2, 
                non_zero ~ Treatment+prod + (1|LocalityName), 
                family = binomial(link = logit))

m1v3 <- glmmTMB(data = dat2, 
                non_zero ~ Treatment + (1|LocalityName), 
                family = binomial(link = logit))
AIC(m1, m1v2, m1v3)
summary(m1v2)
```

```{r}
m2 <- glmmTMB(data = subset(dat2, non_zero == 1), 
              AGB~Treatment*prod + (1|LocalityName), 
              family = Gamma(link = log))
m2v2 <- glmmTMB(data = subset(dat2, non_zero == 1), 
                AGB~Treatment+prod + (1|LocalityName), 
                family = Gamma(link = log))
m2v3 <- glmmTMB(data = subset(dat2, non_zero == 1), 
                AGB~Treatment + (1|LocalityName), 
                family = Gamma(link = log))
summary(m2)

AIC(m2, m2v2, m2v3)
summary(m2v2)
```


```{r}
bin <- summary(m1v2)

binI <- plogis(bin$coefficients$cond[1,1])
binT <- plogis(bin$coefficients$cond[2,1])
binP <- plogis(bin$coefficients$cond[3,1])

gamma <- summary(m2v2)
gamma$coefficients$cond[,1]
gammaI <- exp(gamma$coefficients$cond[1,1])
gammaT <- exp(gamma$coefficients$cond[2,1])
gammaP <- exp(gamma$coefficients$cond[3,1])

dat2$TreatmentNum <- ifelse(dat2$Treatment=="Open plot", 0, 1)


dat2$predAGB <- exp(log(binI) + log(gammaI))+
  dat2$TreatmentNum*(exp(log(binT) + log(gammaT)))+
  dat2$prod*(exp(log(binP) + log(gammaP)))

pred1 <- predict(m1v2, se = TRUE, type = "link")
pred2 <- predict(m2v2, se = TRUE, type = "link")

dat2$predAGBbin <- pred1$fit

datt <- dat2[dat2$non_zero==1,]
datt$predAGBgamma <- pred2$fit


plot(dat2$AGB, dat2$predAGB)

```
```{r}
ggplot(dat2, aes(x = prod, y = AGB, colour = as.factor(non_zero))) + 
  geom_point()+
  geom_line(aes(x=prod, y=plogis(predAGBbin), colour=Treatment))+
  geom_line(dat=datt, aes(x=prod, y=exp(predAGBgamma), colour=Treatment))

#geom_line(aes(x=prod, y=predAGB, colour=Treatment))

```


Hmm,,,
```{r}
mean(dat2$AGB) #2.241339
(myMean <- exp(log(binI) + log(gammaI))+
    0.5*(exp(log(binT) + log(gammaT)))+
    mean(dat2$prod)*(exp(log(binP) + log(gammaP)))) #11.6
```


Fuck it, let's just present a violin plot and people can judge 