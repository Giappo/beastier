#' Determines if BEAST2 issues a warning
#' when using the BEAST2 XML input file
#' @inheritParams default_params_doc
#' @param filename name of the BEAST2 XML input file
#' @param beast2_jar_path the path of \code{beast.jar}.
#'   Use \link{get_default_beast2_jar_path} to get
#'   the default BEAST jar file's path
#' @return TRUE if the file produces a BEAST2 warning, FALSE if not
#' @author Richel J.C. Bilderbeek
#' @seealso
#'   Use \code{\link{is_beast2_input_file}} to check if a file is a
#'   valid BEAST2 input file.
#'   Use \code{\link{are_beast2_input_lines}} to check if the text (for
#'   example, as loaded from a file) to be valid BEAST2 input.
#' @export
gives_beast2_warning <- function(
  filename,
  verbose = FALSE,
  beast2_jar_path = get_default_beast2_jar_path()
) {
  tryCatch({
      is_beast2_input_file(
        filename = filename,
        show_warnings = TRUE,
        verbose = verbose,
        beast2_jar_path = beast2_jar_path
      )
      FALSE
    },
    warning = function(msg) {
      return(TRUE)
    }
  )
}
