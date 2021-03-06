context("is_beast2_input_file")

test_that("beast2_example_output.log is not a valid BEAST2 input file", {

  if (!beastier:::is_on_travis()) return()

  filename <- get_beastier_path("beast2_example_output.log")
  is_ok <- NULL

  testthat::expect_output(
    is_ok <- beastier::is_beast2_input_file(filename, verbose = TRUE)
  )

  testthat::expect_false(is_ok)

})

test_that("beast2_example_output.trees is not a valid BEAST2 input file", {

  # Gives a status error
  if (!beastier:::is_on_travis()) return()

  filename <- get_beastier_path("beast2_example_output.trees")

  is_ok <- NULL

  testthat::expect_output(
    is_ok <- beastier::is_beast2_input_file(filename, verbose = TRUE)
  )

  testthat::expect_false(is_ok)

})

test_that("anthus_2_4.xml is valid", {

  if (!beastier:::is_on_travis()) return()

  filename <- get_beastier_path("anthus_2_4.xml")
  testthat::expect_true(file.exists(filename))
  testthat::expect_true(beastier::is_beast2_input_file(filename))

})

test_that("abuse", {

  testthat::expect_error(
    beastier::is_beast2_input_file("abs.ent"),
    "'filename' must be the name of an existing file. "
  )

  testthat::expect_error(
    beastier::is_beast2_input_file(
      get_beastier_path("anthus_2_4.xml"),
      beast2_jar_path = "abs.ent"
    ),
    "'beast2_jar_path' must be the full path of the BEAST2 file 'beast.jar'."
  )

})

test_that("detect warnings", {

  testthat::expect_warning(
    is_beast2_input_file(
      filename = beastier:::get_beastier_path("beast2_warning.xml"),
      show_warnings = TRUE
    )
  )
  testthat::expect_silent(
    is_beast2_input_file(
      filename = beastier:::get_beastier_path("beast2_warning.xml"),
      show_warnings = FALSE
    )
  )
  testthat::expect_silent(
    is_beast2_input_file(
      beautier:::get_beautier_paths("2_4.xml"),
      show_warnings = TRUE
    )
  )
})
