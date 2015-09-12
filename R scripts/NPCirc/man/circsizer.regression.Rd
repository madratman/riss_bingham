\encoding{latin1}
\name{circsizer.regression}
\alias{circsizer.regression}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ CircSiZer map for regression }
\description{
   This function plots the CircSiZer map for circular regression estimation based on circular kernel methods, as described in Oliveira et al. (2013). The 
   CircSiZer is an extension of SiZer proposed by Chaudhuri and Marron (1999) to circular data.
}
\usage{
circsizer.regression(x, y, bws=NULL, adjust=2, ngrid=150, alpha=0.05, B=500, 
B2=250, log.scale=TRUE, display=TRUE)
}
\arguments{
  \item{x}{ Vector of data for the independent variable. The object is coerced to class \code{\link{circular}}.}
  \item{y}{ Vector of data for the dependent variable. This must be same length as \code{x}.}
  \item{bws}{ Vector of smoothing parameters. Values of \code{bws} must be positive. \code{bws} will be coerced to be equally spaced. Length of vector \code{bws}
	     must be at least 2.}
  \item{adjust}{ If \code{bws=NULL}, the smoothing parameters used are \code{adjust/bw} and \code{adjust*bw}, where \code{bw} is the smoothing parameter obtained 
                by using the cross--validation rule.}
  \item{ngrid}{ Integer indicating the number of equally spaced angles between \eqn{0} and \eqn{2\pi} where the estimator is evaluated. Default 
                \code{ngrid=150}.}
  \item{alpha}{ Significance level for the CircSiZer map. Default \code{alpha=0.05}.}
  \item{B}{ Integer indicating the number of bootstrap samples to estimate the standard deviation of the derivative estimator. Default \code{B=500}.}
  \item{B2}{ Integer indicating the number of bootstrap samples to compute the denominator in Step 2 of algorithm described in Oliveira et al. (2013). 
             Default \code{B=250}.}
  \item{log.scale}{ Logical, if \code{TRUE}, the CircSiZer map is plotted in the scale \eqn{-\log_{10}(\code{bws})}. Default is \code{TRUE}.}
  \item{display}{ Logical, if \code{TRUE}, the CircSiZer map is plotted. Default is \code{TRUE}.}
}
\details{
  See Details Section of \code{\link{circsizer.density}}.
  The NAs will be automatically removed.
}
\value{
An object with class \code{circsizer} whose underlying structure is a list containing the following components. 

\item{data}{ Original dataset.}
\item{ngrid}{ Number of equally spaced angles where the derivative of the regression estimator is evaluated.}
\item{bw}{ Vector of smoothing parameters (given in \eqn{-\log_{10}} scale if \code{log.scale=TRUE}).}
\item{log.scale}{ Logical; if \code{TRUE}, the \eqn{-\log_{10}} scale is used for constructing the CircSiZer map.}
\item{CI}{ List containing: a matrix with lower limits fot the confidence intervals; a matrix with the lower limits of the confidence intervals; a matrix 
with the Effective Sample Size. Each row corresponds to each value of the smoothing parameter and each column corresponds to an angle.}
\item{col}{ Matrix containing the colors for plotting the CircSiZer map.}

If \code{display==TRUE}, the function also returns the CircSiZer map for regression.
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
# Not run: the code works but it is slow
# set.seed(2012)
# n <- 100
# x <- seq(0,2*pi,length=n)
# y <- sin(x)+sqrt(0.5)*rnorm(n)
# circsizer.regression(circular(x), y, bws=seq(10,60,by=5))
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ circular regression }% __ONLY ONE__ keyword per line
