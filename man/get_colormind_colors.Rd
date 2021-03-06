% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get.R
\name{get_colormind_colors}
\alias{get_colormind_colors}
\title{Retrieve color palette from colormind, give suggestions}
\usage{
get_colormind_colors(
  x = NULL,
  model = "default",
  user_agent = "colormind R package github.com/dmi3kno/colormind",
  verbose = TRUE,
  ...
)
}
\arguments{
\item{x}{character vector of valid colors in hex or string (color names) format,
which should serve as starting values for generated palette. Can contain missing values.
Maximum length of vector is 5.}

\item{model}{one of color models returned by `get_colormind_models()`. Default value is "default".}

\item{user_agent}{Optional user agent string to be used when querying colormind.io}

\item{verbose}{optional argument for suppressing messages. Default is `TRUE`}

\item{...}{other parameters passed to `config` argument of `httr::POST`}
}
\value{
vector of colors in hex format
}
\description{
Retrieve color palette from colormind, give suggestions
}
\examples{
if(curl::has_internet())
   get_colormind_colors()

}
