#' Choose multiple files
#'
#' Prompt a user to choose one or more files.
#'
#' @param prompt String. Prompt to guide user.
#'
#' @details
#' \describe{
#'   \item{mac}{Implementation details}
#'   \item{windows}{Implementation details}
#'   \item{unix}{Implementation details}
#'   \item{unknown}{Implementation details}
#' }
#'
#' @examples
#' \dontrun{
#'   prompt_files('Please select one or more files')
#' }
#'
#' @export

prompt_files <- function(prompt = '', ...) {
  assert_that(is.string(prompt))
  if (prompt != '') message(prompt)
  switch(
    get_os(),
    mac  = files_mac(prompt, ...),
    win  = files_win(prompt, ...),
    unix = files_unix(prompt, ...),
    files_default(prompt, ...)
  )
}


# ---- Methods ----
files_default <- function(prompt, ...) {
  assert_that(tcltk_available())
  tcltk::tk_choose.files(caption = prompt, ...)
}

files_mac <- function(prompt, ...) {
  script <- shQuote(system.file('mac/files.applescript', package = 'prompt'))
  system(paste('osascript', script), intern = T)
}

files_windows <- function(prompt, ...) {
  utils::choose.files(caption = prompt, ...)
}

files_unix <- function(prompt, ...) {
  assert_that(tcltk_available())
  tcltk::tk_choose.files(caption = prompt, ...)
}
