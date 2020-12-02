source("code/day2_functions.R")

data_2_1 <- read_lines("data/day2.txt") %>%
  parse_data_day2()

data_2_1 %>%
  mutate(check = check_pass(pass, letter, n_min, n_max)) %>%
  pull(check) %>%
  sum()
