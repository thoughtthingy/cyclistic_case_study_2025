# Google Data Analytics Capstone: Cyclistic Case Study

<img width="303" height="166" alt="cyclistic_logo" src="https://github.com/user-attachments/assets/cf72dcd8-861c-4482-980d-c5e5866c3028" />

## Introduction and Background

In this case study, I will act as a junior data analyst for Cyclistic, a fictional bike-share company based in Chicago, using Google Sheets, R, and Tableau Public. I will conduct descriptive data analysis to address the key question: How do annual members and casual riders differ in their use of Cyclistic bikes? Upon completing the analysis, I will deliver an executive summary with actionable insights for the executive team.[^1]

### Source Files
- Raw Dataset: [Divvy 2019 Q1](https://docs.google.com/spreadsheets/d/1uCTsHlZLm4L7-ueaSLwDg0ut3BP_V4mKDo2IMpaXrk4/template/preview?resourcekey=0-dQAUjAu2UUCsLEQQt20PDA#gid=1797029090), [Divvy 2020 Q1](https://docs.google.com/spreadsheets/d/179QVLO_yu5BJEKFVZShsKag74ZaUYIF6FevLYzs3hRc/template/preview#gid=640449855)
- Cleaned Dataset:[2019_q1_cleaned](https://docs.google.com/spreadsheets/d/1MxtiD3CMlbJXGbvzMxWXyI1LTOi6eC5hozvUvyDorCs/edit?usp=sharing), [2020_q1_cleaned](https://docs.google.com/spreadsheets/d/1yQXYk-ZZQsgx3GzCPojscbmvFHts7ipUQ2AVoxMiXfU/edit?usp=share_link)
- Merged and Aggregated Dataset: [all_trips_cleaned](https://drive.google.com/file/d/1BheKM8XRxJjtMqO8pXqa5fPlP8XqftKe/view?usp=share_link), [ride_summary](https://docs.google.com/spreadsheets/d/1Rngu_OxX0sEAt2dHv8SwBv-b8P-sIqWObhMm2vMRxEo/edit?usp=share_link)
- Data Integrity Check(Issues Log): [2019_q1_issues_log](https://docs.google.com/spreadsheets/d/1NseCw8f4Cxo1ufJSkZPb8uE6aCrzSH_y475Rad5Jbxk/edit?usp=share_link), [2020_q1_issues_log](https://docs.google.com/spreadsheets/d/175VOS11QnxyIQi6tUheKgxmG3mv6qKmDKail5v7n1YM/edit?usp=share_link)
- Data Cleaning Changelog and Code: [data_cleaning_code](https://github.com/thoughtthingy/cyclistic_case_study_2025/blob/main/scripts/cyclistic_data_cleaning_20250707_v01.R), [data_cleaning_changelog_md](https://github.com/thoughtthingy/cyclistic_case_study_2025/blob/main/docs/cyclistic_data_cleaning_changelog_20250707_v01.Rmd), [data_cleaning_changelog_html](https://github.com/thoughtthingy/cyclistic_case_study_2025/blob/main/docs/cyclistic_data_cleaning_changelog_20250707_v01.html)
- Data Analysis Code: [data_analysis_code](https://github.com/thoughtthingy/cyclistic_case_study_2025/blob/main/scripts/cyclistic_data_analysis_20250714_v01.R)
- Tableau Visualizations: [tableau link](https://public.tableau.com/views/CyclisticCaseStudy_17527636347470/AvgRideLength?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

### Scenario
It is April 1, 2020 and I am Junior Data Analyst on the Marketing Analyst team at Cyclistic. The director of marketing believes that maximizing annual memberships is crucial for the company's future success. My team aims to understand the differences in bike usage between casual riders and annual members to design a new marketing strategy for converting casual riders into annual members. My recommendations must be supported by compelling data insights and professional data visualizations for approval by Cyclistic executives. 

### Characters and teams
- **Cyclistic**: A bike-share program that features more than 5,800 bicycles and 600
docking stations. Cyclistic sets itself apart by also offering reclining bikes, hand
tricycles, and cargo bikes, making bike-share more inclusive to people with disabilities
and riders who can’t use a standard two-wheeled bike. The majority of riders opt for
traditional bikes; about 8% of riders use the assistive options. Cyclistic users are more
likely to ride for leisure, but about 30% use the bikes to commute to work each day.

- **Lily Moreno**: The director of marketing and your manager. Moreno is responsible for
the development of campaigns and initiatives to promote the bike-share program.
These may include email, social media, and other channels.

- **Cyclistic marketing analytics team**: A team of data analysts who are responsible for
collecting, analyzing, and reporting data that helps guide Cyclistic marketing strategy.
You joined this team six months ago and have been busy learning about Cyclistic’s
mission and business goals—as well as how you, as a junior data analyst, can help
Cyclistic achieve them.

- **Cyclistic executive team**: The notoriously detail-oriented executive team will decide
whether to approve the recommended marketing program.

### About the Company
Cyclistic launched its successful bike-share program in 2016. Since then, its fleet has grown to 5,824 geotracked bicycles locked into a network of 692 stations across Chicago, allowing bikes to be unlocked from one station and returned to any other. 

Previously, Cyclistic's marketing strategy focused on general awareness and broad consumer appeal, achieved partly through flexible pricing plans: single-ride passes, full-day passes, and annual memberships. Customers purchasing single-ride or full-day passes are considered casual riders, while those with annual memberships are Cyclistic members.

Cyclistic's finance analysts have determined that annual members are significantly more profitable than casual riders. Despite the pricing flexibility attracting more customers, Moreno believes maximizing annual members is key to future growth. She sees a strong opportunity to convert existing casual riders into members, as they are already aware of the program and use Cyclistic for their mobility needs. 

Moreno's clear goal is to design marketing strategies to convert casual riders into annual members. To achieve this, the team needs to understand how annual members and casual riders differ, why casual riders would purchase a membership, and how digital media can influence their marketing tactics. Moreno and her team are interested in analyzing historical bike trip data to identify trends. 


## Methodology

I will be using Google's data analysis process: **Ask, Prepare, Process, Analyze, Share, and Act.**

### Ask
___
Three questions will guide the future marketing program: 

1. How do annual members and casual riders use Cyclistic bikes differently? 

2. Why would casual riders buy Cyclistic annual memberships? 

3. How can Cyclistic use digital media to influence casual riders to become members? 

I have been assigned to answer the first question: *How do annual members and casual riders use Cyclistic bikes differently?*

#### Guiding Questions

- What is the problem you are trying to solve?

	 >**Identify usage differences between casual riders and annual members.**

- How can your insights drive business decisions?

  >**My insights will help answer the questions "why would casual riders buy Cyclistic annual memberships?" and "how can Cyclistic use digital media to influence casual riders to become members?". The latter is the business decision point and my analysis will be it’s foundation and main premise.**


#### Key tasks

- [x] Identify the business task 
- [x] Consider key stakeholders 

#### Deliverable

- A clear statement of the business task 

#### Business Task
Determine how casual riders and annual members use Cyclistic bikes differently to help inform Cyclistic marketing strategies convert casual riders to annual members.


### Prepare
---
#### Guiding Questions

-   Where is your data located?
    
    > **The dataset is both stored locally and in Google Drive.**
    
-   How is the data organized?
    
    > **The two datasets are both in wide format**

- Are there issues with bias or credibility in this data? Does your data ROCCC?

	> **This data is reliable. It has been preprocessed to exclude the possibility of sampling bias by removing trips taken by staff and trips that are less than 60 seconds in length (potentially false starts or users trying to re-dock the bike).**

	> **2. Originality -  This data is first-party data, as per checking [https://divvybikes-marketing-staging.lyft.net/system-data](https://divvybikes-marketing-staging.lyft.net/system-data)**

	> **3. Comprehensiveness - This data is comprehensive as it includes fields for trip duration, the time the biker started, the time the biker ended, and user type to be able to answer the question on the business task: how do annual members and casual riders use Cyclistic bikes differently?**

	> **4. Currency - The scenario of the case study  assumes that I went back in time in April 1, 2020 to analyze this data to help stakeholders decide on a “future” marketing program. For this purpose I would consider this data as current.**

	> **5. Citation - The data is frequently cited and used online.**
    
  
- How are you addressing licensing, privacy, security, and accessibility?

  

	> **1. Licensing - I have read the license agreement at [https://divvybikes.com/data-license-agreement](https://divvybikes.com/data-license-agreement) and I see no potential misuse of the data in my analysis, nor do I see myself violating the license agreement in any way.**

	> **2. Privacy - The trips have been anonymized. I will also use data aggregation to anonymize the individual data points involved.**

	> **3. Security - There would be duplicate files for those accessing the data. I would be the owner, and they can request edit access to the sheets.**

	> **4. Access - Improved access and usability by adopting a naming convention for files and using foldering for organization.**


  

- How did you verify the data’s integrity?

	> **1. Filtered all columns to check for missing or null values and nonsensical values(completeness and accuracy)**

	> **2. Sorted columns start_station_id, end_station_id, start_lat, start_lng, end_lat, and end_lng both in descending and ascending orders to check for outliers in the data and help see more inconsistencies with the formatting(accuracy and consistency)**

	> **3. Logged  all issues to issues log**

 
- How does it help you answer your question?
	> **I need the trip duration data trend of casual riders and annual members.**

  

- Are there any problems with the data?
	> **Yes there are some issues like the column names are not consistent or the fact that I have to assess the missing values and inconsistent formats. Other than that, the data is pertinent and should be usable after cleaning.**

#### Key tasks

- [x] Download data and store it appropriately
- [x] Identify how it’s organized
- [x] Sort and filter the data
- [x] Determine the credibility of the data

#### Deliverable

-   A description of all data sources used

#### Data Source Description
- I am using the Divvy bikeshare data from both the first quarter of 2019 and 2020 that can be found at [https://divvybikes-marketing-staging.lyft.net/system-data](https://divvybikes-marketing-staging.lyft.net/system-data). The data is stored via Google Drive, and there are 2 CSV files I would be working with. The license agreement found at [https://divvybikes.com/data-license-agreement](https://divvybikes.com/data-license-agreement) allows me to access, reproduce, analyze, copy, modify, distribute in your product or service, and use the Data for any lawful purpose. I have assessed that the dataset is reliable, original, comprehensive, current(for this case study), and cited. I have checked the dataset’s data integrity, and it is something I can work with. This dataset is pertinent and will help me answer the question on the business task: Determine how casual riders and annual members use Cyclistic bikes differently to inform Cyclistic marketing strategies that convert casual riders to annual members. For this case study, I have rebranded this real-world dataset to the fictional Cyclistic bike share data of the scenario I am tackling.

### Process
___

#### Guiding questions

- What tools are you choosing and why?
	> **In cleaning the data, I would use Google Sheets and R. The dataset is too large to clean with Google Sheets, so it must be used in combination with R. Google Sheets will then supplement the data cleaning that will be done in R to potentially clean aggregated data.**

- Have you ensured your data’s integrity?
	> **Yes. I made sure not to do any data manipulation and just documented potential issues with the data in my pre-cleaning. The data ingestion I performed in storing the files via Google Drive was done only once and is not prone to human error. There is no data replication yet done, but I plan to make backup copies of the data and document each step of the cleaning so I can backtrack to a specific point.**

  

- What steps have you taken to ensure that your data is clean?

  

	> **Documented the steps in a changelog.**

  

- How can you verify that your data is clean and ready to analyze?

	> **Followed this checklist for verification:**

 
-   [x] Sources of errors: Did you use the right tools and functions to find the source of the errors in your dataset?
-   [x] Null data: Did you search for NULLs using conditional formatting and filters?
-   [x] Misspelled words: Did you locate all misspellings?
-   [x] Mistyped numbers: Did you double-check that your numeric data has been entered correctly?
-   [x] Extra spaces and characters: Did you remove any extra spaces or characters using the TRIM function?
-   [x] Duplicates: Did you remove duplicates in spreadsheets using the Remove Duplicates function or DISTINCT in SQL?
-   [x] Mismatched data types: Did you check that numeric, date, and string data are typecast correctly?
-   [x] Messy (inconsistent) strings: Did you make sure that all of your strings are consistent and meaningful?
-   [x] Messy (inconsistent) date formats: Did you format the dates consistently throughout your dataset?
-   [x] Misleading variable labels (columns): Did you name your columns meaningfully?
-   [x] Truncated data: Did you check for truncated or missing data that needs correction?
-   [x] Business Logic: Did you check that the data makes sense given your knowledge of the business?
-   [x] Confirm the business problem
-   [x] Confirm the goal of the project
-   [x] Verify that data can solve the problem and is aligned to the goal

- Have you documented your cleaning process so you can review and share thoseresults?
	> **Yes.**

#### Key tasks

  

- [x] Choose your tools. 

- [x] Transform the data so you can work with it effectively. 

- [x] Check the data for errors. 

- [x] Document the cleaning process.

 
#### Deliverable
Documentation of any cleaning or manipulation of data 

**The html changelog is [here](https://github.com/thoughtthingy/cyclistic_case_study_2025/blob/main/docs/cyclistic_data_cleaning_changelog_20250707_v01.html)**

**The R markdown file is also available [here](https://github.com/thoughtthingy/cyclistic_case_study_2025/blob/main/docs/cyclistic_data_cleaning_changelog_20250707_v01.Rmd)**

### Analyze
___
#### Guiding questions

- How should you organize your data to perform analysis on it?
	> **I should stack both datasets for quarter 1 of 2019 and 2020. My focus is to aggregate the data by usertype.**

- Has your data been properly formatted? 
	> **Yes, I was able to format the data with the following code:**

  
```
#Add columns that list the date, month, day, and year of each ride

#This will allow us to aggregate ride data for each month, day, or year ... before completing these operations we could only aggregate at the ride level

all_trips$date <- as.Date(all_trips$start_date) #The default format is yyyy-mm-dd

all_trips$month <- format(as.Date(all_trips$date), "%m")

all_trips$day <- format(as.Date(all_trips$date), "%d")

all_trips$year <- format(as.Date(all_trips$date), "%Y")

all_trips$day_of_week <- format(as.Date(all_trips$date), "%A")

  ```

> **AND**

  
```
#Convert "tripduration_minutes" from Factor to numeric so we can run calculations on the data

is.factor(all_trips$tripduration_minutes)

all_trips$tripduration_minutes <- as.numeric(as.character(all_trips$tripduration_minutes))

is.numeric(all_trips$tripduration_minutes)

```

- What surprises did you discover in the data?
	> **I found it surprising that the casual users used their bikes for longer rides. I found it equally surprising that members used their bikes for short trips.**

  

- What trends or relationships did you find in the data? 
	> **The casual users are using their bikes for longer  and less frequent trips. This suggests that their usage is more for leisure. The fact that Sunday is when the bikes are most used for casual users supports this. The members, on the other hand, use their bikes more frequently but for shorter trips, suggesting that they use the bikes for commuting to/from work. The data supports this by indicating that weekdays have the most frequent number of rides for members.**


- How will these insights help answer your business questions? 
	> **This directly answers the first business question.**

  

#### Key tasks

  

- [x] Aggregate your data so it’s useful and accessible. 

- [x] Organize and format your data. 

- [x] Perform calculations. 

- [x] Identify trends and relationships. 

  

#### Deliverable

A summary of your analysis

  
#### Analysis in R

```
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
  select(-c(start_lat, start_lng, end_lat, end_lng, birthyear, gender, "tripduration_minutes",  "...1"))

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
write.csv(all_trips_v2, "AllTrips_q1")
```

#### Summary of Analysis
The casual users are using their bikes for longer trips and less frequent trips. Casual users use Cyclistic the most on Sundays. The annual members on the other hand use their bikes more frequently but for shorter and more frequent trips. Annual members use Cyclistic the most during weekdays.



### Share
---

#### Guiding questions

  

- Were you able to answer the question of how annual members and casual riders use Cyclistic bikes differently?
	> **Yes.**

  

- What story does your data tell?
	> **Casual users use bikes for leisure while members use bikes for commuting to/from work.**

  

- How do your findings relate to your original question?
	> **My findings answer the original question directly: How do annual members and casual riders use Cyclistic bikes differently?**

  

- Who is your audience? What is the best way to communicate with them?
	> **My audience will be the executive team. The best way to communicate with them is to simplify the findings without a lot of technical stuff and provide them with what they need to know to make a data-driven decision.**

  

- Can data visualization help you share your findings?
	> **Yes for sure. It will help drive insights and allow them to focus on what the data is telling them they should do.**

  

- Is your presentation accessible to your audience?
	> **Yes. I’ve chosen the color palette so people with color blindness will not have issues using Tableau’s default color scheme for the color blind.**

  

  

#### Key tasks

  

- [x] Determine the best way to share your findings. 

- [x] Create effective data visualizations. 

- [x] Present your findings. 

- [x] Ensure your work is accessible. 

  

#### Deliverable

- Supporting visualizations and key findings


<img width="2754" height="574" alt="image" src="https://github.com/user-attachments/assets/6a7c2921-6f8f-479d-87a7-82973b41a3b7" />

<img width="2754" height="574" alt="image" src="https://github.com/user-attachments/assets/7946d4de-2bcf-44ea-8bf9-5790bb1d47ee" />


<img width="1876" height="1726" alt="image" src="https://github.com/user-attachments/assets/394e4331-258b-4adf-9a97-f683d4888359" />

<img width="1998" height="1598" alt="image" src="https://github.com/user-attachments/assets/9fc55364-84bd-47a7-a162-cea5d174e58c" />




### Act
---

  

#### Guiding questions

  

- What is your final conclusion based on your analysis?
	> **Casual users use their bikes for leisure or exercise. Members use their bikes to commute to and from work.**

  

- How could your team and business apply your insights?
	> **They can use the usage insights to answer the second question on why  casual riders buy Cyclistic annual memberships. The team can also answer the third question on how Cyclistic can use digital media to influence casual riders to become members. This will give the team a target to focus on, which is the fact that casual users use their bikes for leisure.**

  

- What next steps would you or your stakeholders take based on your findings?

 
	> **1. Determine in what ways leisure cycling activities can convert casual users to annual members(savings, marketing, etc)**

  

	> **2. Brainstorm for ways on how digital media can be used to effectively communicate these insights and “conversion points” to casual users**

  

	> **3. Create an overall digital marketing plan that focuses on converting casual users to annual members that leverages the previous two recommendations.**

  

#### Key tasks

  

- [x]  Create your portfolio.

-  [x] Add your case study.

- [x]  Practice presenting your case study to a friend or family member.

  

  

**Deliverable**

  

Your top three recommendations based on your analysis

#### Executive Summary

This recommendation outlines a strategic approach to enhance customer engagement and conversion by leveraging targeted digital advertising. The campaign focuses on three key pillars: highlighting cost savings to convert casual users, targeting Sunday activities for optimal ad placement, and promoting a leisure-focused lifestyle centered on travel, exercise, and family. This strategy aims to resonate with the target audience, drive conversions, and foster brand loyalty.

**1. Highlight Cost Savings to Convert Casual Users**

To transform casual users into loyal customers, the campaign will emphasize the tangible financial benefits of adopting the product or service. By showcasing clear, data-driven savings—such as percentage discounts, reduced costs compared to competitors, or long-term value propositions—the advertising content will appeal to cost-conscious consumers. 

This approach will position the brand as a cost-effective solution, encouraging casual users to commit to a subscription or long-term engagement.

**2. Target Sunday Activities for Digital Advertising**

Sundays represent a prime opportunity for reaching audiences when they are most receptive to leisure-focused messaging. By strategically timing digital ad placements, the campaign will capitalize on consumer behavior during this high-engagement day. 

By aligning ad delivery with Sunday’s relaxed and aspirational mindset, the campaign will maximize engagement and click-through rates.

**3. Promote a Leisure-Focused Lifestyle**

The campaign will sell an aspirational lifestyle centered on travel, exercise, and family, positioning the product or service as an enabler of meaningful experiences. This approach will resonate with consumers seeking balance and fulfillment in their leisure time. 
 
By aligning the brand with a desirable lifestyle, the campaign will foster emotional connections, driving both engagement and long-term loyalty.

#### Conclusion

This case study recommends a multifaceted digital advertising strategy that converts casual users by emphasizing cost savings, targets Sunday activities for maximum impact, and promotes a lifestyle focused on travel, exercise, and family. By using personalized data, well-timed ads, and heartfelt storytelling, the campaign will convert more casual users to being members.

## Limitations

- As of the true time of when this study was created, July 2025, the dataset is no longer current. It is recommended that a study be made with a more recent dataset.
- Seasons and holidays were not accounted for as the datasets were only for quarter 1 of 2019 and 2020. It is recommended that a year-round study be made.

---

[^1]: Case Study by James Kenneth Ines of General Santos City, Philippines finished  on July 24, 2025
