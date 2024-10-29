library(here)

src <- "~/git/mrgsolve/dynamic-dosing"
msrc <- file.path(src, "model")
qsrc <- file.path(src, "evtools.qmd")

models <- list.files(msrc, pattern = "evtools", full.names=TRUE)

where <- here("posts/model")

file.copy(from = models, to = where, overwrite = TRUE)

#file.copy(from = qsrc, to = here("posts"), overwrite = TRUE)

