\encoding{latin1}
\name{bw.CV}
\alias{bw.CV}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Cross-validation for density estimation}
\description{
  This function provides a least squares cross-validation smoothing parameter or a likelihood cross-validation smoothing parameter for density estimation.
}
\usage{
bw.CV(x, method="LCV", lower=0, upper=50, tol=1e-2, np=500)
}
\arguments{
  \item{x}{ Data from which the smoothing parameter is to be computed. The object is coerced to class \code{\link{circular}}.}
  \item{method}{ Character string giving the cross-validation rule to be used. This must be one of \code{"LCV"} or \code{"LSCV"}. Default \code{method="LCV"}.}
  \item{lower, upper}{ \code{lower} and \code{upper} boundary of the interval to be used in the search for the value of the smoothing parameter. Default
                       \code{lower=0} and \code{upper=50}.}
  \item{tol}{ Convergence tolerance for \code{\link{optimize}}. Default \code{tol=1e-2}.}
  \item{np}{  Number of points where to evaluate the estimator for numerical integration when \code{method="LSCV"}. Default \code{np=500}.}
}
\details{
  The LCV smoothing parameter is obtained as the value of \eqn{\nu} that maximizes the logarithm of the likelihood cross-validation function (8) in Oliveira 
  et al. (2013). 
  The LSCV smoothing parameter is obtained as the value of \eqn{\nu} that minimizes expression (7) in Oliveira et al. (2013). 
  See also Hall et al. (1987) and Oliveira et al. (2012).
  The NAs will be automatically removed.
}
\value{
  Value of the smoothing parameter.
}
\references{ 
Hall, P., Watson, G.S. and Cabrera, J. (1987) Kernel density estimation with spherical data, \emph{Biometrika}, \bold{74}, 751--762.

Oliveira, M., Crujeiras, R.M. and Rodríguez--Casal, A. (2012) A plug--in rule for bandwidth selection in circular density. \emph{Computational Statistics 
and Data Analysis}, \bold{56}, 3898--3908.

Oliveira, M., Crujeiras R.M. and Rodríguez--Casal, A. (2013) Nonparametric circular methods for exploring environmental data. 
\emph{Environmental and Ecological Statistics}, \bold{20}, 1--17.

Oliveira, M., Crujeiras R.M. and Rodríguez--Casal, A. (2014) NPCirc: an R package for nonparametric circular methods. \emph{Journal of Statistical Software}, 
\bold{61}(9), 1--26. \url{http://www.jstatsoft.org/v61/i09/}
}

\seealso{\code{\link{kern.den.circ}}, \code{\link{bw.rt}}, \code{\link{bw.pi}}, \code{\link{bw.boot}} }

\author{ María Oliveira, Rosa M. Crujeiras and Alberto Rodríguez--Casal}

\examples{
set.seed(2012)
n <- 100
x <- rcircmix(n, model=11)
bw.CV(x, method="LCV", lower=0, upper=20)
bw.CV(x, method="LSCV", lower=0, upper=20)
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ circular density }% __ONLY ONE__ keyword per line
