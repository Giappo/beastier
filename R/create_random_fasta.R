#' Create a random FASTA file
#' @inheritParams default_params_doc
#' @param n_taxa The number of taxa
#' @param taxa_name_ext the extension of the taxa names
#' @return Nothing, creates a FASTA file
#' @author Richel J.C. Bilderbeek
#' @noRd
create_random_fasta <- function(
  n_taxa,
  sequence_length,
  fasta_filename,
  taxa_name_ext = ""
) {
  if (n_taxa < 2) {
    stop("'n_taxa' must two or more")
  }
  if (sequence_length < 1) {
    stop("'sequence_length' must be one or more")
  }
  if (!is.character(fasta_filename)) {
    stop("'fasta_filename' must be a character string")
  }
  if (fasta_filename == "") {
    stop("'fasta_filename' must have at least one character")
  }
  if (!is.character(taxa_name_ext)) {
    stop("'taxa_name_ext' must be a character string")
  }
  alignments <- create_random_alignment(
    n_taxa,
    sequence_length,
    taxa_name_ext = taxa_name_ext
  )
  phangorn::write.phyDat(alignments, file = fasta_filename, format = "fasta")
}
