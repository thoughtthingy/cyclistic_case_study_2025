# Google Data Analytics Capstone: Cyclistic Case Study


## Introduction and Background

In this case study, I will act as a junior data analyst for Cyclistic, a fictional bike-share company based in Chicago, using Google Sheets, R, and Tableau Public. I will conduct descriptive data analysis to address the key question: How do annual members and casual riders differ in their use of Cyclistic bikes? Upon completing the analysis, I will deliver an executive summary with actionable insights for the executive team.

### Source Files

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
    
    > **The dataset is located both in my computer and stored in Google Drive.**
    
-   How is the data organized?
    
    > **The two datasets are both in wide format**

- Are there issues with bias or credibility in this data? Does your data ROCCC?

	> **1. Reliability - This data is reliable. It has been preprocessed to exclude the possibility of sampling bias by removing trips that are taken by the staff and trips that are less than 60 seconds in length(potentially false starts or users trying to re-dock the bike).**

	> **2. Originality -  This data is a first party data as per checking [https://divvybikes-marketing-staging.lyft.net/system-data](https://divvybikes-marketing-staging.lyft.net/system-data)**

	> **3. Comprehensiveness - This data is comprehensive as it includes fields for trip duration, the time the biker started, the time the biker ended, and user type to be able to answer the question on the business task: how do annual members and casual riders use Cyclistic bikes differently?).**

	> **4. Currency - The scenario of the case study  assumes that I went back in time in April 1, 2020 to analyze this data to help stakeholders decide on a “future” marketing program. For this purpose I would consider this data as current.**

	> **5. Citation - The data is frequently cited and used online.**
    
  
- How are you addressing licensing, privacy, security, and accessibility?

  

	> **1. Licensing - I have read the license agreement at [https://divvybikes.com/data-license-agreement](https://divvybikes.com/data-license-agreement) and I see no potential misuse of the data in my analysis, nor do I see myself violating the license agreement in any way.**

2. Privacy - The trips has been anonymized. I will also use data aggregation to anonymize the individual data points involved.

3. Security - There would be duplicate files for those accessing the data. I would be the owner and they can request edit access to the sheets.

4. Access - Improved access and usability by adopting a naming convention for files. 

CyclisticTrips2019_q1_20250704_v01 includes a descriptive name for the data, the date of the file creation, and the version number of the file. I also employed chronological foldering.

  

- How did you verify the data’s integrity?

  

On CyclisticTrips2020_q1_20250704_v01 table:

  

1. Filtered all columns to check for missing or null values and nonsensical values(completeness and accuracy)

2. Sorted columns start_station_id, end_station_id, start_lat, start_lng, end_lat, and end_lng both in descending and ascending orders to check for outliers in the data and help see more inconsistencies with the formatting(accuracy and consistency)

3. Logged  all issues to issues log

  

  

  

  

  

- How does it help you answer your question? I need the trip duration data trend of casual riders and annual members.

  

- Are there any problems with the data? Yes there are some issues like the column names are not consistent or the fact that I have to assess the missing values and inconsistent formats. Other than that, the data is pertinent and should be usable after cleaning.

#### Key tasks

- [x] Download data and store it appropriately
- [x] Identify how it’s organized
- [x] Sort and filter the data
- [x] Determine the credibility of the data

#### Deliverable

-   A description of all data sources used

#### Data Source Description
- I am using the Divvy bikeshare data from both the first quarter of 2019 and 2020 that can be found at [https://divvybikes-marketing-staging.lyft.net/system-data](https://divvybikes-marketing-staging.lyft.net/system-data).  The data is stored via Google Drive and there are 2 csv files I would be working with. The license agreement found at [https://divvybikes.com/data-license-agreement](https://divvybikes.com/data-license-agreement) allows me to access, reproduce, analyze, copy, modify, distribute in your product or service and use the Data for any lawful purpose. I have accessed that the dataset is reliable, original, comprehensive, current(for the purpose of this case study), and cited. I have checked the dataset’s data integrity and it is something I can work with. This dataset is pertinent will help me answer the question on the business task: Determine how casual riders and annual members use Cyclistic bikes differently to help inform Cyclistic marketing strategies convert casual riders to annual members. For the purposes of this case study, I have rebranded this real-world dataset to the fictional Cyclistic bike share data of the scenario I am tackling.

### Process

### Analyze

### Share

### Act

## Limitations

