\encoding{latin1}
\name{dcircmix}
\alias{dcircmix}
\alias{rcircmix}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Mixtures of circular distributions }
\description{
   Density and random generation functions for a circular distribution or a mixture of circular distributions allowing the following components: circular 
   uniform, von Mises, cardioid, wrapped Cauchy, wrapped normal, wrapped skew-normal. 
}
\usage{
dcircmix(x, model=NULL, dist=NULL, param=NULL)
rcircmix(n, model=NULL, dist=NULL, param=NULL)
}
\arguments{
  \item{x}{ Vector of angles where the density is evaluated. The object is coerced to class \code{\link{circular}}.}
  \item{n}{ Number of observations to generate.}
  \item{model}{ Number between 1 and 20, corresponding with a model defined in Oliveira et al. (2012). See Details.}
  \item{dist}{ Vector of strings with the distributions that participate in the mixture: \code{"unif"}, \code{"vm"}, \code{"car"}, \code{"wc"}, \code{"wn"}, 
		\code{"wsn"}.}
  \item{param}{ List with three or four objects. The first object will be a vector containing the proportion of each distribution in the mixture, 
	        the second object will be a vector containg the location parameters and the third object will be a vector containing the concentration
		parameters. If the wrapped skew-normal distribution participates in the mixture, a fourth object will be introduced in the list, a vector
                containing the skewness parameter. In this case, the values of the skewness parameter for the rest of distributions in the mixture will be 
	        zero. The length of each object in the list must be equal to the length of argument \code{dist}. See Details and Examples.}
}
\details{
Models from Oliveira et al. (2012) are described below:

M1: Circular uniform.

M2: von Mises: \eqn{vM(\pi,1)}.

M3: Wrapped normal: \eqn{WN(\pi,0.9)}.

M4: cardioid: \eqn{C(\pi,0.5)}.

M5: Wrapped Cauchy: \eqn{WC(\pi,0.8)}.

M6: Wrapped skew--normal: \eqn{WSN(\pi,1,20)}.

M7: Mixture of two von Mises \eqn{1/2 vM(0,4) + 1/2 vM(\pi,4)}.

M8: Mixture of two von Mises \eqn{1/2 vM(2,5) + 1/2 vM(4,5)}.

M9: Mixture of two von Mises \eqn{1/4 vM(0,2) + 3/4 vM(\pi/\sqrt{3},2)}.

M10: Mixture of von Mises and wrapped Cauchy \eqn{4/5 vM(\pi,5) + 1/5 WC(4\pi/3,0.9)}.

M11: Mixture of three von Mises \eqn{1/3 vM(\pi/3,6) + 1/3 vM(\pi,6) + 1/3 vM(5\pi/3,6)}.

M12: Mixture of three von Mises \eqn{2/5 vM(\pi/2,4) + 1/5 vM(\pi,5) + 2/5 vM(3\pi/2,4)}.

M13: Mixture of three von Mises \eqn{2/5 vM(0.5,6) + 2/5 vM(3,6) + 1/5 vM(5,24)}.
 
M14: Mixture of four von Mises  \eqn{1/4 vM(0,12) + 1/4 vM(\pi/2,12) + 1/4 vM(\pi,12) + 1/4 vM(3\pi/2,12)}.

M15: Mixture of wrapped Cauchy, wrapped normal, von Mises and wrapped skew-normal 
\eqn{3/10 WC(\pi-1,0.6) + 1/4 WN(\pi+0.5,0.9) + 1/4 vM(\pi+2,3) + 1/5 WSN(6,1,3)}.

M16: Mixture of five von Mises \eqn{1/5 vM(\pi/5,18) + 1/5 vM(3\pi/5,18) + 1/5 vM(\pi,18) + 
1/5 vM(7\pi/5,18) + 1/5 vM(9\pi/5,18)}.

M17: Mixture of cardioid and wrapped Cauchy \eqn{2/3 C(\pi,0.5) + 1/3 WC(\pi,0.9)}.

M18: Mixture of four von Mises  \eqn{1/2 vM(\pi,1) + 1/6 vM(\pi-0.8,30) + 1/6 vM(\pi,30) + 1/ vM(\pi+0.8,30)}.

M19: Mixture of five von Mises \eqn{4/9 vM(2,3) + 5/36 vM(4,3) + 5/36 vM(3.5,50) + 5/36 vM(4,50) + 5/36 vM(4.5,50)}.

M20: Mixture of two wrapped skew-normal and two wrapped Cauchy \eqn{1/3 WSN(0,0.7,20) + 1/3 WSN(\pi,0.7,20) + 1/6 WC(3\pi/4,0.9) + 1/6 WC(7\pi/4,0.9)}.


When the wrapped skew-normal distribution participates in the mixture, the argument \code{param} for function \code{dcircmix} can be a list with fifth 
objects. The fifth object would be the number of terms to be used in approximating the density function of the wrapped skew normal distribution. By default
the number of terms used is 20.

}

\value{
\code{dcircmix} gives the density and \code{rcircmix} generates random deviates. 
}

\references{Oliveira, M., Crujeiras, R.M. and Rodríguez--Casal, A. (2012) A plug--in rule for bandwidth selection in circular density. \emph{Computational Statistics and Data Analysis}, \bold{56}, 3898--3908.

Oliveira, M., Crujeiras R.M. and Rodríguez--Casal, A. (2014) NPCirc: an R package for nonparametric circular methods. \emph{Journal of Statistical Software}, 
\bold{61}(9), 1--26. \url{http://www.jstatsoft.org/v61/i09/}
}

\author{ María Oliveira, Rosa M. Crujeiras and Alberto Rodríguez--Casal}


\examples{
set.seed(2012)
# Circular representation of models M1-M20, each one in a separate window
for (i in 1:20){
dev.new()
f <- function(x) dcircmix(x, model=i)
curve.circular(f, n=500, join=TRUE, shrink=1.9, main=i)
}

# Random generation from model M1 (uniform model)
data1 <- rcircmix(50, model=1)
plot(data1)

# Density function and random generation from a mixture of a von Mises and
# a wrapped skew-normal
f <- function(x) dcircmix(x, model=NULL, dist=c("vm","wsn"),
param=list(p=c(0.5,0.5), mu=c(0,pi), con=c(1,1), sk=c(0,10)))
curve.circular(f, n=500, shrink=1.2)
data <- rcircmix(100, model=NULL, dist=c("vm","wsn"),
param=list(p=c(0.5,0.5), mu=c(0,pi), con=c(1,1), sk=c(0,10)))
points(data)

# Density function and random generation from a mixture of two von Mises and
# two wrapped Cauchy
f <- function(x) dcircmix(x, model=NULL, dist=c("vm","vm","wc","wc"),
param=list(p=c(0.3,0.3,0.2,0.2), mu=c(0,pi,pi/2,3*pi/2), con=c(5,5,0.9,0.9)))
curve.circular(f, n=1000, xlim=c(-1.65,1.65))
data <- rcircmix(100, model=NULL, dist=c("vm","vm","wc","wc"),
param=list(p=c(0.3,0.3,0.2,0.2), mu=c(0,pi,pi/2,3*pi/2), con=c(5,5,0.9,0.9)))
points(data)
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ circular density }% __ONLY ONE__ keyword per line
