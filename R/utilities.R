# ---- Get operating system ----
# Modified from https://github.com/hadley/rappdirs/blob/6b42011053ec9db2068de3f93d3be0a9197b4043/R/utils.r#L1-L11
get_os <- function() {
  if (.Platform$OS.type == 'windows')
    'win'
  else if (Sys.info()['sysname'] == 'Darwin')
    'mac'
  else if (.Platform$OS.type == 'unix')
    'unix'
  else
    'unknown'
}

use_tk <- function() {
  opt_tk <- getOption('prompt-use-tcltk')
  capabilities('tcltk') &&
    isTRUE(requireNamespace('tcltk', quietly = T)) &&
    (is.null(opt_tk) || isTRUE(opt_tk))
}
