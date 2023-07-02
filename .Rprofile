options( keep.source = TRUE )
options( show.error.locations = TRUE )





myPackages <- c("dplyr", "magrittr", "parallel", "dbplyr", "RSQLite",
                "openxlsx", "DBI", "glue", "readr")
cat("Loading standard packages\n")
lapply(myPackages, require, character.only = TRUE)




# Set file paths ----------------------------------------------------------

main_path <- getwd() %>% normalizePath()
output_path <-  main_path %>% glue("/output")
test_path <- main_path %>% glue("/tests")


# Environmental variables -------------------------------------------------

suppressMessages({
env_specs <- "config/env_specs.csv" %>%
     readr::read_csv()
})



# error handling ----------------------------------------------------------

# TODO: This is broken
globalCallingHandlers(

     error = function(e) {
          outfile <- paste0("logs/error-logs - ",Sys.time(), ".txt")
          con = file(outfile)
          file(outfile)
          sink(outfile)
          close(con)
     }
)







# options(error = function () {
#
#      outfile <- paste0("logs/error-logs - ",Sys.time(), ".txt")
#      utils::Rprof(outfile)
#      cat(paste0("\n\n", paste(rep("=", 20), collapse = "")))
#      cat("\nSaving `last.dump` due to error\n")
#      utils::dump.frames()
#
#
#      summaryRprof(outfile,
#                         memory = "stats",
#                         lines = "show",
#                         diff = TRUE)
#      sink(outfile)
#
# })


# options(error = function () {
#
#      utils::Rprof(NULL)
#      cat(paste0("\n\n", paste(rep("=", 20), collapse = "")))
#      cat("\nSaving `last.dump` due to error\n")
#
#      utils::dump.frames()
#
#      if (!interactive()) {
#           if (Sys.getenv("PARAM_WORKING_DIR")!="") {
#                save.image(file = file.path(Sys.getenv("PARAM_WORKING_DIR"),paste0(basename(getwd()),"_",format(Sys.time(), "%Y_%m_%d_%H_%M_%OS3"),"_last.dump.rda")))
#                sink(file=file.path(Sys.getenv("PARAM_WORKING_DIR"),paste0(basename(getwd()),"_traceback_",format(Sys.time(), "%Y_%m_%d_%H_%M_%OS3"),".txt")))
#                if (Sys.getenv("PARAM_ENABLE_PROFILING")=="1") {
#                     saveRDS(utils::summaryRprof(lines="hide"),file.path(Sys.getenv("PARAM_WORKING_DIR"),paste0(basename(getwd()),"_",format(Sys.time(), "%Y_%m_%d_%H_%M_%OS3"),"_profile_summary_functions.rds")))
#                     saveRDS(utils::summaryRprof(lines="show"),file.path(Sys.getenv("PARAM_WORKING_DIR"),paste0(basename(getwd()),"_",format(Sys.time(), "%Y_%m_%d_%H_%M_%OS3"),"_profile_summary_lines.rds")))
#                     saveRDS(utils::summaryRprof(lines="both"),file.path(Sys.getenv("PARAM_WORKING_DIR"),paste0(basename(getwd()),"_",format(Sys.time(), "%Y_%m_%d_%H_%M_%OS3"),"_profile_summary_both.rds")))
#                }
#           } else {
#                save.image(file = paste0(basename(getwd()),"_",format(Sys.time(), "%Y_%m_%d_%H_%M_%OS3"),"_last.dump.rda"))
#                sink(file=file.path(paste0(basename(getwd()),"_traceback_",format(Sys.time(), "%Y_%m_%d_%H_%M_%OS3"),".txt")))
#                if (Sys.getenv("PARAM_ENABLE_PROFILING")=="1") {
#                     saveRDS(utils::summaryRprof(lines="hide"),paste0(basename(getwd()),"_",format(Sys.time(), "%Y_%m_%d_%H_%M_%OS3"),"_profile_summary_functions.rds"))
#                     saveRDS(utils::summaryRprof(lines="lines"),paste0(basename(getwd()),"_",format(Sys.time(), "%Y_%m_%d_%H_%M_%OS3"),"_profile_summary_lines.rds"))
#                     saveRDS(utils::summaryRprof(lines="both"),paste0(basename(getwd()),"_",format(Sys.time(), "%Y_%m_%d_%H_%M_%OS3"),"_profile_summary_both.rds"))
#                }
#           }
#
#           # Print traceback to file
#           cat(attr(last.dump,"error.message")); # Print error message to file, along with simplified stack trace.
#           cat('\nTraceback:');
#           cat('\n');
#           traceback(3); # Print full traceback leaving out the outermost 3 function calls.
#           sink();
#
#           cat("\nTerminating early due to error in non-interactive session\n")
#           cat(paste0(paste(rep("=", 20),  collapse = ""), "\n"))
#           quit(status = 2, save = "no")
#      } else {
#
#           utils::dump.frames()
#           profile_summary<-utils::summaryRprof()
#           cat(paste0(paste(rep("=", 20),  collapse = ""), "\n"))
#      }
# })

