
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dir

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
<!-- badges: end -->

The `dir` package makes a HTML widget to display a pretty collapsible
list of files and folders. This is useful for demonstrating or
discussing folder structures.

## Installation

``` r
# install.packages("remotes")
remotes::install_github("emitanaka/dir")
```

## Usage

Look at the output at <https://emitanaka.org/dir/articles/demo.html> for
demonstration.

``` r
dir::listing()
dir::listing(recurse = 1)
dir::listing(recurse = 2)
```
