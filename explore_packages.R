#' --- 
#'  title: "GitHub lession 1"
#'  subtitle: "Github lession 1 for the RaukR 2019 course"
#'  author: "Per Oksvold"
#'  date: "`r format(Sys.Date(),format='%d/%m/%Y')`"
#'  output: github_document
#' ---


library(tidyverse)

.libPaths()

ipt <- installed.packages() %>%
  as_tibble() %>%
  select(Package, LibPath, Version, Priority, Built)


ipt
