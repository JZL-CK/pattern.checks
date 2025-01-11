

#' Pattern : ab ab
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
#' pattern.abab(data, 13:24)



# Function to identify ABAB pattern responses
pattern.abab <- function(data, cols) {
  scale_data <- data[, cols, drop = FALSE]
  abab <- apply(scale_data, 1, function(row) {
    odd_responses <- row[seq(1, length(row), 2)]
    even_responses <- row[seq(2, length(row), 2)]
    length(unique(odd_responses)) == 1 &&
      length(unique(even_responses)) == 1 &&
      odd_responses[1] != even_responses[1]
  })
  result <- scale_data[abab, , drop = FALSE]
  list(
    participants = which(abab),
    responses = result
  )
}

