
#' @export
print.listing <- function(x, ...) {
  tmpdir <- tempfile("listing-")
  dir.create(tmpdir)
  file.copy(system.file("dir.js", package = "dir"),
            file.path(tmpdir, "dir.js"))
  file.copy(system.file("dir.css", package = "dir"),
            file.path(tmpdir, "dir.css"))
  file.copy(system.file("fontawesome", package = "dir"),
            tmpdir, recursive = TRUE)
  file.copy(system.file("jQuery", package = "dir"),
            tmpdir, recursive = TRUE)
  #css_template <- readLines(system.file("dir.css", package = "dir"))
  css_file <- file.path(tmpdir, "dir.css")


  out <- htmltools::div(
    class = "directory",
    tags$ul(class = "directory-list",
            html_listing_constructor(x, recurse = attr(x, "recurse")))
  )

  htmltools::htmlDependencies(out) <- htmltools::htmlDependency(
    "dir",
    version = utils::packageVersion("dir"),
    src = tmpdir,
    script = c("jQuery/jquery-3.6.0.min.js", "dir.js"),
    stylesheet = c("dir.css", "fontawesome/css/all.min.css"),
    all_files = TRUE
  )
  if(interactive()) print(htmltools::browsable(out))
  print(out)
}



# @param base Directory path name
# @param i The level of depth.
# @param recurse maximum level of depth to go with respective to the `base`.
html_listing_constructor <- function(listing, i = 0, recurse = Inf, name = NULL) {
  if(i==0 && is_listing(listing)) {
    name <- name %||% attr(listing, "src")
    listing <- listing[[1]]
  }
  if(is_file(listing) || i == recurse) {
    return(tags$li(get_icon(listing), name))
  }
  nms <- names(listing)
  tags$li(get_icon(listing), name,
          tags$ul(
            tagList(lapply(seq_along(listing),
                           function(j) html_listing_constructor(listing[[j]],
                                                                i = i + 1,
                                                                recurse = recurse,
                                                                name = nms[j])))
          ))
}

#' @importFrom knitr knit_print
#' @export
knit_print.listing <- function(x, ...) {
  print(x)
  x
}

