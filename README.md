
<!-- README.md is generated from README.Rmd. Please edit that file -->

# sosRus <a href="https://ztimpe.github.io/sosRus/"><img src="man/figures/logo.png" align="right" height="139" /></a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/ztimpe/sosRus/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ztimpe/sosRus/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

The goal of sosRus is to tame some gnarly survey data! The functions
included in this package are designed to ease the burden of pulling data
from the SOS API and clean it in preparation for reporting and
evaluation.

## Installation

You can install the development version of sosRus from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("ztimpe/sosRus")
```

## Example

This is a basic example which shows you how to construct the API call.
The first function, table_fields, provides a list of character vectors
aligning with the fields drawn from the APIs as of August, 2022.

``` r
library(sosRus)
# Use the table_fields function to load a list of character vectors for pulling 
# from the API. Check for accuracy!!
table_fields <- table_fields()
head(table_fields)
#> $participant_sessions
#>  [1] "participants_id"              "sessions_id"                 
#>  [3] "organizations_id"             "sessions_groups_id"          
#>  [5] "dob"                          "gradeLevelInSchool"          
#>  [7] "numberOfServiceDays"          "totalDays"                   
#>  [9] "totalFFS"                     "endOfSeason"                 
#> [11] "calc_high_risk"               "pre"                         
#> [13] "participantNeeds"             "strengths_academicGoals"     
#> [15] "strengths_activityEngagement" "strengths_adultDrugUse"      
#> [17] "strengths_adultPrison"        "strengths_anger"             
#> [19] "strengths_arguments"          "strengths_behaviorProblems"  
#> [21] "strengths_bully"              "strengths_challenges"        
#> [23] "strengths_difficultyFocusing" "strengths_drugUse"           
#> [25] "strengths_englishSecondLang"  "strengths_freeReducedLunch"  
#> [27] "strengths_friendsDrugs"       "strengths_friendships"       
#> [29] "strengths_indCompleting"      "strengths_juvie"             
#> [31] "strengths_learningDisability" "strengths_lives"             
#> [33] "strengths_mentalHealth"       "strengths_physicalActivity"  
#> [35] "strengths_positiveSelfEsteem" "strengths_schoolInterest"    
#> [37] "strengths_victimBullying"     "strengths_other,updatedDate" 
#> 
#> $participants
#>  [1] "civiCoreParticipantID"     "lastName"                 
#>  [3] "firstName"                 "dateOfBirth"              
#>  [5] "age"                       "gender"                   
#>  [7] "ethnicity"                 "numberOfAdultsInHousehold"
#>  [9] "annualFamilyIncome"        "highSchoolGraduate"       
#> [11] "updatedDate"              
#> 
#> $sessions
#>  [1] "sessionName"      "sessionStartDate" "sessionType"      "programType"     
#>  [5] "region"           "programLocation"  "mountainResort"   "mountainResort"  
#>  [9] "sessionYear"      "applicationType" 
#> 
#> $university_responses
#>   [1] "participants_id"     "sessions_id"         "surveyType"         
#>   [4] "enteredDate"         "updatedDate"         "calc_enteredDate"   
#>   [7] "yearInSOSUniversity" "location"            "season"             
#>  [10] "grade"               "acadIntentI"         "acadIntentJ"        
#>  [13] "activity"            "activity"            "activity"           
#>  [16] "comEngage"           "comEngage"           "comEngage"          
#>  [19] "comSkill"            "comSkill"            "comSkill"           
#>  [22] "comSkill"            "comSkillx"           "control"            
#>  [25] "control"             "control"             "control"            
#>  [28] "control"             "control"             "control"            
#>  [31] "control"             "decisionMak"         "decisionMak"        
#>  [34] "decisionMak"         "decisionMak"         "decisionMak"        
#>  [37] "decisionMak"         "decisionMak"         "decisionMak"        
#>  [40] "diverse"             "diverse"             "diverse"            
#>  [43] "diverse"             "diverse"             "diverse"            
#>  [46] "diverse"             "diverse"             "diverse"            
#>  [49] "diverse"             "diverse"             "drugAlc"            
#>  [52] "drugAlc"             "drugAlc"             "drugAlc"            
#>  [55] "drugAlc"             "drugAlc"             "drugAlc"            
#>  [58] "drugAlc"             "drugAlc"             "drugAlc"            
#>  [61] "drugAlc"             "drugAlc"             "eATQActivR"         
#>  [64] "eATQActiv"           "eATQActiv"           "eATQAtten"          
#>  [67] "eATQAttenR"          "eATQAtten"           "eATQFrust"          
#>  [70] "eATQFrust"           "eATQFrust"           "eATQInhibR"         
#>  [73] "eATQInhib"           "eATQInhibR"          "educationa"         
#>  [76] "educationb"          "educationc"          "educationd"         
#>  [79] "educatione"          "exper"               "exper"              
#>  [82] "exper"               "exper"               "exper"              
#>  [85] "exper"               "exper"               "exper"              
#>  [88] "exper"               "exper"               "exper"              
#>  [91] "exper"               "futureOr"            "futureOr"           
#>  [94] "futureOr"            "futureOr"            "goalS"              
#>  [97] "goalS"               "goalS"               "goalS"              
#> [100] "goalS"               "health"              "health"             
#> [103] "health"              "health"              "healthb"            
#> [106] "health"              "health"              "health"             
#> [109] "health"              "jSkills"             "jSkills"            
#> [112] "jSkills"             "jSkills"             "jSkills"            
#> [115] "jSkills"             "leadership"          "leadership"         
#> [118] "leadership"          "leadership"          "leadership"         
#> [121] "mentor"              "mentor"              "mentor"             
#> [124] "mentor"              "mentor"              "misc"               
#> [127] "parents"             "proSoc"              "proSoc"             
#> [130] "proSoc"              "proSoc"              "selfEff"            
#> [133] "selfEff"             "selfEff"             "selfEff"            
#> [136] "selfEff"             "selfEff"             "selfEst"            
#> [139] "selfEst"             "selfEst"             "selfEst"            
#> [142] "selfEst"             "selfEst"             "selfEst"            
#> [145] "selfEst"             "selfEst"             "selfReg"            
#> [148] "selfReg"             "selfReg"             "selfReg"            
#> [151] "selfReg"             "selfReg"             "selfReg"
```

When viewing this list, it will become apparent that the character
vectors are simply the field names, and are not ready to be plugged into
the API call. To prepare these vectors for the API call, use the
bracketize function. This function takes a character vector or list of
character vectors and places brackets at the beginning and end, as well
as forward slashes and commas. The output of this function should mirror
the field name expression in the API call.

``` r
# Use bracketize to add brackets, slashes, and quotations for the API call
head(bracketize(table_fields()[1]))
#> Warning in bracketize(table_fields()[1]): Provided list is of length greater
#> than 1: only first bin is selected
#> [1] "[\"participants_id\",\"sessions_id\",\"organizations_id\",\"sessions_groups_id\",\"dob\",\"gradeLevelInSchool\",\"numberOfServiceDays\",\"totalDays\",\"totalFFS\",\"endOfSeason\",\"calc_high_risk\",\"pre\",\"participantNeeds\",\"strengths_academicGoals\",\"strengths_activityEngagement\",\"strengths_adultDrugUse\",\"strengths_adultPrison\",\"strengths_anger\",\"strengths_arguments\",\"strengths_behaviorProblems\",\"strengths_bully\",\"strengths_challenges\",\"strengths_difficultyFocusing\",\"strengths_drugUse\",\"strengths_englishSecondLang\",\"strengths_freeReducedLunch\",\"strengths_friendsDrugs\",\"strengths_friendships\",\"strengths_indCompleting\",\"strengths_juvie\",\"strengths_learningDisability\",\"strengths_lives\",\"strengths_mentalHealth\",\"strengths_physicalActivity\",\"strengths_positiveSelfEsteem\",\"strengths_schoolInterest\",\"strengths_victimBullying\",\"strengths_other,updatedDate\"]"
```

Once the table fields have been bracketized, it is time to place them in
the API call, using the apify function. This function already has the
base URL set as the default, but you will need to specify the table name
you will pull from, the fields (after being bracketized), the key, and
page. To this point, nothing should be different from the classical API
calls that are used for pulling SOS data.

``` r
# Use apify to create an API call address. 
apify("fields","table_name","key","base_url")
#> base_urltable_name?key=key&fields=fields&page=0
```
