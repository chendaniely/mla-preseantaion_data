library(tidyverse)

ebola_csv <- read_csv("data/ebola.csv")

ebola_baseline_tidy <- ebola_csv %>%
  rename(date = Date, day = Day) %>%
  pivot_longer(cols = c(-date, -day)) %>%
  separate(name, into = c("case_death", "country"), sep = "_") %>%
  pivot_wider(names_from = case_death, values_from = value) %>%
  rename(cases = Cases, deaths = Deaths)

# ebola starting datasets for examples
ebola_ex1 <- ebola_baseline_tidy %>%
  drop_na() %>%
  select(-deaths) %>%
  pivot_wider(names_from = day, values_from = cases)

ebola_ex2 <- ebola_csv %>%
  rename(date = Date, day = Day)

ebola_ex3 <- ebola_csv %>%
  rename(date = Date, day = Day)

# solution dataframes for each example

solution_tidy1 <- ebola_ex1 %>%
  pivot_longer(`289`:last_col(), names_to = "day", values_to = "cases") %>%
  drop_na()

solution_tidy2 <- ebola_ex2 %>%
  pivot_longer(cols = c(-date, -day)) %>%
  separate(name, into = c("case_death", "country"), sep = "_") %>%
  drop_na()

solution_tidy3 <- ebola_ex3 %>%
  pivot_longer(cols = c(-date, -day)) %>%
  separate(name, into = c("case_death", "country"), sep = "_") %>%
  pivot_wider(names_from = case_death, values_from = value) %>%
  drop_na()
