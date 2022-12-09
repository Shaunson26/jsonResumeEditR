#' Run jsonResumeEditR
#'
#' Run jsonResumeEditR shipped with the R package
#'
#' @param test logical, whether skip running the app. Used in testing.
#'
#' @export
run_jsonResumeEditR <- function(test = FALSE) {

  appDir <- system.file("shiny-examples", "jsonResumeEditR", package = "jsonResumeEditR")

  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `jsonResumeEditR`.", call. = FALSE)
  }

  if (!test) {
    shiny::runApp(appDir, display.mode = "normal")
  }
}
