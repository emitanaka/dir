`%||%` <- function(x, y) if (is.null(x)) y else x

#' Test if given path is a file or not.
#'
#' @param x A vector of string
#' @return Returns a logical value indicating whether it is a file or not.
#' @export
is_file <- function(path) {
  if(inherits(path, "list") || is.na(path)) {
    return(attr(path, "type")=="file")
  }
  file_test("-f", path)
}

get_icon <- function(x) {
  attr(x, "icon")
}

#' Test if given object is finder class
#'
#' @param x An object.
#' @export
is_finder <- function(x) {
  inherits(x, "finder")
}

set_list <- function(x, type, content, open = NULL) {
  out <- setNames(list(content), x)
  attr(out, "type") <- type
  if(type=="folder") {
    attr(out, "open") <- open
    attr(out, "icon") <- ifelse(open, "<i class='fas fa-folder-open'></i>", "<i class='fas fa-folder'></i>")
  } else if(type=="file") {
    attr(out, "icon") <- determine_file_icon(x)
  }
  out
}

determine_file_icon <- function(x) {
  ext <- get_file_ext(x)
  switch(tolower(ext),
         "pdf" = '<i class="fas fa-file-pdf"></i>',
         "doc" = ,
         "docx" = '<i class="fas fa-file-word"></i>',
         "mp4" = ,
         "mov" = ,
         "wmv" = ,
         "flv" = ,
         "avi" = ,
         "mkv" = '<i class="fas fa-file-video"></i>',
         "ppt" = ,
         "pptx" = '<i class="fas fa-file-powerpoint"></i>',
         "jpg" = ,
         "png" = ,
         "jpeg" = '<i class="fas fa-file-image"></i>',
         "xls" = ,
         "xlsx" = '<i class="fas fa-file-image"></i>',
         "rmd" = '<i class="fas fa-file-code"></i>',
         "r" = '<i class="fab fa-r-project"></i>',
         "py" = '<i class="fab fa-python"></i>',
         "mp3" = '<i class="fas fa-file-audio"></i>',
         "zip" = '<i class="fas fa-file-archive"></i>',
         "csv" = '<i class="fas fa-file-csv"></i>',
         '<i class="fas fa-file-alt"></i>')
}

# from tools::file_ext
get_file_ext <- function(x) {
  pos <- regexpr("\\.([[:alnum:]]+)$", x)
  ifelse(pos > -1L, substring(x, pos + 1L), "")
}
