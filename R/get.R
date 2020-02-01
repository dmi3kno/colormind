
#' Get currently available models
#'
#' @return character vector of color models
#'
#' @examples
#' get_colormind_models()
#'
#' @importFrom httr GET content
## usethis::use_package("httr")
#' @importFrom jsonlite fromJSON
## usethis::use_package("jsonlite")
#' @export
get_colormind_models <- function(){
  res <- httr::GET("http://colormind.io/list") # make polite GET
  jsonlite::fromJSON(httr::content(res, as = "text"))$result
}

#' Retrieve color palette from colormind, give suggestions
#'
#' @param x character vector of valid colors in hex or string (color names) format,
#' which should serve as starting values for generated palette. Can contain missing values.
#' Maximum length of vector is 5.
#' @param model one of color models returned by `get_colormind_models()`. Default value is "default".
#' @param verbose optional argument for suppressing messages. Default is `TRUE``
#'
#' @return vector of colors in hex format
#' @examples
#' get_colormind_colors()
#'
#' @importFrom httr POST content
#' @importFrom jsonlite fromJSON
#' @export
get_colormind_colors <- function(x=NULL, model="default", verbose=TRUE){
  # prepare the query string
  req <- prepare_colormind_query(x, model)
  # query the service like
  if (verbose)
    message("Querying colormind with model: ", model)
  res <- httr::POST(url='http://colormind.io/api/',
                    body = req)
  res_json <- httr::content(res, as = "text")
  res_mcol <- jsonlite::fromJSON(res_json)$result
  rgba2hex(res_mcol)
}
