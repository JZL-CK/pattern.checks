


#' Pattern : Responses in descending order
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
#' data <- data.frame(
#'     Q1 = c(1, 2, 1, 2),
#'     Q2 = c(2, 1, 2, 1),
#'     Q3 = c(1, 2, 1, 2),
#'     Q4 = c(2, 1, 2, 1)
#' )
#' pattern.ds(data, 1:4)




# Function to identify decreasing responses
pattern.ds <- function(data, cols) {
  scale_data <- data[, cols, drop = FALSE]
  decreasing <- apply(scale_data, 1, function(row) {
    all(diff(row) < 0)
  })
  result <- scale_data[decreasing, , drop = FALSE]
  list(
    participants = which(decreasing),
    responses = result
  )
}
