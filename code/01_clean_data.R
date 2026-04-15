library(dplyr)
library(readr)
library(labelled)
library(readr)

data <- read_csv("data/covid_sub.csv")
head(data)

clean_data <- data %>%
  select(-any_of(c("USMER", "MEDICAL_UNIT", "PREGNANT"))) %>%
  rename(DEATH = DATE_DIED) %>%
  mutate(
    DEATH = ifelse(is.na(DEATH), "No", "Yes"),
    DEATH = factor(DEATH, levels = c("No", "Yes"))
  ) %>%
  na.omit()
dim(clean_data)
# Save cleaned dataset
saveRDS(clean_data, "data/clean_data.rds")