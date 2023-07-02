


# Load any additional packages --------------------------------------------

# Already loaded by the Rprofile
# "dplyr", "magrittr", "parallel", "dbplyr", "RSQLite",
# "openxlsx", "DBI", "glue", "readr"


# Source functions --------------------------------------------------------

source(glue::glue("{main_path}//R/csv_plus.r"),
     local = TRUE, echo = TRUE, keep.source = TRUE, max.deparse.length = Inf)



# Environmental specs -----------------------------------------------------

suppressMessages({
     env_specs <- "config/env_params.csv" %>%
          readr::read_csv()
})



# Data sources ------------------------------------------------------------

loadData <- TRUE
if (loadData == TRUE) {

# Database object
myDB <- dbConnect(SQLite(), glue("{input_path}/myDB.db"))

# Rdata files
# load(glue("{input_path}/dat.Rdata"))

# RDS files
# dat <- readRDS(glue("{input_path}/dat.RDS"))

# CSV files
# dat <- read_csv(glue("{input_path}/dat.csv))

# Excel files
# dat <- readxl::read_excel(glue("{input_path}/dat.xlsx"), sheet = "SheetName")

}
dbDisconnect(myDB)
rm(myDB)



# Begin programming -------------------------------------------------------


