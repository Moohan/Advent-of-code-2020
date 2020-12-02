source("code/standard_libraries.R")

test_data <- c("1-3 a: abcde",
               "1-3 b: cdefg",
               "2-9 c: ccccccccc")

parse_data_day2 <- function(data) {
  parsed_data <- str_match(data, "(\\d+?)-(\\d+?)\\s([a-z]):\\s(\\w+?)$") %>%
    as_tibble(.name_repair = ~c("text", "n_min", "n_max", "letter", "pass")) %>%
    mutate(across(c(n_min, n_max), parse_integer))

  return(parsed_data)
}

check_pass <- function(pass, letter, n_min, n_max) {
  letter_count <- str_count(pass, letter)

  check <- letter_count >= n_min & letter_count <= n_max

  return(check)
}

test_that("password check function works", {
  password_check <- test_data %>%
    parse_data_day2 %>%
    mutate(check = check_pass(pass, letter, n_min, n_max)) %>%
    pull(check)

  expect_equal(password_check, c(T, F, T))
})

check_pass_2 <- function(pass, letter, n_min, n_max) {
  pos1 <- str_sub(pass, n_min, n_min) == letter
  pos2 <- str_sub(pass, n_max, n_max) == letter

  check <- xor(pos1, pos2)

  return(check)
}

test_that("part 2 password check function works", {
  password_check <- test_data %>%
    parse_data_day2 %>%
    mutate(check = check_pass_2(pass, letter, n_min, n_max)) %>%
    pull(check)

  expect_equal(password_check, c(T, F, F))
})


