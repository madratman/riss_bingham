\encoding{latin1}
\name{kern.den.circ}
\alias{kern.den.circ}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Nonparametric circular kernel density estimation }
\description{
   This function computes circular kernel density estimates with the given bandwidth, taking the von Mises distribution as circular kernel.
}
\usage{
kern.den.circ(x, t=NULL, bw=NULL, from=circular(0), to=circular(2*pi), len=250)
}
\arguments{
 
  \item{x}{ Data from which the estimate is to be computed. The object is coerced to class \code{\link{circular}}.}
  \item{t}{ Points where the density is estimated. If \code{NULL} equally spaced points are used according to the parameters \code{from}, \code{to} and \code{len}.}
  \item{bw}{ Smoothing parameter to be used. The value of the smoothing parameter can be chosen by using the functions \code{\link{bw.rt}}, \code{\link{bw.CV}}, 
             \code{\link{bw.pi}} and \code{\link{bw.boot}}.}
  \item{from, to}{ Left and right-most points of the grid at which the density is to be estimated. The objects are coerced to class \code{\link{circular}}.}
  \item{len}{ Number of equally spaced points at which the density is to be estimated.}
}
\details{
  The NAs will be automatically removed.
}
\value{
An object with class \code{\link{density.circular}} whose underlying structure is a list containing the following components: 

\item{data}{ Original dataset.}
\item{x}{ The points where the density is estimated.}
\item{y}{ The estimated density values.}
\item{bw}{ The smoothing parameter used.}
\item{N}{ The sample size after elimination of missing values.}
\item{call}{ The call which produced the result.}
\item{data.name}{ The deparsed name of the x argument.}
\item{has.na}{ Logical, for compatibility (always FALSE).}
}
\references{ 
Oliveira, M., Crujeiras, R.M. and Rodríguez--Casal, A. (2012) A plug--in rule for bandwidth selection in circular density. \emph{Computational Statistics 
and Data Analysis}, \bold{56}, 3898--3908.

Taylor, C.C. (2008) Automatic bandwidth selection for circular density estimation. \emph{Computational Statistics and Data Analysis}, \bold{52}, 3493--3500.

Oliveira, M., Crujeiras R.M. and Rodríguez--Casal, A. (2014) NPCirc: an R package for nonparametric circular methods. \emph{Journal of Statistical Software}, 
\bold{61}(9), 1--26. \url{http://www.jstatsoft.org/v61/i09/}
}


\author{ María Oliveira, Rosa M. Crujeiras and Alberto Rodríguez--Casal}

\seealso{ \code{\link{bw.rt}}, \code{\link{bw.CV}}, \code{\link{bw.pi}}, \code{\link{bw.boot}}, \code{\link{plot.density.circular}}, \code{\link{lines.density.circular}} }

\examples{
set.seed(2012)
n <- 100
x <- rcircmix(n, model=14)
est1 <- kern.den.circ(x, t=NULL, bw=NULL)
plot(est1, plot.type="circle", points.plot=TRUE, shrink=1.2, main="Circular plot")
est2 <- kern.den.circ(x, t=NULL, bw=20)
lines(est2, plot.type="circle",shrink=1.2,col=2)
plot(est1, plot.type="line", main="Linear plot")
lines(est2, plot.type="line", col=2)
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ circular density }% __ONLY ONE__ keyword per line
