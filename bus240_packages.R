# some packages for BUS240 Session 06 & 07
install.packages("tidyverse")
install.packages("gapminder")
install.packages("lubridate")
install.packages("PerformanceAnalytics")
install.packages("GGally")
install.packages("rvest")
install.packages("geomnet")
install.packages("maps")
install.packages("car")
install.packages("animation")
############################################################
#  One package used in DataCamp is called "gganimate", which installs
# easily in older versions of R, but not so easily for the most current version.
# try the next line...
install.packages("gganimate") # na FOR r 3.4.2

# If the install throws an error, run these lines:
install.packages("devtools")
install.packages("RCurl")
install.packages("httr")

library(devtools)
library(RCurl)
library(httr)
set_config( config( ssl_verifypeer = 0L ) )
devtools::install_github("RcppCore/Rcpp")
devtools::install_github("dgrtwo/gganimate")
