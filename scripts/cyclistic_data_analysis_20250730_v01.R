getwd()
setwd("~/Desktop/Cyclistic Case Study 2025")

library(tidyverse)  #helps wrangle data
# Use the conflicted package to manage conflicts
library(conflicted)

# Set dplyr::filter and dplyr::lag as the default choices
conflict_prefer("filter", "dplyr")
conflict_prefer("lag", "dplyr")

#=====================
# STEP 1: COLLECT DATA
#=====================
# # Upload Divvy datasets (csv files) here
q1_2019 <- read_csv("CyclisticTrips2019_q1_07142025_v02.csv")
q1_2020 <- read_csv("CyclisticTrips2020_q1_07142025_v02.csv")


#====================================================
# STEP 2: WRANGLE DATA AND COMBINE INTO A SINGLE FILE
#====================================================
# Compare column names each of the files
# While the names don't have to be in the same order, they DO need to match perfectly before we can use a command to join them into one file
colnames(q1_2019)
colnames(q1_2020)

# Inspect the dataframes and look for incongruencies
str(q1_2019)
str(q1_2020)

#rename column

names(q1_2019) [7] <- "bike_id"

# Convert ride_id and rideable_type to character so that they can stack correctly
q1_2019 <-  mutate(q1_2019, trip_id = as.character(trip_id)
                   ,bike_id = as.character(bike_id))

q1_2020 <-  mutate(q1_2020, trip_id = as.character(trip_id)
                   ,bike_id = as.character(bike_id)) 

# Stack individual quarter's data frames into one big data frame
all_trips <- bind_rows(q1_2019, q1_2020)#, q3_2019)#, q4_2019, q1_2020)

# Remove lat, long, birthyear, and gender fields as this data was dropped beginning in 2020
all_trips <- all_trips %>%  
  select(-c(start_lat, start_lng, end_lat, end_lng, birthyear, gender,  "...1"))

#======================================================
# STEP 3: CLEAN UP AND ADD DATA TO PREPARE FOR ANALYSIS
#======================================================
# Inspect the new table that has been created
colnames(all_trips)  #List of column names
nrow(all_trips)  #How many rows are in data frame?
dim(all_trips)  #Dimensions of the data frame?
head(all_trips)  #See the first 6 rows of data frame.  Also tail(all_trips)
str(all_trips)  #See list of columns and data types (numeric, character, etc)
summary(all_trips)  #Statistical summary of data. Mainly for numerics


# There are a few problems we will need to fix:
# (1) In the "member_casual" column, there are two names for members ("member" and "Subscriber") and two names for casual riders ("Customer" and "casual"). We will need to consolidate that from four to two labels.
# (2) The data can only be aggregated at the ride-level, which is too granular. We will want to add some additional columns of data -- such as day, month, year -- that provide additional opportunities to aggregate the data.
# (3) We will want to add a calculated field for length of ride since the 2020Q1 data did not have the "tripduration_minutes" column. We will add "tripduration_minutes" to the entire dataframe
# (4) There are some rides where tripduration_minutes shows up as negative, including several hundred rides where Divvy took bikes out of circulation for Quality Control reasons. We will want to delete these rides.

# In the "member_casual" column, replace "Subscriber" with "member" and "Customer" with "casual"
# Before 2020, Divvy used different labels for these two types of riders ... we will want to make our dataframe consistent with their current nomenclature
# Begin by seeing how many observations fall under each usertype
table(all_trips$usertype)

# Reassign to the desired values (we will go with the current 2020 labels)
all_trips <-  all_trips %>% 
  mutate(usertype = recode(usertype
                                ,"Subscriber" = "member"
                                ,"Customer" = "casual"))

# Check to make sure the proper number of observations were reassigned
table(all_trips$usertype)

# Add columns that list the date, month, day, and year of each ride
# This will allow us to aggregate ride data for each month, day, or year ... before completing these operations we could only aggregate at the ride level
all_trips$date <- as.Date(all_trips$start_date) #The default format is yyyy-mm-dd
all_trips$month <- format(as.Date(all_trips$date), "%m")
all_trips$day <- format(as.Date(all_trips$date), "%d")
all_trips$year <- format(as.Date(all_trips$date), "%Y")
all_trips$day_of_week <- format(as.Date(all_trips$date), "%A")

