
"""
Origin: Homework 1
Filename: session1_HW.r
Author: Asher Dvir-Djerassi
Last Modified: 22 Sept, 2016
"""

print ("hello world")



#Origin: Tyler Code for Week 2
#Author: Asher copying Tyler
#Title: Session2_HW
#Last Modified Sept 23, 2016
w<-100
x<-100
x == w
typeof(w)
r=runif(1)
r
p<-0.5
u<-runif(1)
if(u<=1-p){
  x<-0
}else{
  x<-1
}
x
number<-1
number==1
number==2
vector <- c(1.0, 2.0, 3.0)
matrix <- matrix(c(vector, vector), nrow=3, ncol=2)
array <- array(c(vector, vector, vector, vector), dim=c(3,2,2))

print("Dimension")

print(dim(vector))
print(dim(matrix))
print(dim(array))

print("Length")

print(length(vector))
print(length(matrix))
print(length(array))
new_vector <- vector + c(0, 0, 1)
print(vector)
print(new_vector)
print(vector == new_vector)

w <- 100 # Initial wealth
p <- 0.5 # Probability of a win


sprintf("You started with $%s", w)

# A random draw
u <- runif(1)
if(u <= 1 - p){
  print("You lose!")
  x <- 0
  w <- w - 1
} else {
  print("You win!")
  x <- 1
  w <- w + 1
}
sprintf("Now you've got $%s.", w)

I<-10 
for(i in 1:I){
  print (sprintf("i=%s", i))
}