
#' ---
#' title: "LTBI screening model:
#' simulation specific constants"
#'
#' author: "N Green"
#' date: "`r format(Sys.Date())`"
#' output:
#'   html_document:
#'     keep_md: TRUE
#' ---


policy_name <- policies_ls[policy]

if (exists("policy")) {

  interv <- set_policy(policy_name,
                       interv)}

cohort <- filter_cohort_by_policy(IMPUTED_sample,
                                  policy_name,
                                  interv)

screen_discount <- screen_discount(cohort)

# size potentially screened
pop_year <- nrow(cohort)
