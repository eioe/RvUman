## load a set of required packages effectively
## Each project will have to have a character list that can be used as argument 

# example:

#' req_packages <- c(
#'   'ggplot2',
#'   'reshape',
#'   'pracma',
#'   'pracma',
#'   'grid',
#'   'ez',				         # includes Greenhouse Geisser correction for ANOVA
#'   'BayesFactor',       # if you're on windows, dependency 'doMC' will be installed but run sequentially;
#'   # bootstrapping will therefore take quite a while
#'   'dplyr',
#'   'R.matlab',
#'   'circular',
#'   'plotrix',
#'   'diptest',
#'   #'RHRV',
#'   'purrr',
#'   'tidyr',
#'   'lsr',
#'   'effsize',
#'   'plyr',
#'   'gridExtra',
#'   'cowplot',
#'   'lme4',
#'   'corrplot',
#'   'mgcv')


#--------------------------------------------------------------------------

load-packages <- function(req_packages)
  
  # check if parallelization can help/be improved:
  # To do so, check if parameter is set already.
  # If not, check how many cores are available. Leave 2 of them available for 
  # other processes and set the opton parameter accordingly to use the rest.
  if(is.null(getOption("Ncpus"))) {
    avail_cores <- parallel::detectCores()
    use_cores = ifelse(avail_cores > 3, avail_cores-2, 1)
    options('Ncpus' = use_cores)
  }
  
#--------------------------------------------------------------------------
  
    
  for(pkg in req_packages) {
    if(!require(pkg, character.only = T)) {
      install.packages(pkg, dependencies = T, repos="http://cran.rstudio.com/")
      require(pkg, character.only = T)
    } else {
      require(pkg, character.only = T)
    }
  }


#--------------------------------------------------------------------------



