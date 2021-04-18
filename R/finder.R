

#' Directory listing
#'
#' Create a HTML directory listing that is best used
#' for R Markdown documents with HTML outputs, including
#' for HTML presentations.
#'
#' \dontrun{
#' finder(system.file(package = "dir"))
#' }
#' @param x A path or a finder object.
#' @param class An optional subclass to add.
#'
#' @importFrom htmltools tagList tags HTML htmlDependency htmlDependencies div span browsable
#'
#' @export
finder <- function(x = ".", class = NULL, max = Inf, show_hidden = FALSE, open = TRUE) {
  if(is.character(x)) {
    out <- structure(list_finder_constructor(x, max = max, show_hidden = show_hidden, open = open),
                     class = c(class, "finder", "list"),
                     src = x)
    attributes(out[[1]]) <- c(attributes(out[[1]]),
                              list(type = ifelse(is_file(x), "file", "folder"),
                                   icon = ifelse(is_file(x),
                                                 determine_file_icon(x),
                                                 ifelse(open,
                                                        "<i class='fas fa-folder-open'></i>",
                                                        "<i class='fas fa-folder'></i>"))))
    out
  } else if(is_finder(x)){
    x
  } else {
    stop("Unsupported object type.")
  }
}




# @param base Directory path name
# @param i The level of depth.
# @param max Maximum level of depth to go with respective to the `base`.
html_finder_constructor <- function(.finder, i = 0, max = Inf) {
  if(i >= max || is.na(.finder)) return(NULL)
  #browser()
  res <- lapply(seq_along(.finder), function(j) {
    x <- .finder[[j]]
    nm <- names(.finder)[j]
    if(is_file(.finder) || i == (max - 1)) {
      out <- tags$li(get_icon(x), nm)
    } else {
      out <- tags$li(get_icon(x), nm,
                     tags$ul(
                       tagList(lapply(x,
                                      function(.x) html_finder_constructor(.x, i = i + 1, max = max)))
                     ))
    out
  }})
  if(i==0) return(tags$ul(class = "directory-list",
                          res))
  return(res)
}

# # @param base Directory path name
# # @param i The level of depth.
# # @param max Maximum level of depth to go with respective to the `base`.
# html_finder_constructor_old <- function(base, i = 0, max = Inf) {
#   if(i >= max) return(NULL)
#   if(is_file(base)) {
#     x <- tags$li(tags$i(class = "fa fa-file"), basename(base))
#   } else if(i==max - 1) {
#     x <- tags$li(tags$i(class = "fa fa-folder-open"), basename(base))
#   } else {
#     x <- tags$li(tags$i(class = "fa fa-folder-open"), basename(base),
#                  tags$ul(
#                    tagList(lapply(file.path(base, dir(base, include.dirs = TRUE)),
#                                   function(.x) html_finder_constructor(.x, i = i + 1, max = max)))
#                  ))
#   }
#   if(i==0) return(tags$ul(class = "directory-list",
#                           x))
#   return(x)
# }

list_finder_constructor <- function(x, i = 0, max = Inf, show_hidden = FALSE, open = TRUE) {
  bn <- basename(x)
  if(i >= max) return()
  if(is_file(x)) return(set_list(bn, "file", NA))
  if(i == (max - 1)) return(set_list(bn, "folder", NA, open = open))
  content_list <- lapply(dir(x,
                             include.dirs = TRUE,
                             full.names = TRUE,
                             all.files = show_hidden),
                    function(.x) list_finder_constructor(.x, i = i + 1, max = max,
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
  set_list(bn, "folder",
           content,
           open = open)
}

