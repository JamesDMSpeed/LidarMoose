rescale.coefs <- function(beta,mu,sigma) {
  beta2 <- beta ## inherit names etc.
  beta2[-1] <- beta[-1]/(2*sigma[-1])
  beta2[1]  <- beta[1]-sum(beta2[-1]*mu[-1])
  beta2
}

m1 <- lm(Illiteracy~.,as.data.frame(state.x77))
b1 <- coef(m1)
#Make a scaled version of the data:
  
ss <- scale(state.x77)
#Scaled coefficients:
  
m1S <- update(m1,data=as.data.frame(ss))
b1S <- coef(m1S)
#Now try out rescaling:
  
icol <- which(colnames(state.x77)=="Illiteracy")
p.order <- c(icol,(1:ncol(state.x77))[-icol])
m <- colMeans(state.x77)[p.order]
s <- apply(state.x77,2,sd)[p.order]
all.equal(b1,rescale.coefs(b1S,m,s))  ## TRUE



#If you scale only the predictors and not the response, then submit c(0,mean(predictors)) for m and c(1,sd(predictors)) for s.

library(arm)
myd <- (as.data.frame(state.x77))
myd$f <- rep(c("A", "B"), length.out=nrow(myd))
m1 <- lm(Illiteracy~Income+Murder+f, 
         myd)
class(m1)
m1S2 <- arm::standardize(m1)
display(m1)
display(m1S2)

b1 <- coef(m1)
b1S2 <- coef(m1S2)
#Now try out rescaling:

icol <- which(colnames(myd)=="Illiteracy")
icol2 <- which(colnames(myd)=="Income")
icol3 <- which(colnames(myd)=="Murder")
icol4 <- which(colnames(myd)=="f")

p.order <- c(icol,icol2, icol3, icol4)

m <- colMeans(myd)[p.order]
s <- apply(myd,2,sd)[p.order]

all.equal(b1,rescale.coefs(b1S2,m,s))  ## TRUE
