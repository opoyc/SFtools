#' Get life savers data
#'
#' @param lifesavers_path string. Has the default directory
#'
#' @return tibble
#' @author Obryan Poyser
#'
#' @examples
#' \dontrun{
#' load_lifesavers()
#' }
load_lifesavers <- function(lifesavers_path){
    if(missing(lifesavers_path)){
        lifesavers_path <- "//sinsdfs01/regional$/APJ-SC-HUB/SC.DATA/DATA/Active/Specific.LSD.Rdata"
    }
    local_env <- new.env()
    load(lifesavers_path, envir = local_env)
    names(local_env$LSD) <- c("loc", "gmid", "lsd")
    local_env$LSD$key <- paste0(strtrim(local_env$LSD$loc, 2), ": ", local_env$LSD$gmid)
    lsd <- na.omit(local_env$LSD[c("key", "gmid", "lsd")])
    if(on_globalenv==T){
        lsd <<- lsd
    } else {
        return(lsd)
    }
}
