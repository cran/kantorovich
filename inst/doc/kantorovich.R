## -----------------------------------------------------------------------------
mu <- nu <- c(1/3, 1/3, 1/3)

## -----------------------------------------------------------------------------
library(kantorovich)
ejoinings(mu, nu)

## -----------------------------------------------------------------------------
kantorovich(mu, nu)

## ----message=FALSE, warning=FALSE---------------------------------------------
library(gmp)
mu <- nu <- as.bigq(c(1,1,1), c(3,3,3)) # shorter: as.bigq(c(1,1,1), 3) 
ejoinings(mu, nu)

## -----------------------------------------------------------------------------
mu <- as.bigq(c(1,2,4), 7)
nu <- as.bigq(c(3,1,5), 9)
names(mu) <- names(nu) <- c("a", "b", "c")

## -----------------------------------------------------------------------------
M <- matrix(
  c(
    c(0, 1, 2),
    c(1, 0, 4),
    c(2, 4, 0)
  ), 
  byrow = TRUE, nrow = 3,
  dimnames = list(c("a","b","c"), c("a","b","c")))
kantorovich(mu, nu, dist=M)

## -----------------------------------------------------------------------------
M <- matrix(
  c(
    c("0", "3/13", "2/13"),
    c("1/13", "0", "4/13"),
    c("2/13", "4/13", "0")
  ), 
  byrow = TRUE, nrow = 3,
  dimnames = list(c("a","b","c"), c("a","b","c")))
kantorovich(mu, nu, dist=M)

## -----------------------------------------------------------------------------
rho <- function(x,y){
  if(x==y) {
    return(0)
  } else {
    if(x=="a" && y=="b") return(1)
    if(x=="a" && y=="c") return(2)
    if(x=="b" && y=="c") return(4)
    return(rho(y,x))
  } 
}
kantorovich(mu, nu, dist=rho)

## -----------------------------------------------------------------------------
names(mu) <- names(nu) <- 1:3

## -----------------------------------------------------------------------------
names(mu)

## -----------------------------------------------------------------------------
rho <- function(x,y){
  x <- as.numeric(x); y <- as.numeric(y)
  return(as.bigq(abs(x-y), 1+abs(x-y)))
}
kantorovich(mu, nu, dist=rho)

## -----------------------------------------------------------------------------
mu <- as.bigq(c(1,2,4), 7)
nu <- as.bigq(c(3,1), 4)
names(mu) <- c("a", "b", "c") 
names(nu) <- c("b", "c")
ejoinings(mu, nu)
kantorovich(mu, nu)

## -----------------------------------------------------------------------------
nu <- as.bigq(c(0,3,1), 4)
names(nu) <- c("a", "b", "c") 

## ----collapse=TRUE------------------------------------------------------------
mu <- c(1,2,4)/7
nu <- c(3,1,5)/9
M <- matrix(
  c(
    c(0, 1, 2),
    c(1, 0, 4),
    c(2, 4, 0)
  ), 
  byrow = TRUE, nrow = 3)
kanto_lp <- kantorovich_lp(mu, nu, dist=M)
kanto_glpk <- kantorovich_glpk(mu, nu, dist=M)
kanto_CVX <- kantorovich_CVX(mu, nu, dist=M)

## ----collapse=TRUE------------------------------------------------------------
print(kanto_lp, digits=22)
print(kanto_glpk, digits=22)
print(kanto_CVX, digits=22)
print(13/63, digits=22)

