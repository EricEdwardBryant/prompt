#' Choose a directory
#'
#' Prompt user to choose a directory.
#'
#' @param prompt String. Prompt to guide user.
#'
#' @details
#' \describe{
#'   \item{Mac}{Applescript is used to prompt to open a system file browser.
#'   The user is restricted to selecting only directories.}
#'   \item{Windows}{The Windows only \code{utils::choose.dir}}
#'   \item{Unix}{If \code{tcltk} is available that is used. Otherwise, a text
#'   prompt is generated via \link[base]{readline}}
#'   \item{unknown}{In the case of an unknown system, a text prompt is generated
#'   via \link[base]{readline}}
#' }
#'
#' @examples
#' \dontrun{
#'   prompt_dir('Please select a directory')
#' }
#' @export

prompt_dir <- function(prompt = '', ...) {
  assert_that(is.string(prompt))
  if (prompt != '') message(prompt)
  switch(
    get_os(),
    mac  = dir_mac(prompt, ...),
    win  = dir_windows(prompt, ...),
    unix = if (use_tk()) dir_tcltk(prompt, ...) else dir_text(prompt, ...),
    dir_text(prompt, ...)
  )
}


# ---- Methods ----
dir_text <- function(prompt, ...) {
  result <- gsub('/$', '', readline(': '))
  assert_that(is.dir(result))
  return(result)
}

dir_mac <- function(prompt, ...) {
  script <- shQuote(system.file('mac/dir.applescript', package = 'prompt'))
  gsub('/$', '', system(paste('osascript', script), intern = T))
}

dir_windows <- function(prompt, ...) {
  utils::choose.dir(caption = prompt, ...)
}

dir_tcltk <- function(prompt, ...) {
  tcltk::tk_choose.dir(caption = prompt, ...)
}
