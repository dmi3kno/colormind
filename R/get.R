
#' Get currently available models
#'
#' @param user_agent Optional user agent string to be used when querying colormind.io
#' @param ... other parameters passed to `config` argument of `httr::GET`
#' @return character vector of color models
#'
#' @examples
#' if(curl::has_internet())
#'   get_colormind_models()
#'
#' @importFrom httr GET content
## usethis::use_package("httr")
#' @importFrom jsonlite fromJSON
## usethis::use_package("jsonlite")
#' @export
get_colormind_models <- function(user_agent="colormind R package github.com/dmi3kno/colormind", ...){
  Sys.sleep(3)
  res <- httr::GET("http://colormind.io/list",
                   config = c(httr::config(autoreferer = 1L),
                              httr::add_headers("user-agent"=user_agent),
                              ...)) # make polite GET
  jsonlite::fromJSON(httr::content(res, as = "text"))$result
}

#' Retrieve color palette from colormind, give suggestions
#'
#' @param x character vector of valid colors in hex or string (color names) format,
#' which should serve as starting values for generated palette. Can contain missing values.
#' Maximum length of vector is 5.
#' @param model one of color models returned by `get_colormind_models()`. Default value is "default".
#' @param user_agent Optional user agent string to be used when querying colormind.io
#' @param verbose optional argument for suppressing messages. Default is `TRUE`
#' @param ... other parameters passed to `config` argument of `httr::POST`
#'
#' @return vector of colors in hex format
#' @examples
#' if(curl::has_internet())
#'    get_colormind_colors()
#'
#' @importFrom httr POST content
#' @importFrom jsonlite fromJSON
#' @export
get_colormind_colors <- function(x=NULL, model="default",
                                 user_agent="colormind R package github.com/dmi3kno/colormind",
                                 verbose=TRUE, ...){
  # prepare the query string
  req <- prepare_colormind_query(x, model)
  # query the service like
  if (verbose)
    message("Querying colormind with model: ", model)
  Sys.sleep(3)
  res <- httr::POST(url='http://colormind.io/api/',
                    body = req,
                    config =c(httr::config(autoreferer = 1L),
                              httr::add_headers("user-agent"=user_agent),
                              ...))
  res_json <- httr::content(res, as = "text")
  res_mcol <- jsonlite::fromJSON(res_json)$result
  rgba2hex(res_mcol)
}
