source("code/day1_functions.R")

# Read data
data_1 <- read_lines("data/day1-1.txt") %>%
  parse_double()

day1(data_1)