# Inspect the structure of the columns
str(all_trips)

# Convert "tripduration_minutes" from Factor to numeric so we can run calculations on the data
is.factor(all_trips$tripduration_minutes)
all_trips$tripduration_minutes <- as.numeric(as.character(all_trips$tripduration_minutes))
is.numeric(all_trips$tripduration_minutes)

# Remove "bad" data
# The dataframe includes a few hundred entries when bikes were taken out of docks and checked for quality by Divvy or tripduration_minutes was negative
# We will create a new version of the dataframe (v2) since data is being removed
all_trips_v2 <- all_trips[!(all_trips$from_station_name == "HQ QR" | all_trips$tripduration_minutes< 0 | all_trips$tripduration_minutes < 1),] 

# checking if outlier was removed
df <- arrange(all_trips_v2, (tripduration_minutes))
print(df, width = Inf)
rm(df)

#=====================================
# STEP 4: CONDUCT DESCRIPTIVE ANALYSIS
#=====================================
# Descriptive analysis on tripduration_minutes (all figures in seconds)
mean(all_trips_v2$tripduration_minutes) #straight average (total ride length / rides)
median(all_trips_v2$tripduration_minutes) #midpoint number in the ascending array of ride lengths
max(all_trips_v2$tripduration_minutes) #longest ride
min(all_trips_v2$tripduration_minutes) #shortest ride

# Condense the four lines above to one line using summary() on the specific attribute
summary(all_trips_v2$tripduration_minutes)

# Compare members and casual users
aggregate(all_trips_v2$tripduration_minutes ~ all_trips_v2$usertype, FUN = mean)
aggregate(all_trips_v2$tripduration_minutes ~ all_trips_v2$usertype, FUN = median)
aggregate(all_trips_v2$tripduration_minutes ~ all_trips_v2$usertype, FUN = max)
aggregate(all_trips_v2$tripduration_minutes ~ all_trips_v2$usertype, FUN = min)

# See the average ride time by each day for members vs casual users
aggregate(all_trips_v2$tripduration_minutes ~ all_trips_v2$usertype + all_trips_v2$day_of_week, FUN = mean)

# Order the days of the week
all_trips_v2$day_of_week <- ordered(all_trips_v2$day_of_week, levels=c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))

# Now, let's run the average ride time by each day for members vs casual users
aggregate(all_trips_v2$tripduration_minutes ~ all_trips_v2$usertype + all_trips_v2$day_of_week, FUN = mean)


# analyze ridership data by type and weekday
all_trips_v2 %>% 
  group_by(usertype, weekday) %>%  #groups by usertype and weekday
  summarise(number_of_rides = n()							#calculates the number of rides and average duration 
            ,average_duration = mean(tripduration_minutes)) %>% 		# calculates the average duration
  arrange(usertype, weekday)%>% 
  ggplot(aes(x = weekday, y = number_of_rides, fill = usertype)) +
  geom_col(position = "dodge")

# Let's create a visualization for average duration
all_trips_v2 %>% 
  group_by(usertype, weekday) %>% 
  summarise(number_of_rides = n()
            ,average_duration = mean(tripduration_minutes)) %>% 
  arrange(usertype, weekday)  %>% 
  ggplot(aes(x = weekday, y = average_duration, fill = usertype)) +
  geom_col(position = "dodge")

#=================================================
# STEP 5: EXPORT SUMMARY FILE FOR FURTHER ANALYSIS
#=================================================
# add a column with value of 1; so you can count 1 per row
all_trips_v2$ride_count <- 1

# Aggregate by usertype and day_of_week: count rides and calculate mean ride length
counts <- all_trips_v2 %>% 
  group_by(usertype, day_of_week) %>% 
  summarise(
    total_rides = sum(ride_count),
    avg_ride_length = mean(tripduration_minutes)
  ) %>% 
  ungroup()

# Print the results to check
print(counts, n = 20, width = Inf)

# Create a csv file that we will visualize in Excel, Tableau, or any presentation software
write.csv(counts, "ride_summary_by_usertype_day.csv", row.names = FALSE)
# just saving the entire dataset
write.csv(all_trips_v2, "AllTrips_q1", row.names = FALSE)







