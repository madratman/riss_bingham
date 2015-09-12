\encoding{latin1}
\name{NPCirc-package}
\alias{NPCirc-package}
\alias{NPCirc}
\docType{package}
\title{
Nonparametric circular methods.
}
\description{
This package implements nonparametric kernel methods for density and regression estimation for circular data.
}
\details{
\tabular{ll}{
Package: \tab NPCirc\cr
Type: \tab Package\cr
Version: \tab 2.0.1\cr
Date: \tab 2014-10-16\cr
License: \tab GPL-2\cr
LazyLoad: \tab yes\cr
}
This package incorporates the function \code{kern.den.circ} which computes the 
circular kernel density estimator. For choosing the smoothing parameter different functions are available: \code{bw.rt}, \code{bw.CV},
\code{bw.pi}, and \code{bw.boot}. For regression involving circular variables, the package includes the functions: \code{kern.reg.circ.lin} for a circular 
covariate and linear response; \code{kern.reg.circ.circ} for a circular covariate and a circular response; \code{kern.reg.lin.circ} for a linear covariate 
and a circular response. The three functions compute Nadaraya-Watson and Local-Linear smoothers. The functions \code{bw.reg.circ.lin}, 
\code{bw.reg.circ.circ} and \code{bw.reg.circ.lin} implement cross--validation rules for selecting the smoothing parameter. 
Functions \code{circsizer.density} and \code{circsizer.re-} \code{gression} provides CircSiZer maps for kernel density estimation and regression estimation, respectively. 
Functions \code{dcircmix} and \code{rcircmix} compute the density function and generate random samples of a circular distribution or a mixture of circular 
distributions, allowing for different components such as the circular uniform, von Mises, cardioid, wrapped Cauchy, wrapped normal and wrapped skew-normal. 
Finally, some data sets are provided. Missing data are allowed. Registries with missing data are simply removed. 

For a complete list of functions, use \code{library(help="NPCirc").} }
\author{
María Oliveira, Rosa M. Crujeiras and Alberto Rodríguez--Casal

Maintainer: María Oliveira \email{maria.oliveira@usc.es}
}
\references{
Oliveira, M., Crujeiras, R.M. and Rodríguez--Casal, A. (2012) A plug--in rule for bandwidth selection in circular density. \emph{Computational Statistics 
and Data Analysis}, \bold{56}, 3898--3908.

Oliveira, M., Crujeiras R.M. and Rodríguez--Casal, A. (2013) Nonparametric circular methods for exploring environmental data. 
\emph{Environmental and Ecological Statistics}, \bold{20}, 1--17.

Oliveira, M., Crujeiras, R.M. and Rodríguez--Casal (2014) CircSiZer: an exploratory tool for circular data. \emph{Environmental and Ecological Statistics}, 
\bold{21}, 143--159.

Oliveira, M., Crujeiras R.M. and Rodríguez--Casal, A. (2014) NPCirc: an R package for nonparametric circular methods. \emph{Journal of Statistical Software}, 
\bold{61}(9), 1--26. \url{http://www.jstatsoft.org/v61/i09/}
}


%\keyword{ circular density}
%\keyword{ circular regression}

\section{Acknowledgements}{ This work has been supported by Project MTM2008-03010 from the Spanish Ministry of Science and Innovation IAP network (Developing 
crucial Statistical methods for Understanding major complex Dynamic Systems in natural, biomedical and social sciences (StUDyS)) from Belgian Science Policy.
The authors want to acknowledge Prof. Arthur Pewsey for facilitating data examples and for his comments.
}

