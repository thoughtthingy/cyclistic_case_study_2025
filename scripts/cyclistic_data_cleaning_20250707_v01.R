# Install packages
install.packages("here")
install.packages("skimr")
install.packages("janitor")
install.packages("tidyverse")  # Includes dplyr, lubridate, and more

# Load packages
library(here)
library(skimr)
library(janitor)
library(tidyverse)  # Loads dplyr, lubridate, ggplot2, etc.

# Ingest data
q1_2019 <- read.csv("Copy of CyclisticTrips2019_q1_20250706_v01 - Trips2019_q1.csv")
q1_2020 <- read.csv("Copy of CyclisticTrips2020_q1_20250706_v01 - Trips2020_q1.csv")

skim_without_charts(q1_2019)
glimpse(q1_2019)
head(q1_2019)
colnames(q1_2019)

skim_without_charts(q1_2020)
glimpse(q1_2020)
head(q1_2020)
colnames(q1_2020)

summary(q1_2019$tripduration)

ggplot(q1_2019, aes(x = tripduration)) +
  geom_histogram(binwidth = 300, fill = "#4ECDC4", color = "#1B4965") +
  labs(title = "Trip Duration Distribution", x = "Trip Duration (seconds)", y = "Count") +
  theme_minimal() +
  coord_cartesian(xlim = c(0, 6000))  # Zoom to 0–100 minutes (0–600 seconds)

# Filtered tripduration outliers for v1
q1_2019_cleaned_v1 <- q1_2019 %>%
  filter(tripduration >= 60 & tripduration <=86400)

# Count rows before and after
cat("Original rows:", nrow(q1_2019), "\n")
cat("Cleaned rows:", nrow(q1_2019_cleaned_v1), "\n")

# Check summary of cleaned trip_duration
summary(q1_2019_cleaned_v1$tripduration)

ggplot(q1_2019_cleaned_v1, aes(x = tripduration)) +
  geom_histogram(binwidth = 5, fill = "#4ECDC4", color = "#1B4965") +
  labs(title = "Trip Duration Distribution (Outliers Removed)", x = "Trip Duration (minutes)", y = "Count") +
  theme_minimal() +
  coord_cartesian(xlim = c(0, 100))

# Add weekday column for v2

install.packages("hms")
library(hms)

