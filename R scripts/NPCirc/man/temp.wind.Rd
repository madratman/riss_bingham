\name{temp.wind}
\alias{temp.wind}
\docType{data}
\title{ Temperature and wind direction data
}
\description{
These data, analyzed by  Oliveira et al. (2013), consists of observations of temperature and wind direction during the austral summer season 2008-2009 
(from November 2008 to March 2009) in Vinciguerra (Tierra del Fuego, Argentina).
}
\usage{data(temp.wind)}
\format{
  A data frame with 3648 observations on four variables: \code{Date}, \code{Time}, \code{Temperature} (in degrees Celsius) and \code{Direction} (in degrees).
}
\details{
Data contains NAs.
}
\source{
The authors want to acknowledge Prof. Augusto Pérez--Alberti for providing the data, collected within the Project POL2006-09071 from the Spanish Ministry 
of Education and Science.
}
\references{ Oliveira, M., Crujeiras R.M. and Rodríguez--Casal, A. (2013) Nonparametric circular methods for exploring environmental data. 
\emph{Environmental and Ecological Statistics}, \bold{20}, 1--17.
}
\examples{
data(temp.wind)
winddir <- temp.wind[,4] 
temp <- temp.wind[,3]
nas <- which(is.na(winddir))
winddir <- circular(winddir[-nas], units="degrees") 
temp <- temp[-nas]

est <- kern.reg.circ.lin(winddir, temp, t=NULL, bw=3.41, method="LL")
plot(est, plot.type="line", xlab="wind direction", ylab="temperature")
plot(est, plot.type="circle", points.plot=TRUE)
}
\keyword{datasets}

