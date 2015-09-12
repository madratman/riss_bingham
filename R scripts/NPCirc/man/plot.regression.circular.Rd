\encoding{latin1}
\name{plot.regression.circular}
\alias{plot.regression.circular}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{ Plot circular regression}
\description{
The \code{plot} method for \code{regression.circular} objects. 
}
\usage{
\method{plot}{regression.circular}(x, plot.type=c("circle", "line"), points.plot=FALSE, rp.type="p", type="l",
line.col=1, points.col="grey", points.pch=1, xlim=NULL, ylim=NULL, 
radial.lim=NULL, xlab=NULL, ylab=NULL, labels=NULL, label.pos=NULL, units=NULL,
zero=NULL, clockwise=NULL, main=NULL, ...)
}
\arguments{
  \item{x}{ An object of class \code{regression.circular}.}
  \item{plot.type}{ Type of the plot: "line": linear plot, "circle": circular plot.}
  \item{points.plot}{ Logical; if TRUE original data are added to the plot.}
  \item{rp.type, type}{ Character indicating the type of plotting. Default \code{type="l"} and \code{rp.type="p"}.}
  \item{line.col}{ Color code or name.}
  \item{points.col}{ Color code or name for the original data. Used if \code{points.plot=TRUE}.}
  \item{points.pch}{ Plotting 'character', i.e., symbol to use for the original data. Used if \code{points.plot=TRUE}.}
  \item{xlim, ylim}{ The ranges to be encompassed by the x and y axes. Used if \code{plot.type="line"}. }
  \item{radial.lim}{ The range of the grid circle, used if \code{plot.type="circle"}.}
  \item{xlab, ylab}{ Titles for the x axis and y axis, respectively.}
  \item{labels}{ Character or expression vector of labels to be placed at the \code{label.pos}. \code{label.pos} must also be supplied.}
  \item{label.pos}{ Vector indicating the position (between \eqn{0} and \eqn{2\pi}) at which the labels are to be drawn.}
  \item{units}{ Units measure used in the plot. If \code{NULL} the value is taken from the attribute of object 'x' from the argument 'x', i.e. x$x.}
  \item{zero}{ Where to place the starting (zero) point, i.e. the zero of the plot. If \code{NULL} the value is taken from the attribute of object 'x' 
	from the argument 'x', i.e. x$x}
  \item{clockwise}{ Logical, indicating the sense of rotation of the plot: clockwise if \code{TRUE} and counterclockwise if \code{FALSE}. If \code{NULL} the 
        value is taken from the attribute of object 'x' from the argument 'x', i.e. x$x} 
  \item{main}{ An overall title for the plot.}
  \item{...}{ Further arguments to be passed to \code{\link{plot.default}} (if \code{plot.type="line"}) or to to \code{\link{radial.plot}} (if 
              code{plot.type="circle"} and \code{x} is the output of \code{\link{kern.reg.circ.lin}}) or to \code{\link{lines3d}} (if \code{plot.type="circle"}) 
	      and \code{x} is the output of \code{\link{kern.reg.circ.circ}}).}
}
\value{
If \code{plot.type="circle"} and \code{x} is the output of \code{kern.reg.circ.lin}), this function returns a list with information on the plot: 
\code{zero}, \code{clockwise} and \code{radial.lim}. 
}

\references{ 
Oliveira, M., Crujeiras R.M. and Rodríguez--Casal, A. (2014) NPCirc: an R package for nonparametric circular methods. \emph{Journal of Statistical Software}, 
\bold{61}(9), 1--26. \url{http://www.jstatsoft.org/v61/i09/}
}

\author{ María Oliveira, Rosa M. Crujeiras and Alberto Rodríguez--Casal}

\seealso{\code{\link{kern.reg.circ.lin}}, \code{\link{kern.reg.circ.circ}}, \code{\link{kern.reg.lin.circ}}, \code{\link{lines.regression.circular}}}


\examples{
set.seed(1012)
n <- 100
x <- runif(100, 0, 2*pi)
y <- sin(x)+0.5*rnorm(n)
estNW<-kern.reg.circ.lin(circular(x),y,t=NULL,bw=10,method="NW")
plot(estNW, plot.type="line", points.plot=TRUE)
plot(estNW, plot.type="circle", points.plot=TRUE)
}

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ circular regression }% __ONLY ONE__ keyword per line
