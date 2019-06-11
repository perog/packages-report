GitHub lession 1
================
Per Oksvold
11/06/2019

``` r
library(tidyverse)
```

    ## Registered S3 methods overwritten by 'ggplot2':
    ##   method         from 
    ##   [.quosures     rlang
    ##   c.quosures     rlang
    ##   print.quosures rlang

    ## -- Attaching packages ---------------------------------------------------------------------- tidyverse 1.2.1 --

    ## v ggplot2 3.1.1     v purrr   0.3.2
    ## v tibble  2.1.3     v dplyr   0.8.1
    ## v tidyr   0.8.3     v stringr 1.4.0
    ## v readr   1.3.1     v forcats 0.4.0

    ## -- Conflicts ------------------------------------------------------------------------- tidyverse_conflicts() --
    ## x dplyr::filter() masks stats::filter()
    ## x dplyr::lag()    masks stats::lag()

``` r
.libPaths()
```

    ## [1] "C:/Users/per.oksvold/Documents/R/win-library/3.6"
    ## [2] "C:/Program Files/R/R-3.6.0/library"

``` r
ipt <- installed.packages() %>%
  as_tibble() %>%
  select(Package, LibPath, Version, Priority, Built)


ipt
```

    ## # A tibble: 120 x 5
    ##    Package    LibPath                                Version Priority Built
    ##    <chr>      <chr>                                  <chr>   <chr>    <chr>
    ##  1 askpass    C:/Users/per.oksvold/Documents/R/win-~ 1.1     <NA>     3.6.0
    ##  2 assertthat C:/Users/per.oksvold/Documents/R/win-~ 0.2.1   <NA>     3.6.0
    ##  3 backports  C:/Users/per.oksvold/Documents/R/win-~ 1.1.4   <NA>     3.6.0
    ##  4 base64enc  C:/Users/per.oksvold/Documents/R/win-~ 0.1-3   <NA>     3.6.0
    ##  5 BH         C:/Users/per.oksvold/Documents/R/win-~ 1.69.0~ <NA>     3.6.0
    ##  6 broom      C:/Users/per.oksvold/Documents/R/win-~ 0.5.2   <NA>     3.6.0
    ##  7 callr      C:/Users/per.oksvold/Documents/R/win-~ 3.2.0   <NA>     3.6.0
    ##  8 cellranger C:/Users/per.oksvold/Documents/R/win-~ 1.1.0   <NA>     3.6.0
    ##  9 cli        C:/Users/per.oksvold/Documents/R/win-~ 1.1.0   <NA>     3.6.0
    ## 10 clipr      C:/Users/per.oksvold/Documents/R/win-~ 0.6.0   <NA>     3.6.0
    ## # ... with 110 more rows
