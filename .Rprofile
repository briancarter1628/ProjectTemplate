options( keep.source = TRUE )
options( show.error.locations = TRUE )
utils::Rprof(line.profiling=TRUE)




myPackages <- c("dplyr", "magrittr", "parallel", "dbplyr", "RSQLite",
                "openxlsx", "DBI", "glue", "readr", "testthat")
cat("Loading standard packages\n")
suppressMessages({
returnStatus <- lapply(myPackages, require, character.only = TRUE, quietly = TRUE)
rm(returnStatus, myPackages)
})


# Set file paths ----------------------------------------------------------

main_path <- getwd() %>% normalizePath()
output_path <-  main_path %>% glue("/output")
input_path <- main_path %>% glue("/data")
test_path <- main_path %>% glue("/tests")



# error handling ----------------------------------------------------------

# TODO: This is broken


