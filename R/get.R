#' nsws_east_get
#'
#' @export
#' @description Retrieves external files and store in file cache.
#' @importFrom rappdirs user_data_dir
#' @importFrom utils download.file
#' @importFrom xml2 read_html
#' @importFrom rvest html_attr html_text
#' @param version_id version id
#' @param skip numeric vector of lines to skip on file read. optional.
#' @param dest_folder file.path optional will default to the location returned by \code{\link[rappdirs]{user_data_dir}}.
#' @param compile logical perform on-the-fly compilation to rds?
#' @examples \dontrun{
#' nsws_east_get(version = "1", compile = FALSE)
#' }
nsws_east_get <- function(version_id, skip = NA, dest_folder = NA, compile = TRUE){

  baseurl <- "https://archive.epa.gov/emap/archive-emap/web/"

  dir_scrape <- read_html("https://archive.epa.gov/emap/archive-emap/web/html/els.html")
  metadata_vs_data <- html_text(html_nodes(dir_scrape, "td a"))

  files <- html_attr(html_nodes(dir_scrape, "td a"), "href")
  files <- files[grep("txt", files)]
  files <- sapply(files, function(x) substr(x, 8, nchar(x)))

  baseurl <- "https://archive.epa.gov/emap/archive-emap/web/txt/"

  # dir.exists(cache_path())
  dir.create(cache_path(), showWarnings = FALSE)
  versioned_path <- paste0(cache_path(), version_id)
  dir.create(versioned_path, showWarnings = FALSE)

  invisible(
    lapply(files,
           function(x) get_if_not_exists(
             paste0(baseurl, x), file.path(versioned_path, x))
    ))

  if(compile){
    temp_compile(version_id = version_id, skip = skip)
  }
}

#' nsws_west_get
#'
#' @export
#' @description Retrieves external files and store in file cache.
#' @importFrom rappdirs user_data_dir
#' @importFrom utils download.file
#' @importFrom xml2 read_html
#' @importFrom rvest html_attr html_text
#' @inheritParams nsws_east_get
#' @param compile logical perform on-the-fly compilation to rds?
#' @examples \dontrun{
#' nsws_west_get(version = "1", compile = FALSE)
#' }
nsws_west_get <- function(version_id, skip = NA, dest_folder = NA, compile = TRUE){

  baseurl <- "https://archive.epa.gov/emap/archive-emap/web/"

  dir_scrape <- read_html("https://archive.epa.gov/emap/archive-emap/web/html/wls.html")
  metadata_vs_data <- html_text(html_nodes(dir_scrape, "td a"))

  files <- html_attr(html_nodes(dir_scrape, "td a"), "href")
  files <- files[grep("txt", files)]
  files <- sapply(files, function(x) substr(x, 8, nchar(x)))

  baseurl <- "https://archive.epa.gov/emap/archive-emap/web/txt/"

  # dir.exists(cache_path())
  dir.create(cache_path(), showWarnings = FALSE)
  versioned_path <- paste0(cache_path(), version_id)
  dir.create(versioned_path, showWarnings = FALSE)

  invisible(
    lapply(files,
           function(x) get_if_not_exists(
             paste0(baseurl, x), file.path(versioned_path, x))
    ))

  if(compile){
    temp_compile(version_id = version_id, skip = skip)
  }
}
