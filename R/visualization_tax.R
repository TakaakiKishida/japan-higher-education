library(tidyverse)
library(ggthemes)

source("src/tax.R")

# Income Tax --------------------------------------------------------------

f1 <- income_tax_security %>% 
  dplyr::filter(!Country %in% c("Australia", "Denmark", "New Zealand", "Colombia", "Chile")) %>% 
  ggplot(aes(x = reorder(Country, -Value), y = Value, fill = Indicator)) +
  geom_bar(stat = "identity", position = position_stack(reverse = TRUE)) + 
  geom_text(aes(label = sprintf("%0.1f", round(Value, digits = 1))), 
            size = 4, hjust = 1.1, color = "white", position = position_stack(reverse = TRUE), family = "Optima") +
  scale_y_continuous(expand = c(0, 0.1), limits = c(0, 50)) +
  scale_fill_manual(values = c("#6A51A3", "#9E9AC8")) +
  coord_flip() +
  theme_minimal() + 
  theme(legend.position = "bottom", axis.title.x = element_blank(), axis.title.y = element_blank(), legend.title = element_blank(),
        text = element_text(size = 14, family = "Optima"), plot.title = element_text(size = 16)) +
  guides(fill = guide_legend(nrow = 2)) +
  labs(title = "Average income tax rate (% gross wage earnings) \nAverage rate of employees' social security contributions (% gross wage earnings)",
       subtitle = paste(income_tax_security$`Household type`, "(Year: 2020)")) 

ggsave(f1,
       filename = "fig/tax/income_tax_social_security.png",
       width = 10, height = 8)


f2 <- tax_wedge %>% 
  dplyr::filter(Value != 0) %>%
  ggplot(aes(x = reorder(Country, -Value), y = Value)) +
  geom_bar(stat = "identity", position = "stack", fill = "#9E9AC8") + 
  geom_text(aes(label = sprintf("%0.1f", round(Value, digits = 1))), 
            size = 4, hjust = 1.1, color = "white", family = "Optima") +
  scale_y_continuous(expand = c(0, 0.1), limits = c(0, 60)) +
  coord_flip() +
  theme_minimal() + 
  theme(legend.position = "bottom", axis.title.x = element_blank(), axis.title.y = element_blank(), legend.title = element_blank(),
        text = element_text(size = 14, family = "Optima"), plot.title = element_text(size = 16)) +
  guides(fill = guide_legend(nrow = 2)) +
  labs(title = tax_wedge$Indicator,
       subtitle = paste(tax_wedge$`Household type`, "(Year: 2020)")) 

ggsave(f2,
       filename = "fig/tax/tax_wedge.png",
       width = 10, height = 8)
