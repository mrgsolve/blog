library(spelling)

path <- list.files("posts", pattern = "\\.qmd$", full.names = TRUE)

ignore <- readLines("WORDLIST")

if(!dir.exists("spelling-rmd")) dir.create("spelling-rmd")

stems <- basename(path)

newfiles <- file.path("spelling-rmd", paste0(tools:::file_path_sans_ext(stems), ".Rmd"))

x <- file.copy(path, newfiles, overwrite=TRUE)

spell_check_files(newfiles, ignore)

unlink("spelling-rmd", recursive=TRUE)

