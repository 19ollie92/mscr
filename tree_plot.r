install.packages("MCMCtreeR")

library(MCMCtreeR)


dated.tree <- MCMCtreeR::readMCMCtree("")

MCMC.tree.plot(dated.tree,
               cex.tips = 0.3, 
               time.correction = 100, 
               scale.res = c("Eon", "Period"), 
               plot.type = "phylogram", 
               cex.age = 0.5, 
               cex.labels = 0.6, 
               relative.height = 0.1, 
               col.tree = "grey40", 
               label.offset = 7, 
               node.method = "bar",
               lwd.bar = 1.5,
               col.age = "lightgreen",
               ladderize.tree = TRUE,
               no.margin = FALSE)

MCMC.tree.plot(dated.tree,
               cex.tips = 0.4, 
               time.correction = 100, 
               scale.res = c("Eon", "Period"), 
               plot.type = "phylogram", 
               cex.age = 0.4, 
               cex.labels = 0.6, 
               relative.height = 0.1, 
               col.tree = "grey40", 
               label.offset = 7, 
               node.method = "none",
               ladderize.tree = TRUE,
               no.margin = FALSE)






