\name{plotLayers}
\alias{plotLayers}
\title{
        Plot simultaneously one or more layers of information
}
\description{
Plots several layer of information, overlaying different kind of information.
This funtion make it easy to plot several shapefiles/data pair information
over one single plot. 
}
\usage{
plotLayers(...)
}
\arguments{
  \item{\dots}{
a list of lists, where each element of the list describes a layer of 
information. The list must contain a \code{FUN} member that indicates which
function will be used to plot, generally \code{FUN} is \code{plot},
\code{text}, \code{points}, etc.
The rest of the list describes the plotting attributes for each layer. 
See Examples.
}
}
\details{
This function can also be embeded into \code{filled.contour} function. 
Example two produces the following graphic.

\if{html}{ \figure{plotl.jpg}{plotLayer example}}
\if{latex}{\figure{plotl.pdf}{options: width=36em}}

}

\value{
Function does not return any value.
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
%%\references{
%%
%%}
\author{
A.M. Sajo-Castelli
}


\seealso{
\pkg{\link{vetools}}
}
\examples{
library(maptools)
library(vetools)

# Example 1 ####
ZU <- get.shape.state("ZU")
border <- list(FUN = plot, ZU, asp = 1, lwd = 2, 
               border = "blue", col = NA, add = TRUE)
r <- get.shape.range(ZU)
x <- seq(r[1], r[2], length.out = nrow(volcano))
y <- seq(r[3], r[4], length.out = ncol(volcano))
image(x, y, volcano, col = heat.colors(100), 
      axes = FALSE, xlab = NA, ylab = NA, asp = 1)
plotLayers(border)
plotArrow(ZU, cex = 0.666, offset.arrow = c(0.1, 0))
title(main = "Raster image combined with plotLayers")

# Example 2 ####
long=c(-72.5, -71.5, -71.0); lat=c(9.5, 8.75, 10.5); 
mm = 1.5 * c(2.5, 3.8, 4.2)
data <- list(FUN = points, x = long, y = lat, pch = 21, 
             bg = rgb(0, 1, 0, 0.666), col = "blue", 
             cex = mm)
filled.contour(x, y, volcano, xlab = "Longitude", 
               ylab = "Latitude", asp = 1,
               color.palette = heat.colors,
               plot.axis = { plotLayers(border, data) },
               main = "plotLayers & filled.contour example")

# Example 3 ####
pts <- cbind(r[1] + 2 * runif(10), r[3] + 3 * runif(10))
sts <- runif(10)
stations <- list(FUN = plot, x = pts[, 1], y = pts[, 2], 
                 asp = 1, pch = 21, col = rgb(sts, 0, 0), 
                 bg = 'white', cex = 2, lwd = 2, 
                 xlim = r[1:2], ylim = r[3:4], axes = FALSE, 
                 xlab = NA, ylab = NA)
labs <- list(FUN=text, x=pts[,1], y=pts[,2], labels=1:10, 
             cex=0.7)
type = 1 + round(2 * sts)
LABELS = c('optimal', 'normal', 'critical')
status <- list(FUN = text, x = pts[, 1], y = pts[, 2], 
               labels = LABELS[type], cex = 0.7, 
               pos = 4, col = rgb(sts, 0, 0))
arrow <- list(FUN = plotArrow, shape = ZU, cex = 0.7)
plotLayers(stations, border, labs, status, arrow)
title(main = "plotLayers example", sub = "Zulia state")
}
\keyword{ vetools }

