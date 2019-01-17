
#' make_incremental_ce
#'
#' For plotting purposed in particular, we want the cost and QALY
#' output data to be in the same format as used by the \code{BCEA} package.
#'
#' @param popmod_res \code{activetb_qaly_cost()} output
#' @param t_dectree list of \code{mc_cost} and \code{mc_health} from \code{parallel_decision_tree()} output
#' @param sdiscount average discounting due to delay to starting screening
#' @param folders list of string locations
#'
#' @return list of incremental e and c
#' @export
#'
#' @examples
#'
make_incremental_ce <- function(popmod_res,
                                t_dectree,
                                sdiscount,
                                folders = NA) {

  tb_cost <- list_to_BCEA_incr(popmod_res$cost_incur_person)
  tb_QALYgain <- list_to_BCEA_incr(popmod_res$QALYgain_person)

  LTBI_cost <- list_to_BCEA_incr(t_dectree$cost_person, sdiscount)
  LTBI_QALYgain <- list_to_BCEA_incr(t_dectree$QALY_person, -sdiscount)

  incr_e <- LTBI_QALYgain + tb_QALYgain
  incr_c <- LTBI_cost + tb_cost

  if (!all(is.na(folders))) {
    save(incr_e, incr_c,
         file = pastef(folders$output$scenario, "e_and_c_totals.RData"))
  }

  list(e = as.matrix(incr_e),
       c = as.matrix(incr_c))
}

