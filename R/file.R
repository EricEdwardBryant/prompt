#' Choose a single file
#'
#' Prompt a user to choose a single file.
#'
#' @param prompt String. Message to guide user.
#' @param ... Further arguments passed to \link[base]{file.choose}
#'
#' @details This is an alias for \link[base]{file.choose} that messages the
#' user with a prompt to guide them on what they should be choosing.
#'
#' @examples
#' \dontrun{
#'   prompt_file('Please select a file')
#' }
#' @export

prompt_file <- function(prompt = '', ...) {
  assert_that(is.string(prompt))
  if (prompt != '') message(prompt)
  file.choose(...)
}
