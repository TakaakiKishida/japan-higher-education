library(tidyverse)
library(ggthemes)

source("src/salary_international.R")

# Salary in Academia ------------------------------------------------------

salary_list %>% 
  dplyr::filter(associate_professor != "NA") %>% 
  ggplot(aes(x = reorder(country, associate_professor), y = associate_professor)) +
  geom_bar(stat = "identity", position = "stack") + 
  geom_text(aes(label = scales::comma(associate_professor)), size = 4, hjust = 1.25, color = "white") +
  scale_y_continuous(expand = c(0, 0), limits = c(0, 180000), labels = scales::comma) +
  coord_flip() +
  theme_bw(base_family = "HiraKakuProN-W3") + 
  theme(legend.position = "bottom") +
  labs(title = "Average Annual Salaries of Associate Professor from Around the World",
       subtitle = "Salaries are converted from the local currency to USD using PPP") 

