\encoding{latin1}
\name{bw.boot}
\alias{bw.boot}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Bootstrap method }
\description{
  This function implements the bootstrap procedure proposed by Di Marzio et al. (2011) for selecting the smoothing parameter for density estimation taking 
  the von Mises density as kernel.
}
\usage{
bw.boot(x, lower=0, upper=100, np=500, tol=0.1)
}
\arguments{
  \item{x}{ Data from which the smoothing parameter is to be computed. The object is coerced to class \code{\link{circular}}.}
  \item{lower, upper}{ \code{lower} and \code{upper} boundary of the interval to be used in the search for the value of the smoothing parameter. Default
                       \code{lower=0} and \code{upper=100}.}
  \item{np}{ Number of points where to evaluate the estimator for numerical integration. Default \code{np=500}.}
  \item{tol}{ Convergence tolerance for \code{\link{optimize}}.}
}
\details{
  This method is based on the proposal of Taylor (1989) for linear data. See also Oliveira et al. (2012).
  The NAs will be automatically removed.
}
\value{
  Value of the smoothing parameter.
}
\references{ 
Di Marzio, M., Panzera A. and Taylor, C.C. (2011) Kernel density estimation on the torus. \emph{Journal of Statistical Planning and Inference}, \bold{141}, 2156--2173.

Oliveira, M., Crujeiras, R.M. and Rodríguez--Casal, A. (2012) A plug--in rule for bandwidth selection in circular density. \emph{Computational Statistics and Data Analysis}, \bold{56}, 3898--3908.

Taylor, C.C. (1989) Bootstrap choice of the smoothing parameter in kernel density estimation. \emph{Biometrika}, \bold{76}, 705--712.

Oliveira, M., Crujeiras R.M. and Rodríguez--Casal, A. (2014) NPCirc: an R package for nonparametric circular methods. \emph{Journal of Statistical Software}, 
\bold{61}(9), 1--26. \url{http://www.jstatsoft.org/v61/i09/}
}

\seealso{\code{\link{kern.den.circ}}, \code{\link{bw.rt}}, \code{\link{bw.CV}}, \code{\link{bw.pi}} }

\author{ María Oliveira, Rosa M. Crujeiras and Alberto Rodríguez--Casal}

\examples{
set.seed(2012)
n <- 100
x <- rcircmix(n, model=17)
bw.boot(x, lower=0, upper=20)
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ circular density }% __ONLY ONE__ keyword per line
