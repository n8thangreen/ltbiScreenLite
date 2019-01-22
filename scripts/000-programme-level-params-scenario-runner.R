
#' ---
#' title: "LTBI screening model:
#' high-level policy runner
#' for a (deterministic) sensitivity analysis
#' of screening programme scenarios"
#'
#' author: "N Green"
#' date: "`r format(Sys.Date())`"
#' output:
#'   html_document:
#'     keep_md: TRUE
#' ---


rm(list = ls())
devtools::load_all(".")

pkgs <- c("parallel",
          "assertthat",
          "crayon",
          "tibble",
          "memoise",
          "QALY",
          "here",
          "arm",
          "miscUtilities", #NG
          "treeSimR", #NG
          "data.tree",
          "magrittr")

inst <- lapply(pkgs, library, character.only = TRUE)

save_session_info("session_info.txt")

run_model()

source("scripts/plot-basic-ce-plane.R")
