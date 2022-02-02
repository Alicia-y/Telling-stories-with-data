#### Preamble ####
# Purpose: Clean the survey data downloaded from [...UPDATE ME!!!!!]
# Author: Rohan Alexander [CHANGE THIS TO YOUR NAME!!!!]
# Data: 3 January 2021
# Contact: rohan.alexander@utoronto.ca [PROBABLY CHANGE THIS ALSO!!!!]
# License: MIT
# Pre-requisites: 
# - Need to have downloaded the ACS data and saved it to inputs/data
# - Don't forget to gitignore it!
# - Change these to yours
# Any other information needed?


#### Workspace setup ####
# Use R Projects, not setwd().
library(haven)
library(tidyverse)
library(opendatatoronto)
library(dplyr)


# get package
package <- show_package("0b6d3a00-7de1-440b-b47c-7252fd13929f")
package

# get all resources for this package
resources <- list_package_resources("0b6d3a00-7de1-440b-b47c-7252fd13929f")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

data1 <-
  list_package_resources("0b6d3a00-7de1-440b-b47c-7252fd13929f") %>%
  get_resource()

# get package
package2 <- show_package("9fcff3e1-3737-43cf-b410-05acd615e27b")
package2

# get all resources for this package
resources2 <- list_package_resources("9fcff3e1-3737-43cf-b410-05acd615e27b")

data2 <-
  list_package_resources("9fcff3e1-3737-43cf-b410-05acd615e27b") %>%
  get_resource()

write_csv(
  x = data1,
  file = "Telling-stories-with-data/inputs/data/vehicle_collisions.csv"
)

write_csv(
  x = data2,
  file = "Telling-stories-with-data/inputs/data/red_light_cameras.csv"
)

# Read in the raw data. 
raw_data <- readr::read_csv("inputs/data/raw_data.csv"
                     )
# Just keep some variables that may be of interest (change 
# this depending on your interests)
names(raw_data)

reduced_data <- 
  raw_data %>% 
  select(first_col, 
         second_col)
rm(raw_data)
         

#### What's next? ####



         