\encoding{latin1}
\name{dwsn}
\alias{dwsn}
\alias{rwsn}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Wrapped skew-Normal density function }
\description{
   Density function and random generation for the wrapped skew-Normal distribution introduced by Pewsey (2000). 
}
\usage{
dwsn(x,xi,eta,lambda,K=NULL,min.k=20)
rwsn(n,xi,eta,lambda)
}
\arguments{
  \item{x}{ Vector of angles where the density is evaluated . The object is coerced to class \code{\link{circular}}.}
  \item{n}{ Number of observations.}
  \item{xi}{ Location parameter. The object is coerced to class \code{\link{circular}}.}
  \item{eta}{ Scale parameter.}
  \item{lambda}{ Skewness parameter.}
  \item{K}{ Number of terms to be used in approximating the density. Default \code{K=NULL}.}
  \item{min.k}{ Minimum number of terms used in approximating the density.}
}
\details{
  The NAs will be automatically removed.
}
\value{
  \code{dwsn} gives the density and \code{rwsn} generates random deviates. 
}
\references{ 
Pewsey, A. (2000) The wrapped skew--Normal distribution on the circle. \emph{Communications 
in Statistics - Theory and Methods}, \bold{29}, 2459--2472.
}

\author{ María Oliveira, Rosa M. Crujeiras and Alberto Rodríguez--Casal}

%\seealso{\code{\link{dcircmix}}, \code{\link{rcircmix}} }

\examples{
set.seed(2012)
# Density function of a wrapped skew-normal distribution WSN(pi,1,20)
wsn <- function(x) dwsn(x, xi=circular(pi), eta=1, lambda=20)
curve.circular(wsn,n=500,xlim=c(-1.65,1.65),main=expression(WSN(pi,1,20)))
# Random generation
data<-rwsn(50,xi=circular(pi),eta=1,lambda=20)
points(data)
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ circular density }% __ONLY ONE__ keyword per line
