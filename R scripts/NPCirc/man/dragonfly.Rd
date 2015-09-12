\name{dragonfly}
\alias{dragonfly}
\docType{data}
\title{ Orientations of dragonflies
}
\description{
The data, presented in Batschelet (1981), consists on the orientation of 214 dragonflies with respect to the sun's azimuth.
}
\usage{data(dragonfly)}
\format{
  A single-column data frame with 214 observations in radians.
}
\details{
Data were originally recorded in degrees.
}
\source{
Batschelet, E. (1981) \emph{Circular Statistics in Biology}. Academic Press, New York.
}
\examples{
data(dragonfly)
x <- circular(dragonfly$orientation)
dens <- kern.den.circ(x)
plot(dens, shrink=1.3)
}
\keyword{datasets}

