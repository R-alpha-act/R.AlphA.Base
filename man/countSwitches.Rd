% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/countSwitches.R
\name{countSwitches}
\alias{countSwitches}
\title{get the number, from a vector of starts/stops-----------------------------}
\usage{
countSwitches(
  data,
  colNm,
  sttMark,
  endMark,
  includeStt = TRUE,
  includeEnd = TRUE
)
}
\arguments{
\item{sttMark}{the starting value}

\item{endMark}{the ending value}

\item{includeStt}{should the starting value be counted as part of the series}

\item{includeEnd}{should the ending value be counted as part of the series}

\item{sttEnd}{vector of on/off, start/end, or alike switches}
}
\description{
this function takes as input a vector of values in which
starts and stops are indicated by specific values, identifying each time a
new series. It returns a vector of the same length with the series count or
0 when the element is outside a series (after a stop and before a start)
}