q1_2019_cleaned_v2 <- q1_2019_cleaned_v1 %>%
  separate(start_time, into=c("start_date", "start_time"), sep=" ") %>% 
  separate(end_time, into=c("end_date", "end_time"), sep=" ") %>% 
  
  mutate(start_time = hms::as_hms(start_time),
         end_time = hms::as_hms(end_time)) %>%
  mutate(start_date = as.Date(start_date, format = "%m/%d/%Y"),
         end_date = as.Date(end_date, format = "%m/%d/%Y")) %>% 
  
  mutate(weekday = factor(weekdays(start_date), 
                          levels = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")))


head(q1_2019_cleaned_v2 %>% select(start_time, end_time, weekday, tripduration))
nrow(q1_2019_cleaned_v2)
summary(q1_2019_cleaned_v2$tripduration)

# Added tripduration and weekday columns for q1_2020_cleaned_v1

q1_2020_cleaned_v1 <- q1_2020 %>%
  separate(started_at, into=c("start_date", "start_time"), sep=" ") %>% 
  separate(ended_at, into=c("end_date", "end_time"), sep=" ") %>% 
  
  mutate(start_time = hms::as_hms(start_time),
         end_time = hms::as_hms(end_time)) %>%
  mutate(start_date = as.Date(start_date, format = "%m/%d/%Y"),
         end_date = as.Date(end_date, format = "%m/%d/%Y")) %>% 
  # Add tripduration column
  mutate(tripduration = end_time - start_time) %>% 
  # Add weekday column
  mutate(weekday = factor(weekdays(start_date), 
                          levels = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday")))


head(q1_2020_cleaned_v1 %>% select(start_time, end_time, weekday, tripduration))
arrange(q1_2020_cleaned_v1, desc(tripduration))

# For q1_2020_cleaned_v2, removed outliers for tripduration

q1_2020_cleaned_v2 <- q1_2020_cleaned_v1 %>%
  filter(tripduration >= 60 & tripduration <=86400)

head(q1_2020_cleaned_v2)
nrow(q1_2020_cleaned_v1)
nrow(q1_2020_cleaned_v2)

# Added new column for both dataframes q1_2019_cleaned_v2 and q1_2020_cleaned_v2 

q1_2019_cleaned_v3 <- q1_2019_cleaned_v2 %>% 
  mutate(tripduration_minutes = as.numeric(difftime(end_time, start_time, units = "mins")))

clean_names(q1_2019_cleaned_v3) # Cleaned column names
colSums(is.na(q1_2019_cleaned_v3)) # check for NA values
head(q1_2019_cleaned_v3)

q1_2020_cleaned_v3 <- q1_2020_cleaned_v2 %>% 
  mutate(tripduration_minutes = as.numeric(difftime(end_time, start_time, units = "mins")))

clean_names(q1_2019_cleaned_v3) # Cleaned column names
colSums(is.na(q1_2019_cleaned_v3)) # check for NA values
head(q1_2020_cleaned_v3)

# Checked spelling for the station names

names(q1_2019_cleaned_v3)
unique(q1_2019_cleaned_v3$from_station_name)
unique(q1_2019_cleaned_v3$to_station_name)

q1_2019_cleaned_v3 %>%
  filter(grepl("\\*", from_station_name) | grepl("\\*", to_station_name)) %>%
  select(from_station_name, to_station_name) %>%
  head()

library(tools)

q1_2019_cleaned_v4 <- q1_2019_cleaned_v3 %>%
  # Clean station names: remove whitespace, asterisks, and convert to title case
  mutate(from_station_name = trimws(from_station_name),  # Remove leading/trailing whitespace
         to_station_name = trimws(to_station_name),
         from_station_name = gsub("\\s*\\(\\*\\)|\\s*\\(temp\\)", "", from_station_name),  # Remove asterisks
         to_station_name = gsub("\\s*\\(\\*\\)|\\s*\\(temp\\)", "", to_station_name),
         from_station_name = tools::toTitleCase(tolower(from_station_name)),  # Convert to title case
         to_station_name = tools::toTitleCase(tolower(to_station_name)))

q1_2019_cleaned_v4 %>%
  filter(grepl("\\*", from_station_name) | grepl("\\*", to_station_name)) %>%
  select(from_station_name, to_station_name) %>%
  head()

# v4 for the q1_2020 dataset

names(q1_2020_cleaned_v3)
unique(q1_2020_cleaned_v3$start_station_name)
unique(q1_2020_cleaned_v3$end_station_name)

q1_2020_cleaned_v3 %>%
  filter(grepl("\\*", start_station_name) | grepl("\\*", end_station_name)) %>%
  select(start_station_name, end_station_name) %>%
  head()

q1_2020_cleaned_v4 <- q1_2020_cleaned_v3 %>%
  # Clean station names: remove whitespace, asterisks, and convert to title case
  mutate(start_station_name = trimws(start_station_name),  # Remove leading/trailing whitespace
         end_station_name = trimws(end_station_name),
         start_station_name = gsub("\\s*\\(\\*\\)|\\s*\\(temp\\)", "", start_station_name),  # Remove asterisks
         end_station_name = gsub("\\s*\\(\\*\\)|\\s*\\(temp\\)", "", end_station_name),
         start_station_name = tools::toTitleCase(tolower(start_station_name)),  # Convert to title case
         end_station_name = tools::toTitleCase(tolower(end_station_name)))

q1_2020_cleaned_v4 %>%
  filter(grepl("\\*", start_station_name) | grepl("\\*", end_station_name)) %>%
  select(start_station_name, end_station_name) %>%
  head()

# changing column names for possible data aggregation
names(q1_2020_cleaned_v4) [1] <- "trip_id"
names(q1_2020_cleaned_v4) [2] <- "bike_id"
names(q1_2020_cleaned_v4) [7] <- "from_station_name"
names(q1_2020_cleaned_v4) [8] <- "from_station_id"
names(q1_2020_cleaned_v4) [9] <- "to_station_name"
names(q1_2020_cleaned_v4) [10] <- "to_station_id"
names(q1_2020_cleaned_v4) [15] <- "usertype"


colnames(q1_2020_cleaned_v4)

write.csv(q1_2019_cleaned_v4, "CyclisticTrips2019_q1_07142025_v02")
write.csv(q1_2020_cleaned_v4, "CyclisticTrips2020_q1_07142025_v02")

