% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/get_alignment_ids.R
\name{get_alignment_ids}
\alias{get_alignment_ids}
\title{Get the alignment ID from a file with one alignment}
\usage{
get_alignment_ids(xml_filename)
}
\arguments{
\item{xml_filename}{name of a BEAST2 XML input filename}
}
\value{
one or more alignment IDs
}
\description{
Get the alignment ID from a file with one alignment
}
\examples{
 testit::assert(get_alignment_ids(beastier::get_beastier_path("2_4.xml"))
   == "test_output_0"
 )
 testit::assert(
   get_alignment_ids(beastier::get_beastier_path("anthus_15_15.xml"))
   == c("anthus_aco","anthus_nd2")
 )

}
\author{
Richel J.C. Bilderbeek
}
