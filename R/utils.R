`%||%` <- function(x, y) if (is.null(x)) y else x

#' Test if given path is a file or not.
#'
#' @param x A vector of string
#' @return Returns a logical value indicating whether it is a file or not.
#' @export
is_file <- function(path) {
  if(inherits(path, "list") || is.na(path)) {
    type <- attr(path, "type") %||% "not_found"
    return(type=="file")
  }
  file_test("-f", path)
}

get_icon <- function(x) {
  attr(x, "icon")
}

#' Test if given object is finder class
#'
#' @param x An object.
#' @return A logical value.
#' @export
is_listing <- function(x) {
  inherits(x, "listing")
}

set_list <- function(x, type, content, open = NULL) {
  out <- setNames(list(content), x)
  attr(out, "type") <- type
  if(type=="folder") {
    attr(out, "open") <- open
    attr(out, "icon") <- if(open) tags$i(class='fas fa-folder-open') else tags$i(class='fas fa-folder')
  } else if(type=="file") {
    attr(out, "icon") <- determine_file_icon(x)
  }
  out
}

determine_file_icon <- function(x) {
  ext <- get_file_ext(x)
  switch(tolower(ext),
         "pdf" = tags$i(class="fas fa-file-pdf"),
         "doc" = ,
         "docx" = tags$i(class="fas fa-file-word"),
         "mp4" = ,
         "mov" = ,
         "wmv" = ,
         "flv" = ,
         "avi" = ,
         "mkv" = tags$i(class="fas fa-file-video"),
         "ppt" = ,
         "pptx" = tags$i(class="fas fa-file-powerpoint"),
         "jpg" = ,
         "png" = ,
         "jpeg" = tags$i(class="fas fa-file-image"),
         "xls" = ,
         "xlsx" = tags$i(class="fas fa-file-image"),
         "rmd" = tags$i(class="fas fa-file-code"),
         "r" = tags$i(class="fab fa-r-project"),
         "py" = tags$i(class="fab fa-python"),
         "js" = tags$i(class="fab fa-js"),
         "mp3" = tags$i(class="fas fa-file-audio"),
         "zip" = tags$i(class="fas fa-file-archive"),
         "csv" = tags$i(class="fas fa-file-csv"),
         tags$i(class = "fas fa-file-alt"))
}

# from tools::file_ext
get_file_ext <- function(x) {
  pos <- regexpr("\\.([[:alnum:]]+)$", x)
  ifelse(pos > -1L, substring(x, pos + 1L), "")
}


