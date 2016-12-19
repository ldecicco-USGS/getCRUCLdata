#' @title Download and Create a Data Frame Object of CRU CL2.0 Weather
#' Variables
#'
#'@description This function automates downloading and importing CRU CL2.0
#'climate data into R and calculates minimum and maximum temperature for use
#'in an R session.
#'
#'For more information see the description of the data provided by CRU,
#'\url{http://www.cru.uea.ac.uk/cru/data/hrg/tmc/readme.txt}
#'
#'Nomenclature and units from readme.txt:
#'Nomenclature and Units
#'----------------------
#'pre	precipitation		mm/month
#'cv of precipitation 	percent
#'rd0	wet-days		no days with >0.1mm rain per month
#'tmp	mean temperature	Deg C
#'dtr	mean diurnal temperature range-Deg C (note tmx = tmp + 0.5 * dtr;
#'tmn = tmp - 0.5 * dtr)
#'reh	relative humidity	percent
#'sunp	sunshine		percent of maximum possible (percent of daylength)
#'frs	ground-frost		no days with ground-frost per month
#'wnd	10m windspeed		m/s
#'elv	elevation		km
#'
#' @details This function generates a data.frame object in R
#' @param pre Logical. Fetch precipitation (mm/month) from server and return in
#' the data frame? Defaults to FALSE.
#' @param pre_cv Logical. Fetch cv of precipitation (percent) from server and
#' return in the data frame? Defaults to FALSE.
#' @param rd0 Logical. Fetch wet-days (number days with >0.1mm rain per month)
#' and return in the data frame? Defaults to FALSE.
#' @param dtr Logical. Fetch mean diurnal temperature range (degrees C) and
#' return it in the data frame? Defaults to FALSE.
#' @param tmp Logical. Fetch temperature (degrees C) and return it in the data
#' frame? Defaults to FALSE.
#' @param tmn Logical. Create minimum temperature values (degrees C) and return
#' it in the data frame? Defaults to FALSE.
#' @param tmx Logical. Create maxium temperature (degrees C) and return it in
#' the data frame? Defaults to FALSE.
#' @param reh Logical. Fetch relative humidity and return it in the data frame?
#' Defaults to FALSE.
#' @param sunp Logical. Fetch sunshine, percent of maximum possible (percent of
#' daylength) and return it in data frame? Defaults to FALSE.
#' @param frs Logical. Fetch ground-frost records (number of days with ground-
#' frost per month) and return it in data frame? Defaults to FALSE.
#' @param wnd Logical. Fetch 10m windspeed (m/s) and return it in the data
#' frame? Defaults to FALSE.
#' @param elv Logical. Fetch elevation (converted to metres from kilometres) and
#' return it in the data frame? Defaults to FALSE.
#'
#' @examples
#' # Download data and create a raster stack of precipitation and temperature
#' \dontrun{
#' CRU_pre_tmp <- create_CRU_df(pre = TRUE, tmp = TRUE)
#'}
#' @export
create_CRU_df <- function(pre = FALSE,
                          pre_cv = FALSE,
                          rd0 = FALSE,
                          tmp = FALSE,
                          dtr = FALSE,
                          reh = FALSE,
                          tmn = FALSE,
                          tmx = FALSE,
                          sunp = FALSE,
                          frs = FALSE,
                          wnd = FALSE,
                          elv = FALSE) {
  if (!isTRUE(pre) & !isTRUE(pre_cv) & !isTRUE(rd0) & !isTRUE(tmp) &
      !isTRUE(dtr) & !isTRUE(reh) & !isTRUE(tmn) & !isTRUE(tmx) &
      !isTRUE(sunp) & !isTRUE(frs) & !isTRUE(wnd) & !isTRUE(elv)) {
    stop("You must select at least one parameter for download.")
  }

  cache_dir <- tempdir()

  .get_CRU(pre,
           pre_cv,
           rd0,
           tmp,
           dtr,
           reh,
           tmn,
           tmx,
           sunp,
           frs,
           wnd,
           elv,
           cache_dir)

  CRU_df <-
    .tidy_df(pre,
             pre_cv,
             rd0,
             tmp,
             dtr,
             reh,
             tmn,
             tmx,
             sunp,
             frs,
             wnd,
             elv,
             cache_dir)

  return(CRU_df)
}