

#' Pattern : Responses in ascending order
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
#' pattern.as(data, 13:24)



# Function to identify increasing responses
pattern.as <- function(data, cols) {
  scale_data <- data[, cols, drop = FALSE]
  increasing <- apply(scale_data, 1, function(row) {
    all(diff(row) > 0)
  })
  result <- scale_data[increasing, , drop = FALSE]
  list(
    participants = which(increasing),
    responses = result
  )
}
