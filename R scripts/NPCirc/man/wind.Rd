\name{wind}
\alias{wind}
\docType{data}
\title{ Wind direction data
}
\description{
This dataset consists of hourly observations of wind direction measured at a weather station in Texas from May  20 to July 31, 2003 inclusive. 
}
\usage{
data(wind)
}
\format{
  \code{wind} is a data frame with observations on three variables: data, hour and wind direction (in radians).
}

\source{
The data, which correspons to the weather station designated as C28_1, are part of a larger data set taken from the Codiac data archive, available at \url{http://data.eol.ucar.edu/codiac/dss/id=85.034}. The full data
set contains hourly resolution surface meteorological data from the Texas Natural Resources Conservation Commission Air Quality Monitoring Network, from May 20 to July 31, 2003
inclusive. These data are provided by NCAR/EOL under the sponsorship of the National Science Foundation.
}
\references{ 
Kato, S. and Jones, M. C. (2010) A family of distributions on the circle with links to, and applications arising from, Möbius transformation. \emph{Journal 
of the American Statistical Association}, \bold{105}, 249--262.

Di Marzio, M., Panzera A. and Taylor, C. C. (2012) Non--parametric regression for circular responses. \emph{Scandinavian Journal of Statistics}, 
\bold{40}, 228--255.
}
\examples{
data(wind)
}
\keyword{datasets}

