

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
#'
#' @return A list of files and folders.
#'
#' @examples
#' \dontrun{
#' listing(system.file(package = "dir"))
#' }
#'
#' @export
listing <- function(path = ".", recurse = TRUE, show_hidden = FALSE, open = TRUE) {
  recurse <- ifelse(isTRUE(recurse), Inf, recurse)
  out <- structure(listing_constructor(path, recurse = recurse, show_hidden = show_hidden, open = open),
                   recurse = recurse,
                   class = c("listing", "list"),
                   src = path)
  #attributes(out[[1]]) <- c(attributes(out[[1]]),
  #                            list(type = ifelse(is_file(path), "file", "folder"),
  #                                 icon = if(is_file(path)) determine_file_icon(x) else
  #                                               if(open) tags$i(class='fas fa-folder-open') else
  #                                                      tags$i(class='fas fa-folder')))
  out
}




listing_constructor <- function(x, i = 0, recurse = Inf, show_hidden = FALSE, open = TRUE) {
  bn <- basename(x)
  #if(i >= recurse) return(set_list(bn, "folder", NA, open = open))
  if(is_file(x)) return(set_list(bn, "file", NA))
  if(i == recurse) return(set_list(bn, "folder", NA, open = open))
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

