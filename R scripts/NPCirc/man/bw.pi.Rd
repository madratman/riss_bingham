\encoding{latin1}
\name{bw.pi}
\alias{bw.pi}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Plug--in rule }
\description{
  This function implements the von Mises scale plug-in rule for the smoothing parameter for density estimation when the number of components in the mixture 
  is selected by Akaike Information Criterion (AIC) which selects the best model between a mixture of 2-5 von Mises distributions.
}
\usage{
bw.pi(x, M=NULL, lower=0, upper=100, np=500, tol=0.1, outM=FALSE)
}
\arguments{
  \item{x}{ Data from which the smoothing parameter is to be computed. The object is coerced to class \code{\link{circular}}.}
  \item{M}{ Integer indicating the number of components in the mixture. If \code{M=1}, the rule of thumb is carried out with \eqn{\kappa} estimated by
            maximum likelihood. If \code{M=NULL}, AIC will be used.}
  \item{lower, upper}{ \code{lower} and \code{upper} boundary of the interval to be used in the search for the value of the smoothing parameter. Default
                       \code{lower=0} and \code{upper=100}.}
  \item{np}{ Number of points where to evaluate the estimator for numerical integration. Default \code{np=500}.}
  \item{tol}{ Convergence tolerance for \code{\link{optimize}}. Default \code{tol=0.1}.}
  \item{outM}{ Logical; if \code{TRUE} the function also returns the number of components in the mixture. Default, \code{outM=FALSE}.}
}
\details{
  The value of the smoothing parameter is chosen by minimizing the asymptotic mean integrated squared error (AMISE) derived by Di Marzio et al. (2009) 
  assuming that the data follow a mixture of von Mises distributions. The number of components in the mixture can be fixed by the user, by specifying
  the argument \code{M} or selected by using AIC (default option) as described in Oliveira et al. (2012).
  The NAs will be automatically removed.
}
\value{
  Vector with the value of the smoothing parameter and the number of components in the mixture (if specified).
}
\references{
  Oliveira, M., Crujeiras, R.M. and Rodríguez--Casal, A. (2012) A plug--in rule for bandwidth selection in circular density. \emph{Computational 
  Statistics and Data Analysis}, \bold{56}, 3898--3908.

Oliveira, M., Crujeiras R.M. and Rodríguez--Casal, A. (2014) NPCirc: an R package for nonparametric circular methods. \emph{Journal of Statistical Software}, 
\bold{61}(9), 1--26. \url{http://www.jstatsoft.org/v61/i09/}
}

\author{ María Oliveira, Rosa M. Crujeiras and Alberto Rodríguez--Casal}

\seealso{\code{\link{kern.den.circ}}, \code{\link{bw.rt}}, \code{\link{bw.CV}}, \code{\link{bw.boot}} }

\examples{
set.seed(2012)
n <- 100
x <- rcircmix(n,model=18)
bw.pi(x, M=3)
bw.pi(x, outM=TRUE)  # Using AIC
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ circular density }% __ONLY ONE__ keyword per line
