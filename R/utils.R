#' INTERNAL function for making json string for colormind query
#'
#' @param x vector of colors with missing values
#' @param model one of valid models for colormind
#'
#' @return properly formatted query string
#'
## usethis::use_package("utils")
#' @importFrom utils head
prepare_colormind_query <- function(x, model){
  lst <- list(model=model)

  if(!is.null(x)){
    x <- utils::head(c(x, rep(NA_character_, times=4)), 5) # pad it with NAs
    x_mat <- hex2rgba(x)
    x_lst <- lapply(seq_len(nrow(x_mat)), function(i) if(x_mat[i,4]==0) "N" else x_mat[i,1:3])
    lst <- c(list(input=x_lst), lst)
  }
  jsonlite::toJSON(lst, auto_unbox = TRUE)
}

#' INTERNAL function for converting rgba to hex
#' @param r,g,b,a vectors for r, g, b, a or a matrix of colors
## usethis::use_package("grDevices")
#' @importFrom grDevices rgb
rgba2hex <- function(r,g,b,a) {grDevices::rgb(r, g, b, a, maxColorValue = 255)}

#' INTERNAL function for converting color to rgba
#' @param x vector of colors (named or hex values)
#' @param alpha logical whether to include transparency. Default is TRUE
## usethis::use_package("grDevices")
#' @importFrom grDevices col2rgb
hex2rgba <- function(x, alpha=TRUE){t(grDevices::col2rgb(x, alpha = alpha))}
