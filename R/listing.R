

#' Directory listing
#'
#' Create a HTML directory listing that is best used
#' for R Markdown documents with HTML outputs, including
#' for HTML presentations.
#'
#' @param path A path.
#' @param recurse If `TRUE` recurse fully, if a positive number the number of levels to recurse.
#' @param show_hidden If `TRUE` show hidden files and folders.
#' @param open Whether the folders should be open by default.
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param elementId The element ID.
#'
#' @return A list of files and folders.
#'
#' @examples
#' \dontrun{
#' listing(system.file(package = "dir"))
#' }
#'
#' @export
listing <- function(path = ".", recurse = TRUE, show_hidden = FALSE, open = TRUE, width = NULL, height = NULL, elementId = NULL) {

  recurse <- ifelse(isTRUE(recurse), Inf, recurse)
  out <- structure(listing_constructor(path, recurse = recurse, show_hidden = show_hidden, open = open),
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




listing_constructor <- function(x, i = 0, recurse = Inf, show_hidden = FALSE, open = TRUE) {
  bn <- basename(x)
  #if(i >= recurse) return(set_list(bn, "folder", NA, open = open))
  if(is_file(x)) return(set_list(bn, "file"))
  if(i == recurse) return(set_list(bn, "folder", open = open))
  content_list <- lapply(dir(x,
                             include.dirs = TRUE,
                             full.names = TRUE,
                             all.files = show_hidden),
                         function(.x) listing_constructor(.x, i = i + 1, recurse = recurse,
                                                          show_hidden = show_hidden,
                                                          open = open))
  content <- do.call(c, content_list) # but this wipes out the attributes!!
  # patchy solution to get the attributes back
  for(i in seq_along(content)) {
    # need the next two lines because when nesting, names get screwed up
    original_attrs <- attributes(content_list[[i]])
    original_attrs$names <- attr(content[[i]], "names")
    attributes(content[[i]]) <- original_attrs
  }
  set_list(bn, "folder", content, open = open)
}




# @param base Directory path name
# @param i The level of depth.
# @param recurse maximum level of depth to go with respective to the `base`.
html_listing_constructor <- function(listing, i = 0, recurse = Inf, name = NULL) {
  if(i==0) {
    name <- name %||% attr(listing, "src")
    icon <- get_icon(listing)
    listing <- listing[[1]]
    attr(listing, "icon") <- icon
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


