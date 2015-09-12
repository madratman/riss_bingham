\name{cycle.changes}
\alias{cycle.changes}
\docType{data}
\title{ Cycle changes
}
\description{
The data consists on the changes in cycles of temperatures at ground level in periglacial Monte Alvear (Argentina). The dataset includes 350 observations 
which correspond to the hours where the temperature changes from positive to negative and viceversa from February 2008 to December 2009.
}
\usage{data(cycle.changes)}
\format{
  A data frame with 350 observations on two variables: \code{change}, which indicates if the temperature changed from positive to negative (-1) or viceversa (1) 
  and \code{hour}, which indicates the hour (in radians) when the cycle change occured.
}
\details{
Analysis of cycle changes in temperatures for another locations can be seen in Oliveira et al. (2013).
}
\source{
The authors want to acknowledge Prof. Augusto Pérez--Alberti for providing the data, collected within the Project POL2006-09071 from the Spanish Ministry 
of Education and Science.
}
\references{ Oliveira, M., Crujeiras R.M. and Rodríguez--Casal, A. (2013) Nonparametric circular methods for exploring environmental data. 
\emph{Environmental and Ecological Statistics}, \bold{20}, 1--17.
}
\examples{
data(cycle.changes)
thaw <- (cycle.changes[,1]==1)
frosting <- (cycle.changes[,1]==-1)
plot(circular(cycle.changes[frosting,2],template="clock24"), shrink=1.08, col=4, 
stack=TRUE, main="Frosting")
plot(circular(cycle.changes[thaw,2],template="clock24"), shrink=1.08, col=2, 
stack=TRUE, main="Thaw")
}
\keyword{datasets}

