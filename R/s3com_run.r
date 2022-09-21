#' Run S3COM using a specified namelist file
#' @param fn_nml character, name of the namelist file
#' @param path_s3com path to the S3COM binary
#' @return NULL
#' @export
s3com_run <- function(fn_nml, path_s3com) {
  cmd <- paste0(path_s3com, "/s3com ", fn_nml)
  system(cmd, ignore.stdout = TRUE)

  return(NULL)
}
