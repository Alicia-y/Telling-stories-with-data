#### Preamble ####
# Purpose: Clean the survey data downloaded from Toronto Open Data Portal
# Author: Alicia Yang
# Data: 6 February 2021
# Contact: aliciam.yang@utoronto.ca
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the ACS data and saved it to inputs/data
# - Don't forget to gitignore it!


#### Workspace setup ####
# Use R Projects, not setwd().
library(haven)
library(tidyverse)
library(opendatatoronto)
library(dplyr)


# get package
package <- show_package("0b6d3a00-7de1-440b-b47c-7252fd13929f")

data1 <-
  list_package_resources("0b6d3a00-7de1-440b-b47c-7252fd13929f") %>%
  get_resource()

# get package
package2 <- show_package("9fcff3e1-3737-43cf-b410-05acd615e27b")


data2 <-
  list_package_resources("9fcff3e1-3737-43cf-b410-05acd615e27b") %>%
  get_resource()

write_csv(
  x = data1,
  file = "Telling-stories-with-data/inputs/data/vehicle_collisions.csv"
)

write_csv(
  x = data2,
  file = "Telling-stories-with-data/inputs/data/red_light_camera.csv"
)


         