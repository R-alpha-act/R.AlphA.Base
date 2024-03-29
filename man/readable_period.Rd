% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/readable_period.R
\name{readable_period}
\alias{readable_period}
\title{Times steps - v3 with lubridate functions, and only stores time, not durations}
\usage{
readable_period(periodObj)
}
\arguments{
\item{start}{to start a new time table from scratch}

\item{timer_table}{table to increment with a new timer line}

\item{message}{Should the function print the table for this step ?}

\item{...}{any other specification. Choose name for column and value for row}
}
\value{
the provided timer_table plus one line with time and the ... specifications
}
\description{
keep track of time spent on different steps of code
}
\examples{
tt_tests <- timer(start = TRUE)
tt_tests <- timer(timer_table = tt_tests)
tt_tests <- timer(timer_table = tt_tests, stepName = "step x", anyVariableName = "any value")
}
