context("get_duplicate_param_ids")

test_that("use", {

  text_0 <- "<parameter id=\"RealParameter.1\" ...</parameter>"
  text_1 <- c(text_0, text_0)

  testthat::expect_equal(
    length(beastier:::get_duplicate_param_ids(text_0)),
    0
  )

  testthat::expect_equal(
    length(beastier:::get_duplicate_param_ids(text_1)),
    1
  )

})

test_that("abuse", {

  testthat::expect_error(
    beastier:::get_duplicate_param_ids(NA),
    "'text' must be text"
  )

  testthat::expect_error(
    beastier:::get_duplicate_param_ids(NULL),
    "'text' must be text"
  )

  testthat::expect_error(
    beastier:::get_duplicate_param_ids(ape::rcoal(3)),
    "'text' must be text"
  )

})
