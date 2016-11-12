#' @import assertthat
NULL

#' Choose a single file
#'
#' Prompt a user to choose a single file.
#'
#' @param prompt String. Prompt to guide user.
#'
#' @details This is an alias for \link[base]{file.choose} that messages the
#' user with a prompt to guide them on what they should be choosing.
#' @export

prompt_file <- function(prompt = 'Select a file') {
  assert_that(is.string(prompt))
  message(prompt)
  file.choose()
}


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
#' @export

prompt_files <- function(prompt = 'Select files') {
  assert_that(is.string(prompt))
  switch(
    get_os(),
    mac  = files_mac(prompt),
    win  = files_win(prompt),
    unix = files_unix(prompt),
    files_default(prompt)
  )
}

#' Choose a directory
#'
#' Prompt user to choose a directory.
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
#' @export

prompt_dir <- function(prompt = 'Select a directory') {
  assert_that(is.string(prompt))
  switch(
    get_os(),
    mac  = dir_mac(prompt),
    win  = dir_windows(prompt),
    unix = dir_unix(prompt),
    dir_default(prompt)
  )
}
