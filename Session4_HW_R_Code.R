#Homework for Session 4
#Author: Asher Dvir-Djerassi (worked with Fabian)
#September 30, 2016


# Load the package
# NOTE: Uncomment this line if need to install package
#install.packages("MASS", repos="http://cran.rstudio.com/")
require(MASS)

#1---------------------------------
#As stated in class, the regression did not include a beta_0 coefficient

#2---------------------------------
# Our data set is named `out`, which we split into y and X
y <- out[, 2]
x <- out[, 1]
#We add a beta_0 coefficient
x_1 <- rep(1, time = 50)
X <- cbind(x, x_1)

# Now carry out intermediate calculations
XT = t(X)
XTX = XT%*%X
invXTX = solve(XTX)
XTy = XT%*%y
beta = invXTX %*% XTy
beta

# Now add this line to the plot
plot(out)
abline(lm(out[,2]~out[,1]), col="red") # regression line (y~x) 
abline(a=0, b=beta, col="blue")

#3------------------------------------
# Set the correlation parameter and mean
beta = 0.5
SIGMA = matrix(c(1,beta,beta,1), ncol=2)
MU = c(2.0, 1.0, 3.0)
A
beta_1 = 0.5
beta_2 = 0.7

SIGMA_2 = matrix(c(1,beta_1, beta_2, beta_1, 1, beta_2, beta_2, beta_1, 1), ncol = 3)
return(SIGMA_2)

# Set the sample size
N = 1000

# Draw your sample
out <- mvrnorm(N, mu = MU, Sigma = SIGMA_2)

# Look at a section of the data
dim(out)
out[1:10,]

# Our data set is named `out`, which we split into y and X
z <- out[, 1]
y <- out[, 3]
x <- out[, 2]

x_1 <- rep(1, time=50)
x_1
X <- cbind(z, x, x_1)



# Now carry out intermediate calculations
XT = t(X)
XTX = XT%*%X
invXTX = solve(XTX)
XTy = XT%*%y
beta = invXTX %*% XTy
beta

# Add additional coefficient, regression includes constant
lm (y ~ z + x)

#4-------------------------------

#USING THE CODE PREVIOUSLY USED DOES NOT WORK
#Redo above commands, but adjusted for the additonal regressor
#mu_2 <- c(runif(10,0,10))
#SIGMA_3 = matrix(c(runif(10,0,10)), ncol = 100)
#return(SIGMA_3)
# Set the sample size
#N = 100
# Draw your sample
#out <- mvrnorm(N, mu=mu_2, Sigma = SIGMA_3)

#I create randomly generated data, then paste that data into a csv file that I upload into r studio

# I create random data using the props function                
props <- function(ncol, nrow, var.names=NULL){
  if (ncol < 2) stop("ncol must be greater than 1")
  p <- function(n){
    y <- 0
    z <- sapply(seq_len(n-1), function(i) {
      x <- sample(seq(0, 1-y, by=.01), 1)
      y <<- y + x
      return(x)
    }
    )
    w <- c(z , 1-sum(z))
    return(w)
  }
  DF <- data.frame(t(replicate(nrow, p(n=ncol))))
  if (!is.null(var.names)) colnames(DF) <- var.names
  return(DF)
}

props(ncol=3, nrow=15)
hist(ncol = 1)

#I copied that data into a csv off screen and read that data into r studio 
Randomly.Generated.Data.for.Problem.4 <- read.csv("C:/Users/Asher/OneDrive/Progam_Econ/Session4_HW/Randomly Generated Data for Problem 4.csv", row.names=1) 


#Create a vector of means - not necessary for this incorrect approach.
#Means are given by data
mean(Randomly.Generated.Data.for.Problem.4$X1)
mean(Randomly.Generated.Data.for.Problem.4$X2)
mean(Randomly.Generated.Data.for.Problem.4$X3)

#Create a correlation matrix
library("Hmisc")
CorrelationMatrix <- rcorr(as.matrix(Randomly.Generated.Data.for.Problem.4))
CorrelationMatrix

#Estimate the effect of x2 and x3 on x1
beta_0 <- rep(1, time=15)
lm (Randomly.Generated.Data.for.Problem.4$X1 ~ Randomly.Generated.Data.for.Problem.4$X2 + Randomly.Generated.Data.for.Problem.4$X3)





