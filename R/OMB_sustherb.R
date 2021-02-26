## Sustherb
## 26.02.2021

## Installasjon av lasR
## Trenger devtools for installasjon av lasR
#install.packages("devtools")
library(devtools)
install_github("hansoleorka/lasR")
library(lasR)

## Med denne koden f?r du alle n?dvendige laservariabler
## laserh?yder = dz, plotID = ID, gtv= terskelverdi
laservar<-laser.metrics(data$dz, data$ID, gtv = 0.5)

## Leser inn data
setwd("..")
dat<-read.csv(file="compiledDataset.csv", sep=",")

## Lager funksjon for inverse hyperbolic sine
ihs <- function(x) { 
  transformed <- log(x + sqrt(x^2+1)); 
  return(transformed) }

##Transformerer variabler
dat$lnD6<-log(dat$D6)
dat$lnD9<-log(dat$D9)
dat$sinHsk<-ihs(dat$Hskew)
dat$sinH30<-ihs(dat$H30)

## Funksjon - 1999
AGB1999<-function(a,b,c,d){
  agb<-exp(38.55 + 0.75*a + 0.63*b + 1.68*c + 0.78*d)
  return(agb)
}

## Funksjon 2010
AGB2010<-function(a,b,c,d){
  agb<-exp(0.99 + 3.26*a + 0.47*b + 1.12*c + 0.37*d)
  return(agb)
}

## Predikerer med AGB1999 - ser ikke ut til ? v?re riktig formulert i paperet
## Det kan v?re at det rett og slett at responsen ikke er ln(AGB)
## men p? original skala (som AGB199b)
dat$AGB<-AGB1999(dat$lnD6, dat$lnD9, dat$sinHsk, dat$sinH30)

## Funksjon - 1999
AGB1999b<-function(a,b,c,d){
  agb<-38.55 + 0.75*a + 0.63*b + 1.68*c + 0.78*d
  return(agb)
}
## Et fors?k med logiske verdier p? forklaringsvar - AGB2010 ser ut til ? v?re riktig
AGB1999(log(0.3), log(0.2), ihs(0.25), ihs(2))
AGB1999b(log(0.3), log(0.2), ihs(0.25), ihs(2))
AGB2010(0.5, log(1), log(2), 0.25^2)
