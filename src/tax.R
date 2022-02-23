library(readr)
library(magrittr)

d <- readr::read_csv("data/tax.csv")

# Income Tax and Social Security
income_tax_security <- d %>% 
  dplyr::filter(Indicator %in% c("Average income tax rate (% gross wage earnings)",
                                 "Average rate of employees' social security contributions (% gross wage earnings)"),
                FAM_TYPE == "SINGLE2",
                Year == 2020)

# Tax Wedge
tax_wedge <- d %>% 
  dplyr::filter(Indicator == "Average tax wedge (% labour costs)",
                FAM_TYPE == "SINGLE2",
                Year == 2020)

# Reference 
# https://finders.me/articles.php?id=1562
# https://www.swissinfo.ch/jpn/%E5%9B%BD%E6%B0%91%E8%B2%A0%E6%8B%85%E7%8E%87_%E7%A8%8E-%E7%A4%BE%E4%BC%9A%E4%BF%9D%E9%99%BA%E3%81%AE%E8%B2%A0%E6%8B%85%E7%8E%87-%E3%82%B9%E3%82%A4%E3%82%B9%E3%81%AF%E6%9C%AC%E5%BD%93%E3%81%AB%E6%AC%A7%E5%B7%9E%E6%9C%80%E4%BD%8E-/44145748