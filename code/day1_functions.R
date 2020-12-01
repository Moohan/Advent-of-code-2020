source("code/standard_libraries.R")

sum_2020 <- function(nums) {
  sum_x <- sum(nums)

  if (sum(nums) == 2020) {
    return(prod(nums))
  } else(
    return(NA_real_)
  )
}

test_that("sum function works", {
  expect_equal(sum_2020(c(0, 2020)), 0)
  expect_equal(sum_2020(c(1010, 1010)), 1020100)
  expect_equal(sum_2020(c(1721, 299)), 514579)

  expect_equal(sum_2020(c(979, 366, 675)), 241861950)
})

day1 <- function(data, n = 2) {
  answer <- data %>% combn(n, simplify = FALSE)  %>%
    map_dbl(sum_2020) %>%
    na.omit() %>%
    c()

  return(answer)
}

# Test data
test_data <- c(1721,
               979,
               366,
               299,
               675,
               1456)

test_that("Get test answer", {
  expect_equal(day1(test_data), 514579)

  expect_equal(day1(test_data, n = 3), 241861950)
})


test_that("Get part 1 answer", {
  expect_equal(read_lines("data/day1-1.txt") %>%
                 parse_double() %>%
                 day1(), 436404)
})
