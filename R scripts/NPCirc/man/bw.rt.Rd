\encoding{latin1}
\name{bw.rt}
\alias{bw.rt}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Rule of thumb }
\description{
   This function implements the selector proposed by Taylor (2008) for density estimation, based on an estimation of the concentration parameter of a von 
   Mises distribution. The concentration parameter can be estimated by maximum likelihood or by a robustified procedure as described in Oliveira et al. (2013). 
}
\usage{
bw.rt(x, robust=FALSE, alpha=0.5)
}
\arguments{
  \item{x}{ Data from which the smoothing parameter is to be computed. The object is coerced to class \code{\link{circular}}.}
  \item{robust}{ Logical, if \code{robust=FALSE} the parameter \eqn{\kappa} is estimated by maximum likelihood, if \code{TRUE} it is estimated
		as described in Oliveira et al. (2012b). Default \code{robust=FALSE}.}
  \item{alpha}{ Arc probability when \code{robust=TRUE}. Default is \code{alpha=0.5}. See Details.}
}
\details{
  When \code{robust=TRUE}, the parameter \eqn{\kappa} is estimated as follows:

  1. Select \eqn{\alpha \in (0, 1)} and find the shortest arc containing \eqn{\alpha \cdot 100\%} of the sample data. 
  
  2. Obtain the estimated \eqn{\hat\kappa} in such way that the probability of a von Mises centered in the midpoint of the arc is \code{alpha}.
  
  The NAs will be automatically removed.

  See also Oliveira et al. (2012). 
}
\value{
  Value of the smoothing parameter.
}
\references{ 
Oliveira, M., Crujeiras, R.M. and Rodríguez--Casal, A. (2012) A plug--in rule for bandwidth selection in circular density. \emph{Computational Statistics 
and Data Analysis}, \bold{56}, 3898--3908.

Oliveira, M., Crujeiras R.M. and Rodríguez--Casal, A. (2013) Nonparametric circular methods for exploring environmental data. 
\emph{Environmental and Ecological Statistics}, \bold{20}, 1--17.

Taylor, C.C. (2008) Automatic bandwidth selection for circular density estimation. \emph{Computational Statistics and Data Analysis}, \bold{52}, 3493--3500.

Oliveira, M., Crujeiras R.M. and Rodríguez--Casal, A. (2014) NPCirc: an R package for nonparametric circular methods. \emph{Journal of Statistical Software}, 
\bold{61}(9), 1--26. \url{http://www.jstatsoft.org/v61/i09/}
}

\author{ María Oliveira, Rosa M. Crujeiras and Alberto Rodríguez--Casal}

\seealso{\code{\link{kern.den.circ}}, \code{\link{bw.CV}}, \code{\link{bw.pi}}, \code{\link{bw.boot}} }

\examples{
set.seed(2012)
n <- 100
x <- rcircmix(n,model=7)
bw.rt(x) 
bw.rt(x, robust=TRUE)
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ circular density }% __ONLY ONE__ keyword per line
