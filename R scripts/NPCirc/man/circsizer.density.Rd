\encoding{latin1}
\name{circsizer.density}
\alias{circsizer.density}
\alias{print.circsizer}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ CircSiZer map for density }
\description{
   This function plots the CircSiZer map for circular density estimation based on circular kernel methods, as described in Oliveira et al. (2013). The 
   CircSiZer is an extension of SiZer proposed by Chaudhuri and Marron (1999) to circular data.
}
\usage{
circsizer.density(x, bws, ngrid=250, alpha=0.05, B=500, log.scale=TRUE, 	
display=TRUE) 
\method{print}{circsizer}(x, digits=NULL, ...)
}
\arguments{
  \item{x}{ Data from which the estimate is to be computed. The object is coerced to class \code{\link{circular}}.}
  \item{bws}{ Vector of smoothing parameters. Values of \code{bws} must be positive. \code{bws} will be coerced to be equally spaced. Length of vector \code{bws} must be at least 2.}
  \item{ngrid}{ Integer indicating the number of equally spaced angles between \eqn{0} and \eqn{2\pi} where the estimator is evaluated. Default \code{ngrid=250}.}
  \item{alpha}{ Significance level for the CircSiZer map. Default \code{alpha=0.05}.}
  \item{B}{ Integer indicating the number of bootstrap samples to estimate the standard deviation of the derivative estimator. Default \code{B=500}.}
  \item{log.scale}{ Logical, if \code{TRUE}, the CircSiZer map is plotted in the scale \eqn{-\log_{10}(\code{bws})}. Default is \code{TRUE}. See Details.}
  \item{display}{ Logical, if \code{TRUE}, the CircSiZer map is plotted. Default is \code{TRUE}.}
  \item{digits}{ Integer indicating the precision to be used.}
  \item{...}{ further arguments} 
}
\details{
With CircSiZer, significance features (peaks and valleys) in the data are seeked via the construction of confidence intervals for the scale-space version of 
the smoothed derivative curve, as it is described in Oliveira et al. (2013). Thus, for a given point and a given value of the smoothing parameter, the curve 
is significantly increasing (decreasing) if the confidence interval is above (below) 0 and if the confidence interval contains 0, the curve for that value
of the smoothing parameter and at that point does not have a statistically significant slope. If \code{display=TRUE}, this information is displayed in a 
circular color map, the CircSiZer map, in such a way that, at a given point, the performance of the estimated curve is represented by a color ring with radius 
proportional to the value of the smoothing parameter.

Differents colors allow to  indentify peaks and valleys. Blue color indicates locations where the curve is significantly increasing; red color shows where 
it is significantly decreasing and purple indicates where it is not significantly different from zero. Gray color corresponds to those regions where there is 
not enough data to make statements about significance. Thus, at a given bandwidth, a significant peak can be identified when a region of significant 
positive gradient is followed by a region of significant negative gradient (i.e. blue-red pattern), and a significant trough by the reverse (red-blue 
pattern), taking clockwise as the positive sense of rotation.

If \code{log.scale=TRUE} then, the values of the considered smoothing parameters \code{bws} are transformed to \eqn{-\log_{10}} scale, i.e, a sequence of equally
spaced smoothing parameters according to the parameters 			
\code{-log10(max(bws))}, \code{-log10(min(bws))} and \code{length(bws)} is used. Hence, small values 
of this parameter corresponds with larger rings and large values corresponds with smaller rings. Whereas if \code{log.scale=FALSE}, small values of this 
parameter corresponds with smaller rings and large values corresponds with larger rings.

The NAs will be automatically removed.
}
\value{
An object with class \code{circsizer} whose underlying structure is a list containing the following components:

\item{data}{ Original dataset.}
\item{ngrid}{ Number of equally spaced angles where the derivative of the circular kernel density estimator.}
\item{bw}{ Vector of smoothing parameters (given in \eqn{-\log_{10}} scale if \code{log.scale=TRUE}).}
\item{log.scale}{ Logical; if \code{TRUE}, the \eqn{-\log_{10}} scale is used for constructing the CircSiZer map.}
\item{CI}{ List containing: a matrix with lower limits fot the confidence intervals; a matrix with the lower limits of the confidence intervals; a matrix 
with the Effective Sample Size. Each row corresponds to each value of the smoothing parameter and each column corresponds to an angle.}
\item{col}{ Matrix containing the colors for plotting the CircSiZer map.}


If \code{display==TRUE}, the function also returns the CircSiZer map for density.
}
\references{ 
Chaudhuri, P. and Marron, J.S. (1999). SiZer for exploration of structures in curves, \emph{Journal of the American Statistical Association}, \bold{94}, 
807--823.

Oliveira, M., Crujeiras, R.M. and Rodríguez--Casal (2014) CircSiZer: an exploratory tool for circular data. \emph{Environmental and Ecological Statistics}, 
\bold{21}, 143--159.

Oliveira, M., Crujeiras R.M. and Rodríguez--Casal, A. (2014) NPCirc: an R package for nonparametric circular methods. \emph{Journal of Statistical Software}, 
\bold{61}(9), 1--26. \url{http://www.jstatsoft.org/v61/i09/}
}


\author{ María Oliveira, Rosa M. Crujeiras and Alberto Rodríguez--Casal}

\seealso{\code{\link{circsizer.map}} }

\examples{
# set.seed(2012)
# x <- rcircmix(100,model=7)
# sizer <- circsizer.density(x, bws=seq(0,50,length=12))
# sizer
# names(sizer)
# circsizer.map(sizer,type=1,zero=pi/2,clockwise=TRUE,raw.data=TRUE)
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ circular density }% __ONLY ONE__ keyword per line
