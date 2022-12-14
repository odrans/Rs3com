% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/nml.r
\name{nml_write_fun}
\alias{nml_write_fun}
\title{General function writing a namelist file from a list}
\usage{
nml_write_fun(fn.nml, l, file_new = FALSE)
}
\arguments{
\item{fn.nml}{character, name of the output namelist file}

\item{l}{list, part of the namelist variables created by the \code{nml_load_default} function}

\item{file_new}{logical, create a new file (TRUE) or append to an existing one (FALSE). Default is FALSE.}
}
\value{
Namelist file for S3COM binary
}
\description{
General function writing a namelist file from a list
}
