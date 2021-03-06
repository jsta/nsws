% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get.R
\name{nsws_west_get}
\alias{nsws_west_get}
\title{nsws_west_get}
\usage{
nsws_west_get(version_id, skip = NA, dest_folder = NA, compile = TRUE)
}
\arguments{
\item{version_id}{version id}

\item{skip}{numeric vector of lines to skip on file read. optional.}

\item{dest_folder}{file.path optional will default to the location returned by \code{\link[rappdirs]{user_data_dir}}.}

\item{compile}{logical perform on-the-fly compilation to rds?}
}
\description{
Retrieves external files and store in file cache.
}
\examples{
\dontrun{
nsws_west_get(version = "1")
}
}
