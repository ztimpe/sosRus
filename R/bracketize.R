#' Convert character vector for API call
#'
#' @param x a character vector (or list) of field names
#'
#' @return a character vector with brackets and slahses
#' @export
#'
#' @examples
#' bracketize(letters[1:5])
bracketize <- function(x){
  if(!is.list(x) & !is.character(x)){
    stop("This function can only handle character vectors and lists. You have provided something else.")
  }
  else if(is.character(x) & length(x)==1){
    stop("The character vector is of length 1: There is no documented reason to pull one variable from the SOS API.")
  }
  else if(is.list(x) & length(x)>= 1){
    warning("Provided list is of length greater than 1: only first bin is selected")
    x <- unlist(x[1])
  }
  else{
    x <- x
  }
  x[1] <- paste('[\\\"',x[1],'\\\",',sep="")
  x[length(x)] <- paste('\\\"',x[length(x)],'\\\"]',sep="")
  if(length(x)>2){
    for(i in 2: (length(x)-1)){
      x[i] <- paste('\\\"',x[i],'\\\",',sep="")
    }
  }
  stringr::str_c(x,collapse="")
}
