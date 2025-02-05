% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/compareVars.R
\name{compareVars}
\alias{compareVars}
\title{Compare Table Variables}
\usage{
compareVars(x, y, pattern = "")
}
\arguments{
\item{x}{A data frame representing the first table.}

\item{y}{A data frame representing the second table.}

\item{pattern}{A string pattern used to filter and compare only a subset of
variables (column names).}
}
\value{
A list containing:
\itemize{
  \item \code{all}: All column names from both tables.
  \item \code{common}: Column names found in both tables.
  \item \code{onlyX}: Column names found only in the first table (\code{x}).
  \item \code{onlyY}: Column names found only in the second table (\code{y}).
  \item \code{exclusive}: Column names found in only one of the two tables.
}
}
\description{
Compares column names in two tables based on a given pattern.
Provides information about which columns are present in which tables.
}
\examples{
# Example tables
table1 <- data.frame(exclusive_1 = 1:5, common_1 = 6:10, common_2 = 11:15)
table2 <- data.frame(common_1 = 16:20, common_2 = 21:25, exclusive_2 = 26:30)

# Compare all columns (no pattern given)
compare_all <- compareVars(table1, table2)
compare_all$common
compare_all$exclusive
compare_all$onlyX
compare_all$onlyY

# compare only columns following a specific pattern
compare_wPattern <- compareVars(table1, table2, pattern = "1")
compare_wPattern$all
compare_wPattern$common
}
