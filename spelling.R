library(spelling)

files <- list.files("posts", pattern = "qmd", full.names=TRUE)
spell_check_files(files)
