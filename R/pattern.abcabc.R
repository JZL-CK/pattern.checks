

#' Pattern : abc abc
#'
#' @param data The data set with the scored responses in the same order as it is administered
#' @param cols The columns belonging to the psychometric scale/scales under scrutiny
#'
#' @returns
#' The participants (rows) following the pattern, and
#' the list of said participants along with their responses for all the items in the scale
#'
#' @export
#'
#' @examples
#' pattern.abcabc(data, 13:24)



# Function to identify ABCABC pattern responses
pattern.abcabc <- function(data, cols) {
  scale_data <- data[, cols, drop = FALSE]
  abcabc <- apply(scale_data, 1, function(row) {
    n <- length(row) / 3
    group1 <- row[seq(1, length(row), 3)]
    group2 <- row[seq(2, length(row), 3)]
    group3 <- row[seq(3, length(row), 3)]
    length(unique(group1)) == 1 &&
      length(unique(group2)) == 1 &&
      length(unique(group3)) == 1 &&
      group1[1] != group2[1] && group2[1] != group3[1] && group1[1] != group3[1]
  })
  result <- scale_data[abcabc, , drop = FALSE]
  list(
    participants = which(abcabc),
    responses = result
  )
}
