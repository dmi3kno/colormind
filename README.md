
<!-- README.md is generated from README.Rmd. Please edit that file -->

# colormind <a href='https://dmi3kno.github.io/colormind'><img src='man/figures/logo.png' align="right" height="200" /></a>

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

The goal of `colormind` is to assist in generating aesthetically
pleasing color scales using [colormind.io](http://colormind.io) palette
generator.

## Installation

You can install the development version of `colormind` from
[Github](https://github.com) with:

``` r
remotes::install_github("dmi3kno/colormind")
```

## Example

Colormind.io is a color scheme generator that uses deep learning. It can
learn color styles from photographs, movies, and popular art. Check
[colormind.io](http://colormind.io) for currently loaded color models
(sample palettes) or retrieve them directly into your R session with
`get_colormind_models()`. Color models get updated daily.

``` r
library(colormind)
## basic example code
mods <- get_colormind_models()
mods
#> [1] "ui"                "default"           "communist"        
#> [4] "only_god_forgives" "water_color"       "lego_movie"
```

Here’s randomly generated palette using “default” color model.

``` r
colp <- get_colormind_colors()
#> Querying colormind with model: default
scales::show_col(colp, borders = NA)
```

<img src="man/figures/README-unnamed-chunk-2-1.png" width="100%" />

You can also “seed” palette with your own colors. In order to do that,
you need to pass a color vector (maximum length 5) with some values
filled in. If you want something closer to diverging palette, you might
want to try placing your suggested colors to opposite ends of a vector.

``` r
colp <- c("#006494", NA, NA, NA, "#dc493a")
scales::show_col(colp, borders = NA)
```

<img src="man/figures/README-pressure-1.png" width="100%" />

The missing values in your vector will be complemented by colormind.io
using current color model.

``` r
colr <- get_colormind_colors(colp, "default")
#> Querying colormind with model: default
scales::show_col(colr, borders = NA)
```

<img src="man/figures/README-unnamed-chunk-3-1.png" width="100%" />

Colors are randomized every time you hit an API, so you may try it
several times, or try another color model.

``` r
library(purrr)
slow_get_colormind_colors <- slowly(get_colormind_colors, rate = rate_delay(3))

walk(mods, ~slow_get_colormind_colors(colp, model=.x) %>% 
           scales::show_col(borders = NA))
#> Querying colormind with model: ui
#> Querying colormind with model: default
```

<img src="man/figures/README-unnamed-chunk-4-1.png" width="100%" />

    #> Querying colormind with model: communist

<img src="man/figures/README-unnamed-chunk-4-2.png" width="100%" />

    #> Querying colormind with model: only_god_forgives

<img src="man/figures/README-unnamed-chunk-4-3.png" width="100%" />

    #> Querying colormind with model: water_color

<img src="man/figures/README-unnamed-chunk-4-4.png" width="100%" />

    #> Querying colormind with model: lego_movie

<img src="man/figures/README-unnamed-chunk-4-5.png" width="100%" /><img src="man/figures/README-unnamed-chunk-4-6.png" width="100%" />
