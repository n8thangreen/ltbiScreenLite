
#' run_policy
#'
#' A single policy simulation (for multiple scenarios) of cost-effectiveness model.
#'
#' @param cohort individual level; default: NA
#' @param make_plots TRUE/FALSE
#'
#' @return empty
#' @export
#' @seealso \code{\link{run_model}}
#'
#' @examples
#'
run_policy <- function(cohort = NA,
                       make_plots = FALSE) {

  data("policies", package = "ltbiScreenLite")
  data("policies_ls", package = "ltbiScreenLite")
  data("intervention_constants", package = "ltbiScreenLite")
  data("cost_effectiveness_params", package = "ltbiScreenLite")
  data("unit_costs", package = "ltbiScreenLite")
  data("scenario_params", package = "ltbiScreenLite")
  data("model_input_cohort", package = "ltbiScreenLite") #IMPUTED_sample

  on.exit(rm(cohort))

  # set-up ---------------------------------------------------------------

  folders <- setup_folders(policy_name = policies_ls[policy], interv)

  source("scripts/data-prep_constants-policy.R", local = TRUE)
  source("scripts/prep-decisiontree.R", local = TRUE)


  # modelling ------------------------------------------------------------

  dectree_res <- parallel_decision_tree(scenario_params, interv, folders)
  popmod_res <- activetb_qaly_cost(dectree_res, interv, cohort, folders)

  combine_popmod_dectree_res(cohort, interv, popmod_res, dectree_res, folders)

  return()
}
