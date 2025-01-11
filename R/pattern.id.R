


#' Pattern : Identical responses
#'
#' @param data The data set with the scored responses in the same order as it is administered
#' @param cols The columns belonging to the psychometric scale/scales under scrutiny
#'
#' @returns
#' The participants (rows) following the pattern, and
#' the list of said participants along with their responses for all the items in the scale
#' @export
#'
#' @examples
#' pattern.id(data, 13:24)


# Function to identify identical responses
pattern.id <- function(data, cols) {
  scale_data <- data[, cols, drop = FALSE]
  identical <- apply(scale_data, 1, function(row) {
    all(row == row[1])
  })
  result <- scale_data[identical, , drop = FALSE]
  list(
    participants = which(identical),
    responses = result
  )
}

