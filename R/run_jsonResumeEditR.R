#' Run jsonResumeEditR
#'
#' Run jsonResumeEditR shipped with the R package
#'
#' @param testDir logical, test whether function can find the app directory and skip starting the app. Used in testing.
#'
#' @export
run_jsonResumeEditR <- function(testDir = FALSE) {

  appDir <- system.file("jsonResumeEditR", package = "jsonResumeEditR")

  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `jsonResumeEditR`.", call. = FALSE)
  }

  if (!testDir) {
    shiny::runApp(appDir, display.mode = "normal")
  }
}
