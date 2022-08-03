#' Vector of participant ID fields
#'
#' @return a character vector of field names useful for API calls
#' @export
#'
#' @examples
#' demographics()
demographics <- function(){
  c("civiCoreParticipantID",
  "lastName",
  "firstName",
  "dateOfBirth",
  "age",
  "gender",
  "ethnicity",
  "numberOfAdultsInHousehold",
  "annualFamilyIncome",
  "highSchoolGraduate",
  "updatedDate"
  )
}
