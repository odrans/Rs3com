#' Load the namelist parameters needed by S3COM
#' @return list, Namelist parameters S3COM
#' @export
nml_load_default <- function() {

  l <- vector("list")

  # General parameters
  l$general <- list(
    fname_in = NA,
    fname_out = paste0(Sys.getenv("HOME"), "/s3com_output.nc"),
    month = 1,
    flag_retrievals = FALSE,
    npoints_it = 1,
    nchannels = 2
  )

  # RTTOV initiation
  l$rttov_init <- list(
    path_rttov = NA,
    addrefrac = TRUE,
    ir_scatt_model = 1,
    vis_scatt_model = 1,
    dom_nstreams = 8,
    dom_rayleigh = FALSE
  )

  # RTTOV information
  l$rttov <- list(
    platform = 9,
    satellite = 2,
    instrument = 13,
    channel_list = c(1, 2)
  )

  return(l)
}

#' Write the S3COM namelist file
#' @param fn.nml character, name of the output namelist file
#' @param l list, namelist variables created by the `nml_load_default` function
#' @return Namelist file for S3COM binary
#' @export
nml_write <- function(fn.nml, l) {

  null <- nml_write_fun(fn.nml, l$general, file_new = TRUE)
  null <- nml_write_fun(fn.nml, l$rttov_init)
  null <- nml_write_fun(fn.nml, l$rttov)

  return(NULL)
}

#' General function writing a namelist file from a list
#' @param fn.nml character, name of the output namelist file
#' @param l list, part of the namelist variables created by the `nml_load_default` function
#' @param file_new logical, create a new file (TRUE) or append to an existing one (FALSE). Default is FALSE.
#' @return Namelist file for S3COM binary
nml_write_fun<- function(fn.nml, l, file_new = FALSE) {
  nml.name <- gsub("l.", "", deparse(substitute(l)))

  if(file_new) file.remove(fn.nml)
  write.table(paste0("&", nml.name), fn.nml, col.names = FALSE, row.names = FALSE, quote = F, append = TRUE)
  for(i in 1:length(l)) {
    var <- l[[i]]
    if(is.character(var)) var <- paste0("'",var,"'")
    if(length(var)!=1) var <- paste(var, collapse = ", ")
    names(var) <- names(l)[i]
    write.table(var, fn.nml, col.names = FALSE, sep = " = ", quote = F, append = TRUE)
  }
  write.table("/", fn.nml, col.names = FALSE, row.names = FALSE, quote = F, append = TRUE)
  write.table("", fn.nml, col.names = FALSE, row.names = FALSE, quote = F, append = TRUE)

  return(NULL)
}
