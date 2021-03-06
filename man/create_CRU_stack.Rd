% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_CRU_stack.R
\name{create_CRU_stack}
\alias{create_CRU_stack}
\title{Download and Create a List of Raster Stack Objects From CRU CL2.0 Climatology Variables}
\usage{
create_CRU_stack(pre = FALSE, pre_cv = FALSE, rd0 = FALSE, tmp = FALSE,
  dtr = FALSE, reh = FALSE, tmn = FALSE, tmx = FALSE, sunp = FALSE,
  frs = FALSE, wnd = FALSE, elv = FALSE)
}
\arguments{
\item{pre}{Logical. Fetch precipitation (millimetres/month) from server and
return in a raster stack? Defaults to FALSE.}

\item{pre_cv}{Logical. Fetch cv of precipitation (percent) from server and
return in a raster stack? Defaults to FALSE.}

\item{rd0}{Logical. Fetch wet-days (number days with >0.1 millimetres rain
per month) and return in a raster stack? Defaults to FALSE.}

\item{tmp}{Logical. Fetch temperature (degrees Celsius) and return it in the
raster stack? Defaults to FALSE.}

\item{dtr}{Logical. Fetch mean diurnal temperature range (degrees Celsius)
and return it in a raster stack? Defaults to FALSE.}

\item{reh}{Logical. Fetch relative humidity and return it in a raster stack?
Defaults to FALSE.}

\item{tmn}{Logical. Calculate minimum temperature values (degrees Celsius)
and return it in a raster stack? Defaults to FALSE.}

\item{tmx}{Logical. Calculate maximum temperature (degrees Celsius) and
return it in a raster stack? Defaults to FALSE.}

\item{sunp}{Logical. Fetch sunshine, percent of maximum possible (percent of
day length) and return it in raster stack? Defaults to FALSE.}

\item{frs}{Logical. Fetch ground-frost records (number of days with ground-
frost per month) and return it in raster stack? Defaults to FALSE.}

\item{wnd}{Logical. Fetch 10m wind speed (metres/second) and return it in the
raster stack? Defaults to FALSE.}

\item{elv}{Logical. Fetch elevation (converted to metres) and return it in a
raster layer object? Defaults to FALSE.}
}
\description{
This function automates downloading and importing CRU CL2.0
climatology data into R and creates a list of raster stacks of the data.  If
requested, minimum and maximum temperature may also be automatically
calculated as described in the data readme.txt file.

Nomenclature and units from readme.txt:
\describe{
\item{pre}{precipitation (millimetres/month)}
 \describe{
   \item{cv}{cv of precipitation (percent)}
 }
\item{rd0}{wet-days (no days with >0.1mm rain per month)}
\item{tmp}{mean temperature (degrees Celsius)}
\item{dtr}{mean diurnal temperature range (degrees Celsius)}
\item{reh}{relative humidity (percent)}
\item{sunp}{sunshine (percent of maximum possible (percent of day length))}
\item{frs}{ground-frost (number of days with ground-frost per month)}
\item{wnd}{10 metre windspeed (metres/second)}
\item{elv}{elevation (automatically converted to metres)}
}
For more information see the description of the data provided by CRU,
\url{https://crudata.uea.ac.uk/cru/data/hrg/tmc/readme.txt}
}
\details{
This function generates a data.frame object in R with the following
possible fields as specified by the user:
}
\note{
This package automatically converts elevation values from kilometres to
metres.

This package crops all spatial outputs to an extent of ymin = -60, ymax = 85,
xmin = -180, xmax = 180. Note that the original wind data include land area
for parts of Antarctica, these data are excluded in the raster stacks
generated by this function.
}
\examples{
# Download data and create a raster stack of precipitation and temperature
\dontrun{
CRU_pre_tmp <- create_CRU_stack(pre = TRUE, tmp = TRUE)
}
}
\seealso{
\code{\link{create_CRU_df}}
}
