# function to install and load packages
install_and_load <- function(x, install = TRUE, load = TRUE) {
  
  # install
  if (install == TRUE & !(x %in% installed.packages()[,"Package"])) {
    install.packages(x, dependencies = TRUE, verbose = FALSE, quiet = TRUE)
  }
  
  # load
  if (x %in% (.packages())) {TRUE} else {
    if (load == FALSE) {FALSE} else {
      library(x, character.only = TRUE, warn.conflicts = FALSE, logical.return = TRUE, 
              verbose = FALSE, quietly = TRUE)
    }
  }
  
}


# set package list
my_pckgs <- c("data.table", "tidyverse", "magrittr", "tidymodels", "conflicted",
              "broom", "scales", "rebus", "lubridate", "glue", "rmarkdown")


# install and load
data.frame(
  pckg = my_pckgs,
  loaded = sapply(my_pckgs, install_and_load),
  row.names = NULL,
  stringsAsFactors = FALSE
)




