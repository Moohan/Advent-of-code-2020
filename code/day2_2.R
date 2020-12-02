source("code/day2_functions.R")

data_2_2 <- read_lines("data/day2.txt") %>%
  parse_data_day2()

data_2_2 %>%
  mutate(check = check_pass_2(pass, letter, n_min, n_max)) %>%
  pull(check) %>%
  sum()
