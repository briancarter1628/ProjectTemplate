


# System options ----------------------------------------------------------

options( keep.source = TRUE )
options( show.error.locations = TRUE )
options( mc.cores = 4L)
options(scipen=10)

utils::Rprof(line.profiling=TRUE)
utils::rc.settings(ipck=TRUE)



# Packages ----------------------------------------------------------------
myPackages <- c("dplyr", "magrittr", "parallel", "dbplyr", "RSQLite",
                "openxlsx", "DBI", "glue", "readr", "testthat", "utils")
cat("Loading standard packages\n")
for (i in 1:length(myPackages)) {
        cat(paste0(myPackages[i],"\n"))
}
suppressMessages({
returnStatus <- lapply(myPackages, require, character.only = TRUE, quietly = TRUE)
rm(returnStatus, myPackages)
})


# Set file paths ----------------------------------------------------------
main_path <- getwd() %>% normalizePath()
output_path <-  main_path %>% glue("/output")
input_path <- main_path %>% glue("/data")
test_path <- main_path %>% glue("/tests")



# Functions ---------------------------------------------------------------
#

listPackages <- function() {
        foo <- loadedNamespaces()
        lapply(foo, function(package) {
                data.frame(Package = package,
                           Version = packageVersion(package))
        }) %>%
                do.call("rbind", .)
}


# What I want to do on startup

.First <- function() {

        .logFile <<- paste0("rLogs - ", Sys.time(), ".txt")
        con <- file(glue("{main_path}/logs/{.logFile}"))
        sink(con)
        cat(glue("##------ [{main_path}] ------##\n"))
        cat(R.version.string,"\n")
        utils::timestamp()
        cat("\n")
        cat("Loaded packages:\n")
        listPackages()
        cat("\n")
        sink()
        close(con)

}

.Last <- function() {
        con <- file(glue("{main_path}/logs/{.logFile}"))

        sink(con, append = TRUE, type = "output")
        sink(con, append = TRUE, type = "message")

        cat(readChar(rstudioapi::getSourceEditorContext()$path, # Writing currently opened R script to file
                     file.info(rstudioapi::getSourceEditorContext()$path)$size))



        closeAllConnections() # Close connection to log file
}



# error handling ----------------------------------------------------------

# TODO: This is broken


