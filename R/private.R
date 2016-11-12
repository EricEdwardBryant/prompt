# ---- Get operating system ----
# Modified from https://github.com/hadley/rappdirs/blob/6b42011053ec9db2068de3f93d3be0a9197b4043/R/utils.r#L1-L11
get_os <- function() {
  if (.Platform$OS.type == 'windows') {
    'win'
  } else if (Sys.info()['sysname'] == 'Darwin') {
    'mac'
  } else if (.Platform$OS.type == 'unix') {
    'unix'
  } else {
    'unknown'
  }
}


# ---- Choose Files ----
files_default <- function(prompt) {
  tcltk::tk_choose.files(caption = prompt)
}

files_mac <- function(prompt) {
  cmd <- paste0("osascript ./files-mac.applescript")
  system(cmd, intern = T)
}

files_windows <- function(prompt) {
  utils::choose.files(caption = prompt)
}

files_unix <- function(prompt) {
  tcltk::tk_choose.files(caption = prompt)
}


# ---- Choose Directory ----
dir_default <- function(prompt) {
  message(prompt)
  dirname(file.choose())
}

dir_mac <- function(prompt) {
  cmd <- paste0("osascript -e 'POSIX path of (choose folder with prompt \"", prompt, "\")'")
  dirname(system(cmd, intern = T))
}

dir_windows <- function(prompt) {
  utils::choose.dir(caption = prompt)
}

dir_unix <- function(prompt) {
  message(prompt)
  dirname(file.choose())
}

