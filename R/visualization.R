# vis
pacman::p_load(tidyverse, here)
here::here()

educ <- readr::read_rds(here::here("data/education.rds"))

# japan-higher-education