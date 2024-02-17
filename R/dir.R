#' <Add Title>
#'
#' <Add Description>
#'
#' @import htmlwidgets
#'
#' @export
listingw <- function(path = ".", recurse = TRUE, show_hidden = FALSE, open = TRUE, width = NULL, height = NULL, elementId = NULL) {

  recurse <- ifelse(isTRUE(recurse), Inf, recurse)
  out <- structure(listing_constructor(path, recurse = recurse, show_hidden = show_hidden, open = open),
                   recurse = recurse,
                   class = c("list"),
                   src = path)

  out_html <- htmltools::div(
    class = "directory",
    tags$ul(class = "directory-list",
            html_listing_constructor(out, recurse = recurse)
    )) |>
    as.character()

  # create widget
  htmlwidgets::createWidget(
    name = 'dir',
    list(html = out_html, list = out),
    width = width,
    height = height,
    package = 'dir',
    elementId = elementId
  )
}

#' Shiny bindings for dir
#'
#' Output and render functions for using dir within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a dir
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name dir-shiny
#'
#' @export
dirOutput <- function(outputId, width = '100%', height = '400px'){
  htmlwidgets::shinyWidgetOutput(outputId, 'dir', width, height, package = 'dir')
}

#' @rdname dir-shiny
#' @export
renderDir <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) { expr <- substitute(expr) } # force quoted
  htmlwidgets::shinyRenderWidget(expr, dirOutput, env, quoted = TRUE)
}
