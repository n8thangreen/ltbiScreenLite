
#' Parallel cost-effectiveness decision tree
#'
#' Based on code from here:
#' \url{https://www.r-bloggers.com/how-to-go-parallel-in-r-basics-tips/}
#'
#' @param scenario_params list of dataframes of cost and probability values
#' @param interv list of fixed policy parameters
#' @param folders list os strings of locations for data and plots
#' @param out_datatree include in return and save data.tree object; default: FALSE
#'
#' @return List of \code{decision_tree_cluster} outputs for each scenario
#' @export
#'
#' @examples
#'
parallel_decision_tree <- function(scenario_params,
                                   interv,
                                   folders,
                                   out_datatree = FALSE) {

  # calculate the number of cores
  no_cores <- detectCores() - 1

  # initiate cluster
  cl <- makeCluster(no_cores)#, outfile = "temp_logfile.txt")

  clusterEvalQ(cl, library(data.tree))
  clusterEvalQ(cl, library(dplyr))
  clusterEvalQ(cl, library(treeSimR))
  clusterEvalQ(cl, library(purrr))
  clusterEvalQ(cl, library(ltbiScreenLite))

  clusterEvalQ(cl, source("R/subset_pop_dectree.R"))
  clusterEvalQ(cl, source("R/sample_subset_pop_dectree.R"))

  set.seed(12345)

  ptm <- proc.time()

  dectree_res <- parLapplyLB(cl,
                             scenario_params,
                             fun = decision_tree_cluster,
                             N.mc = interv$N.mc,
                             out_datatree = out_datatree)

  run_time <- (proc.time() - ptm)/60
  print(run_time)

  stopCluster(cl)

  out_dir <- folders$output$scenario

  # saveRDS(dectree_res, file = pastef("output", cluster_output_filename))
  save(dectree_res, file = pastef(out_dir, "dectree_res.RData"))

  if (out_datatree) {

    readr::write_csv(x = my_ToDataFrameTypeCol(x = dectree_res[[1]]$osNode.cost,
                                               "distn", "max", "min", "p", "pmin", "pmax", "path_probs", "payoff",
                                               "sampled", "weighted_sampled", "pmax", "pmin", "scale", "shape", "type"),
                     path = pastef(out_dir, "dectree_cost.csv"))

    readr::write_csv(x = my_ToDataFrameTypeCol(dectree_res[[1]]$osNode.health,
                                               "distn", "max", "min", "p", "pmin", "pmax", "path_probs", "payoff",
                                               "sampled", "weighted_sampled", "pmax", "pmin", "scale", "shape", "type"),
                     path = pastef(out_dir, "dectree_health.csv"))
  }

  return(dectree_res)
}


