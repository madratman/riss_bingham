\encoding{latin1}
\name{lines.regression.circular}
\alias{lines.regression.circular}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Add a plot for circular regression}
\description{
The \code{lines} add a plot for \code{regression.circular} objects. 
}
\usage{
\method{lines}{regression.circular}(x, plot.type=c("circle", "line"), points.plot=FALSE, rp.type="p", type="l",
line.col=1, points.col="grey", points.pch=1, units=NULL, zero=NULL, 
clockwise=NULL, radial.lim=NULL, plot.info=NULL, ...)
}
\arguments{
  \item{x}{ An object of class \code{regression.circular}.}
  \item{plot.type}{ Type of the plot: "line": linear plot, "circle": circular plot.}
  \item{points.plot}{ Logical; if TRUE original data are added to the plot.}
  \item{rp.type, type}{ Character indicating the type of plotting.}
  \item{line.col}{ Color code or name.}
  \item{points.col}{ Color code or name for the original data. Used if \code{points.plot=TRUE}.}
  \item{points.pch}{ Plotting 'character', i.e., symbol to use for the original data. Used if 
                     \code{points.plot=TRUE}.}
  \item{units}{ Units measure used in the plot. If \code{NULL} the value is taken from the attribute of object 'x' from the argument 'x', i.e. x$x.}
  \item{zero}{ Where to place the starting (zero) point, i.e., the zero of the plot. Ignored if \code{plot.info} is provided.}
  \item{clockwise}{ Logical, indicating the sense of rotation of the plot: clockwise if \code{TRUE} and counterclockwise if \code{FALSE}. Ignored if plot.info is provided.}
  \item{radial.lim}{ The range of the grid circle. Used if \code{plot.type="circle"}.}
  \item{plot.info}{ An object from \code{plot.regression.circular} that contains information on the \code{zero}, the \code{clockwise} and \code{radial.lim}. Used if \code{plot.type="circle"}.}
  \item{...}{ Further arguments to be passed to \code{\link{lines.default}} (if \code{plot.type="line"}) or to \code{\link{radial.plot}} 
              (if \code{plot.type="circle"} and \code{x} is the output of \code{\link{kern.reg.circ.lin}}) or to \code{\link{lines3d}} (if \code{plot.type="circle"}) 
	      and \code{x} is the output of \code{\link{kern.reg.circ.circ}}).}
}

\references{ 
Oliveira, M., Crujeiras R.M. and Rodríguez--Casal, A. (2014) NPCirc: an R package for nonparametric circular methods. \emph{Journal of Statistical Software}, 
\bold{61}(9), 1--26. \url{http://www.jstatsoft.org/v61/i09/}
}

\author{ María Oliveira, Rosa M. Crujeiras and Alberto Rodríguez--Casal}

\seealso{\code{\link{kern.reg.circ.lin}}, \code{\link{kern.reg.circ.circ}}, \code{\link{kern.reg.lin.circ}}, \code{\link{plot.regression.circular}}}

\examples{
set.seed(1012)
n <- 100
x <- runif(100, 0, 2*pi)
y <- sin(x)+0.5*rnorm(n)
estNW<-kern.reg.circ.lin(circular(x),y,t=NULL,bw=10,method="NW")
estLL<-kern.reg.circ.lin(circular(x),y,t=NULL,bw=10,method="LL")
res<-plot(estNW, plot.type="circle", points.plot=TRUE)
lines(estLL, plot.type="circle",line.col=2, plot.info=res)
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ circular regression }% __ONLY ONE__ keyword per line
