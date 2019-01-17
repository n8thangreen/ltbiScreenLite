
#' Save session info
#'
#' Text file includes package dependencies, versions, etc.
#'
#' @param file string location
#'
#' @return
#' @export
#' @import sessioninfo
#' @import git2r
#'
save_session_info <- function(file) {

  sink(here(file))
  on.exit(sink())

  print(sessioninfo::session_info())
  print(git2r::repository())
}
