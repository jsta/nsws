% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ingest.R
\name{nsws_ingest}
\alias{nsws_ingest}
\title{Ingest flat files}
\usage{
nsws_ingest(version_id, folder = NA, skip = NA)
}
\arguments{
\item{version_id}{character temp database version string}

\item{folder}{file.path to data folder. optional.}

\item{skip}{numeric vector of lines to skip on file read. optional.}
}
\description{
Ingest data from component flat files
}
\examples{
\dontrun{
nsws <- nsws:::nsws_ingest("1")
}

}
