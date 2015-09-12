\name{speed.wind}
\alias{speed.wind}
\alias{speed.wind2}
\docType{data}
\title{ Wind speed and wind direction data
}
\description{
This dataset consists of hourly observations of wind direction and wind speed in winter season (from November to February)
from 2003 until 2012 in the Atlantic coast of Galicia (NW--Spain). Data are registered by a buoy located at longitude -0.210E and latitude 43.500N in the 
Atlantic Ocean. The dataset \code{speed.wind2}, analized in Oliveira et al. (2013), is a subset of \code{speed.wind} which is obtained by taking the 
observations with a lag period of 95 hours.
}
\usage{
data(speed.wind)
data(speed.wind2)
}
\format{
  \code{speed.wind} is a data frame with 19488 observations on six variables: day, month, year, hour, wind speed (in m/s) and wind direction 
  (in degrees). \code{speed.wind2} is a subset with 200 observations.
}
\details{
Data contains NAs.
There is no data in November 2005, December 2005, January 2006, February 2006, February 2007, February 2009 and November 2009. Months of November 2004, 
December 2004, January 2007, December 2009 are not fully observed.
}
\source{
Data can be freely downloaded from the Spanish Portuary Authority (\url{http://www.puertos.es}).
}
\references{ 

Oliveira, M., Crujeiras, R.M. and Rodríguez--Casal (2014) CircSiZer: an exploratory tool for circular data. \emph{Environmental and Ecological Statistics}, 
\bold{21}, 143--159.
}
\examples{
data(speed.wind2)

# Density
dir <- circular(speed.wind2$Direction, units="degrees", template="geographics")
plot(dir, stack=TRUE,  shrink= 1.1)
rose.diag(dir, bins=16, add=TRUE)
lines(kern.den.circ(dir,bw=1), lwd=2, col=2)
lines(kern.den.circ(dir,bw=10), lwd=2, col=3)
lines(kern.den.circ(dir,bw=40), lwd=2, col=4)

# Regression
vel <- speed.wind2$Speed
nas <- which(is.na(vel))
dir <- dir[-nas]
vel <- vel[-nas]
res<-plot(kern.reg.circ.lin(dir, vel, bw=1, method="LL"), plot.type="circle", 
points.plot=TRUE, line.col=2, lwd=2, main="")
lines(kern.reg.circ.lin(dir, vel, bw=10, method="LL"), plot.type="circle", plot.info=res,
line.col=3, lwd=2)
lines(kern.reg.circ.lin(dir, vel, bw=40, method="LL"), plot.type="circle", plot.info=res, 
line.col=4, lwd=2)
}
\keyword{datasets}

