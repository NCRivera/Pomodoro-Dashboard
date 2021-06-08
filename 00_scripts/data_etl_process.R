# Libraries ----
library(tidyverse)
library(janitor)
library(RSQLite)
library(lubridate)


# Data Transformation Function ----
history <- read_csv("./00_data/history.csv") %>% 
    tibble() 

history_clean <- history %>% 
    clean_names() %>% 
    rename(end_dttm = end_iso_8601) %>% 
    mutate(
        # Add month column
        # month = 
        month = end_date %>% floor_date() %>% month(),
        end_timestamp_unix = end_timestamp_unix %>% as.POSIXct(origin="1970-01-01")
    )


# # FUNCTIONS ----
# connection <- dbConnect(RSQLite::SQLite(), "00_data/pomodoro.db")
# 
# 
# # UPDATE SQLITE DATABASE TABLES ----
# dbListTables(connection)
# 
# dbGetQuery(conn = connection, statement = "SELECT count(*) AS ROW_COUNT FROM county")
# dbGetQuery(conn = connection, statement = "SELECT count(*) AS ROW_COUNT FROM state")
# 
# 
# RSQLite::db
# dbDisconnect(conn = connection)
