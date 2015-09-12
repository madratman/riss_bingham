\encoding{latin1}
\name{bw.reg.circ.lin}
\alias{bw.reg.circ.lin}
\alias{bw.reg.circ.circ}
\alias{bw.reg.lin.circ}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Cross-validation rule for circular regression estimation }
\description{
  Function \code{bw.reg.circ.lin} provides the least squares cross-validation smoothing parameter for the Nadaraya-Watson and Local-Linear estimators when the covariate
  is circular and the response variable is linear.

  Function \code{bw.reg.circ.circ} provides the least squares cross-validation smoothing parameter for the Nadaraya-Watson and Local-Linear estimators when the covariate
  and the response variable are circular.

  Function \code{bw.reg.lin.circ} provides the least squares cross-validation smoothing parameter for the Nadaraya-Watson and Local-Linear estimators when the covariate
  is linear and the response variable is circular.
}
\usage{
bw.reg.circ.lin(x, y, method="LL", lower=0, upper=50, tol=1e-2)
bw.reg.circ.circ(x, y, method="LL", option=1, lower=0, upper=50, tol=1e-2)
bw.reg.lin.circ(x, y, method="LL", option=1, lower=0, upper=50, tol=1e-2)
}
\arguments{
  \item{x}{ Vector of data for the independent variable. The object is coerced to class \code{\link{circular}} when using functions \code{bw.reg.circ.lin} and \code{bw.reg.circ.circ}.}
  \item{y}{ Vector of data for the dependent variable. This must be same length as \code{x}. The object is coerced to class \code{\link{circular}} when using functions \code{bw.reg.circ.circ} and \code{bw.reg.lin.circ}.}
  \item{method}{ Character string giving the estimator to be used. This must be one of \code{"LL"} or \code{"NW"}. Default \code{method="LL"}.}
  \item{option}{ Cross--validation rule. Default \code{option=1}. See details.}
  \item{lower, upper}{ \code{lower} and \code{upper} boundary of the interval to be used in the search for the value of the smoothing parameter. Default
                       \code{lower=0} and \code{upper=50}.}
  \item{tol}{ Convergence tolerance for \code{\link{optimize}}. Default \code{tol=1e-2}.}
}
\details{
%  The LSCV smoothing parameter is obtained as the value of \eqn{\nu} that minimizes expression (13) in Oliveira et al. (2013).
  For nonparmetric regression with circular response, given \eqn{(X_i,Y_i)}, \eqn{i=1,\ldots,n}: 
  If \code{option=1}, the cross--validation smoothing parameter is computed as the value that minimizes \eqn{\sum_{i=1}^{n}(-\cos(Y_i-\hat{f}^{-i}(X_i))}, where \eqn{\hat{f}^{-i}} denotes the estimator computed with all the observations except \eqn{(X_i,Y_i)}.

  If \code{option=2}, the cross--validation smoothing parameter is computed as the value that minimizes \eqn{n^{-1}\sum_{i=1}^{n}(d(Y_i,\hat{f}^{-i}(X_i))^2} where \eqn{d(Y_i,\hat{f}^{-i}(X_i)=\min(|Y_i-\hat{f}^{-i}(X_i)|,2\pi-|Y_i-\hat{f}^{-i}(X_i)|)}.
  
  The NAs will be automatically removed.
}
\value{
  Value of the smoothing parameter.
}
\references{ 
Oliveira, M., Crujeiras R.M. and Rodríguez--Casal, A. (2013) Nonparametric circular methods for exploring environmental data. 
\emph{Environmental and Ecological Statistics}, \bold{20}, 1--17.

Di Marzio, M., Panzera A. and Taylor, C. C. (2012) Non--parametric regression for circular responses. \emph{Scandinavian Journal of Statistics}, 
\bold{40}, 228--255.

Oliveira, M., Crujeiras R.M. and Rodríguez--Casal, A. (2014) NPCirc: an R package for nonparametric circular methods. \emph{Journal of Statistical Software}, 
\bold{61}(9), 1--26. \url{http://www.jstatsoft.org/v61/i09/}
}

\author{ María Oliveira, Rosa M. Crujeiras and Alberto Rodríguez--Casal}

\seealso{\code{\link{kern.reg.circ.lin}}, \code{\link{kern.reg.circ.circ}}, \code{\link{kern.reg.lin.circ}} }

\examples{
set.seed(2012)
n <- 100
x <- seq(0,2*pi,length=n)
y <- sin(x)+0.2*rnorm(n)
bw.reg.circ.lin(circular(x), y, method="LL", lower=1, upper=20)
bw.reg.circ.lin(circular(x), y, method="NW", lower=1, upper=20)
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ circular regression }% __ONLY ONE__ keyword per line
