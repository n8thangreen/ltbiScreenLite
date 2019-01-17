
#' ---
#' title: "LTBI screening model:
#' basic cost-effectiveness plane plot
#'
#' author: "N Green"
#' date: "`r format(Sys.Date())`"
#' output:
#'   html_document:
#'     keep_md: TRUE
#' ---


load(here::here("output", "data", "policy_001", "ce_res.RData"))

plot(x = ce_res$ce_incr$e[,2], y = ce_res$ce_incr$c[,2], xlim = c(0, 0.01), ylim = c(0, 200), col = "red", xlab = "QALYs", ylab = "costs")
points(x = ce_res$ce_incr$e[,3], y = ce_res$ce_incr$c[,3], xlim = c(0, 0.01), ylim = c(0, 200), col = "blue")
points(x = ce_res$ce_incr$e[,4], y = ce_res$ce_incr$c[,4], xlim = c(0, 0.01), ylim = c(0, 200), col = "green")

points(x = mean(ce_res$ce_incr$e[,4]), y = mean(ce_res$ce_incr$c[,4]), xlim = c(0, 0.01), ylim = c(0, 200), col = "black", pch = 17)
points(x = mean(ce_res$ce_incr$e[,3]), y = mean(ce_res$ce_incr$c[,3]), xlim = c(0, 0.01), ylim = c(0, 200), col = "black", pch = 17)
points(x = mean(ce_res$ce_incr$e[,2]), y = mean(ce_res$ce_incr$c[,2]), xlim = c(0, 0.01), ylim = c(0, 200), col = "black", pch = 17)

abline(a = 0, b = 20000)
abline(a = 0, b = 30000, lty = 2)
