
#' @export
print.finder <- function(x, ...) {
  tmpdir <- tempfile("finder")
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


  out <- div(
    class = c(class, "directory"),
    html_finder_constructor(x),
    htmltools::includeScript(file.path(tmpdir, "dir.js"))
  )

  htmltools::htmlDependencies(out) <- htmlDependency(
    "dir",
    version = utils::packageVersion("dir"),
    src = tmpdir,
    script = "jQuery/jquery-3.6.0.min.js",
    stylesheet = c("dir.css", "fontawesome/css/all.min.css"),
    all_files = TRUE
  )
  browsable(out)
}
