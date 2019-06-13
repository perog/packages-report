#' --- 
#'  title: "GitHub lession 1"
#'  subtitle: "Github lession 1 for the RaukR 2019 course"
#'  author: "Per Oksvold"
#'  date: "`r format(Sys.Date(),format='%Y-%m-%d')`"
#'  output: github_document
#' ---

#!/usr/bin/env Rscript

#$PATH or in code?

library(tidyverse)
library(here)


.libPaths()

ipt <- installed.packages() %>%
  as_tibble() %>%
  select(Package, LibPath, Version, Priority, Built)


ipt

devtools::session_info()

myname <- "Per"
dir.create(here("data")) 
installed.packages() %>%
  as_tibble() %>%
  select(Package) %>%
  mutate(name=myname) %>%
  write_csv(path = here('data', paste0(myname,'_installed_packages.csv')))


check_number <- function(n, m=1) {
  return(n==m)
}
check_number(1)

for (i in 1:10) {
  if(check_number(i)) {
    cat(i)
  }
}

function_name <- function(arg1, arg2 = "Lucy"){
  if (arg2 == "Lucy") {
    output <- paste("Lucy in the sky with ",arg1,"\n",sep="")}
  else {
    output <- paste(arg1," in the ocean with ",arg2,"\n",sep="")}
  return(cat(output))
}
function_name('test')

variable_a <- function_name("Tom")


testfram  <- data.frame(a=c(1,2,3))
testfram2 <- data.frame(a=c(1,2,3),b=c(4,5,6))
testfram  <- data.frame()

my_plot <- function(...){
  plot(c(1,2,3),c(1,2,3),...)
}

my_plot(main="Great title", xlab = "This will be x-label of plot", ylab="Y label", pch=3, col="red")

#Abdellah was here
