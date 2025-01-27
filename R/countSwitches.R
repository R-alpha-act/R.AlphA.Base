#' @title Count Series Based on Start/Stop Markers
#' @description This function aims at identifying sections and sub-sections
#' numbers, based on markers of section starts and ends.
#'
#' Given a data frame, and a column name, it will add columns giving infos
#' about the categories
#'
#' .... to be completed ...
#'  identifies and counts series in a vector based on
#' specified start/end markers. It returns a vector of the same length,
#' indicating the series count or 0 when the element is outside a series
#' (e.g., after a stop marker and before the next start marker).
#'
#' @param data A data frame containing the column to process.
#' @param colNm A string specifying the column name in `data` to evaluate.
#' @param sttMark A value indicating the start of a series.
#' @param endMark A value indicating the end of a series.
#' @param includeStt Logical. Should the start marker be included as part of
#' the series? Default is `TRUE`.
#' @param includeEnd Logical. Should the end marker be included as part of the
#' series? Default is `TRUE`.
#'
#' @return A modified version of the input data frame with additional
#' columns for series identification and counts.
#' @importFrom stats runif
#' @export
#'
countSwitches <- function(
		data
		, colNm
		, sttMark
		, endMark
		, includeStt = TRUE
		, includeEnd = TRUE
){
	{
		grpTable <- data %>%
			as_tibble %>%
			# identify starts and ends
			mutate(stepStr = get(colNm)) %>%
			select(stepStr) %>%
			mutate(findStt = stepStr == sttMark) %>%
			mutate(findEnd = stepStr == endMark) %>%
			mutate(nbStt = cumsum(findStt %>% replace_na(0))) %>%
			mutate(nbEnd = cumsum(findEnd %>% replace_na(0))) %>%
			mutate(catLvl = nbStt - nbEnd) %>%
			# attribute starts to levels 1-2-3
			mutate(inc1 = findStt & catLvl == 1) %>%
			mutate(inc2 = findStt & catLvl == 2) %>%
			mutate(inc3 = findStt & catLvl == 3) %>%
			mutate(raw1 = cumsum(inc1)) %>%
			group_by(raw1) %>% mutate(raw2 = cumsum(inc2)) %>%
			group_by(raw1, raw2) %>% mutate(raw3 = cumsum(inc3)) %>%
			ungroup %>%
			mutate(lvl_1 = ifelse(catLvl >= 1, raw1, 0)) %>%
			mutate(lvl_2 = ifelse(catLvl >= 2, raw2, 0)) %>%
			mutate(lvl_3 = ifelse(catLvl >= 3, raw3, 0)) %>%
			select(matches("^lvl_[0-9]$"), catLvl) %>%
			identity
	} # add lvl infos in a new table --> grpTable
	{
		dupCols <- compareVars(grpTable, data)$common
		if(dupCols %>% length) stop(
			NULL
			, "the following columns have been duplicated by countSwitches :\n"
			, paste0(dupCols, collapse = "\n")
			, "\n--> please remove them from data before using this function"
		)
	} # check for column names conflicts, raising an error in this case
	return(data %>% bind_cols(grpTable))
}
