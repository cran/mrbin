% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mrbin.R
\name{intPlus}
\alias{intPlus}
\title{A function for changing plotNMR plots.}
\usage{
intPlus()
}
\value{
{None}
}
\description{
This function increases the intensity of the current NMR spectrum plot.
}
\examples{
mrbin(silent=TRUE,setDefault=TRUE,parameters=list(dimension="1D",binwidth1D=.1,
         PQNScaling="No",
         fixNegatives="No",logTrafo="No",PCA="No",verbose=FALSE,
         NMRfolders=system.file("extdata/1/10/pdata/10",package="mrbin")))
plotNMR()
intPlus()
}