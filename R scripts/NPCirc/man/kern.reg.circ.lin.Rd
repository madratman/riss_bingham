\encoding{latin1}
\name{kern.reg.circ.lin}
\alias{kern.reg.circ.lin}
\alias{kern.reg.circ.circ}
\alias{kern.reg.lin.circ}
\alias{print.regression.circular}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Nonparametric regression estimation for circular data}
\description{
Function \code{kern.reg.circ.lin} implements the Nadaraya-Watson estimator and the Local-Linear estimator for circular-linear data (circular covariate and 
linear response), as described in Di Marzio et al. (2009) and Oliveira et al. (2013), taking the von Mises distribution as kernel.

Function \code{kern.reg.circ.circ} implements the Nadaraya-Watson estimator and the Local-Linear estimator for circular-circular data (circular covariate 
and circular response), as described in Di Marzio et al. (2012), taking the von Mises distribution as kernel.

Function \code{kern.reg.lin.circ} implements the Nadaraya-Watson estimator and the Local-Linear estimator for linear-circular data (linear covariate and 
circular response), as described in Di Marzio et al. (2012), taking the Normal distribution as kernel.

}
\usage{
kern.reg.circ.lin(x, y, t=NULL, bw, method="LL", from=circular(0), 
to=circular(2*pi), len=250, tol=300)
kern.reg.circ.circ(x, y, t=NULL, bw, method="LL", from=circular(0), 
to=circular(2*pi), len=250)
kern.reg.lin.circ(x, y, t=NULL, bw, method="LL", len=250)
\method{print}{regression.circular}(x, digits=NULL, ...)
}
\arguments{
  \item{x}{ Vector of data for the independent variable. The object is coerced to class \code{\link{circular}} when using functions \code{kern.reg.circ.lin} and \code{kern.reg.circ.circ}.}
  \item{y}{ Vector of data for the dependent variable. This must be same length as \code{x}. The object is coerced to class \code{\link{circular}} when using functions \code{kern.reg.circ.circ} and \code{kern.reg.lin.circ}.}
  \item{t}{ Points where the regression function  is estimated. If \code{NULL} equally spaced points are used according to the parameters \code{from}, \code{to} and \code{len}.}
  \item{bw}{ Smoothing parameter to be used. The value of the smoothing parameter can be chosen by using the function \code{\link{bw.reg.circ.lin}}, \code{\link{bw.reg.circ.circ}} and
             \code{\link{bw.reg.lin.circ}}.}
  \item{method}{ Character string giving the estimator to be used. This must be one of \code{"LL"} for Local-Linear estimator or \code{"NW"} for 
                 Nadaraya-Watson estimator. Default \code{method="LL"}.}
  \item{from, to}{ Left and right-most points of the grid at which the density is to be estimated. The objects are coerced to class \code{\link{circular}}.}
  \item{len}{ Number of equally spaced points at which the density is to be estimated.}
  \item{tol}{ Tolerance parameter to avoid overflow when \code{bw} is larger than \code{tol}. Default is \code{tol=300}.}
  \item{digits}{ Integer indicating the precision to be used.}
  \item{...}{ further arguments} 
}
\details{
  See Di Marzio et al. (2012). See Section 3 in Oliveira et al. (2013). See Di Marzio et al. (2009).
  The NAs will be automatically removed.
}
\value{
An object with class "regression.circular" whose underlying structure is a list containing the following components: 

\item{data}{ Original dataset.}
\item{x}{ The n coordinates of the points where the regression is estimated.}
\item{y}{ The estimated values.}
\item{bw}{ The smoothing parameter used.}
\item{N}{ The sample size after elimination of missing values.}
\item{call}{ The call which produced the result.}
\item{data.name}{ The deparsed name of the x argument.}
\item{has.na}{ Logical, for compatibility (always FALSE).}
}
\references{ 
Di Marzio, M., Panzera A. and Taylor, C. C. (2009) Local polynomial regression for circular predictors. \emph{Statistics and Probability Letters}, \bold{79}, 2066--2075.

Di Marzio, M., Panzera A. and Taylor, C. C. (2012) Non--parametric regression for circular responses. \emph{Scandinavian Journal of Statistics}, 
\bold{40}, 228--255.

Oliveira, M., Crujeiras R.M. and Rodríguez--Casal, A. (2013) Nonparametric circular methods for exploring environmental data. 
\emph{Environmental and Ecological Statistics}, \bold{20}, 1--17.

Oliveira, M., Crujeiras R.M. and Rodríguez--Casal, A. (2014) NPCirc: an R package for nonparametric circular methods. \emph{Journal of Statistical Software}, 
\bold{61}(9), 1--26. \url{http://www.jstatsoft.org/v61/i09/}
}

\author{ María Oliveira, Rosa M. Crujeiras and Alberto Rodríguez--Casal}

\seealso{\code{\link{plot.regression.circular}}, \code{\link{lines.regression.circular}}}

\examples{
### circular-linear
data(speed.wind2)
dir <- speed.wind2$Direction
vel <- speed.wind2$Speed
nas <- which(is.na(vel))
dir <- circular(dir[-nas],units="degrees")
vel <- vel[-nas]
estLL <- kern.reg.circ.lin(dir, vel, method="LL")
estNW <- kern.reg.circ.lin(dir, vel, method="NW")
# Circular representation
res<-plot(estNW, plot.type="circle", points.plot=TRUE,
labels=c("N","NE","E","SE","S","SO","O","NO"),
label.pos=seq(0,7*pi/4,by=pi/4), zero=pi/2, clockwise=TRUE)
lines(estLL, plot.type="circle", plot.info=res, line.col=2)
# Linear representation
plot(estNW, plot.type="line", points.plot=TRUE, xlab="direction", ylab="speed (m/s)")
lines(estLL, plot.type="line", line.col=2)


### circular-circular
data(wind)
wind6 <- circular(wind$wind.dir[seq(7,1752,by=24)])
wind12 <- circular(wind$wind.dir[seq(13,1752,by=24)])
estNW <- kern.reg.circ.circ(wind6,wind12,t=NULL,bw=6.1,method="NW")
estLL <- kern.reg.circ.circ(wind6,wind12,t=NULL,bw=2.25,method="LL")
# Torus representation
plot(estNW, plot.type="circle", points.plot=TRUE, line.col=2, lwd=2, points.col=2, 
units="degrees")
lines(estLL, plot.type="circle", line.col=3, lwd=2)
# Linear representation
plot(estNW, plot.type="line", points.plot=TRUE, xlab="Wind direction at 6 a.m.", 
ylab="Wind direction at noon")
lines(estLL, plot.type="line", line.col=2)


### linear-circular
data(periwinkles)
dist <- periwinkles$distance
dir <- circular(periwinkles$direction, units="degrees")
estNW <- kern.reg.lin.circ(dist,dir,t=NULL,bw=12.7,method="NW")
estLL <- kern.reg.lin.circ(dist,dir,t=NULL,bw=200,method="LL")
# Cylinder representation
plot(estNW, plot.type="circle", points.plot=TRUE, line.col=2, lwd=2, points.col=2)
lines(estLL, plot.type="circle", line.col=3, lwd=2)
# Linear representation
plot(estNW, plot.type="line", points.plot=TRUE, units="radians", main="")
lines(estLL, plot.type="line", line.col=2, units="radians")
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ circular regression }% __ONLY ONE__ keyword per line
