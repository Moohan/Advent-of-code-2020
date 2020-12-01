source("code/day1_functions.R")

# Read data
data_2 <- read_lines("data/day1-1.txt") %>%
  parse_double()

day1(data_2, n = 3)
