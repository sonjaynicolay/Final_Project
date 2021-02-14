![Title Image](resources/title_image.jpg)

## Using supervised learning to determine the primary socio-economic factors that effect home prices in Illinois
---


### The Basis of our Analysis
***

#### Our Problem
Our real estate agency, The S.O.D.O. Agency, is currently looking to purchase investment properties in multiple Illinois counties. Grateful for a stable housing market during the pandemic, we want to continue to maximize our profits and purchase homes where home values are the highest and will more likely give us the best R.O.I. To help us make an informed decision, we want to evaluate the neighborhood's effect on house prices in each county/zip code.

#### Description of the Data Sources
- Zillow (zillow.com)

  Our housing market dataset, which is broken down by city/zip code was found on zillow.com. Zillow is an online real estate marketplace founded in 2006 and created by two       former microsoft executives Rich Barton and Lloyd Frink.
  
- US Census (census.gov)

  The United States Census Bureau is a agency of the U.S. Federal Statistical System. They are primarily responsible for producing data about Americans and the American           economy. We chose data from the Census Bureau because it will allow us to look at economic factors such as income, as well as race and gender.
  
- Department of Justice FBI (ucr.fbi.gov)

  The Federal Bureau of Investigations also known as the FBI. The FBI is the U.S.'s principal federal law enforcement agency. Their data will allow us to look the crime rate in cities across Illinois. 
  
- OpenDataSoft (https://public.opendatasoft.com/)

  Similar to kaggle.com, OpenDataSoft is a platform with a selection of wide ranging datasets. Their platform offered us datasets that showed the longitude and latitude by cities in the United States (to better help with our visualizations) as well as a dataset that broken down the cities associated with zipcode (to better merge for our final table).
  
  
  
#### Communication Protocols
To most effectively achieve our agency goals in a timely manner. We plan to establish a project timeline that will allow us to review and triple check our work before our deadline. We also will utilize class time and schedule an additional day during the week to meet and make sure we are all on one accord. If necessary, we will attend office hours to sort out any issues we may run into that week. In between we will maintain communication and follow-up with each other via Slack messaging. 
Each member of the agency has created an individual work branch that is attached to the main branch of our project repository. We all will review pushes from individual branches in GitHub to the main branch to ensure we present an error-proof analysis.



### Tools to Build our Models 
***

#### Machine Learning
To begin, our data will be cleaned using PySpark, data will be stored in AWS database, and a PostgresSQL server will be used to house tables for the data. To build our machine learning model we will use a supervised machine learning and utilize the scikit-learn library for the Python programming language. Scikit-learn features various algorithms that will help us predict housing prices. See requirements.txt for packages and versions.

#### Visualization 
To transform our data into a visual presentation we will use Tableau. Tableau is user friendly as well as viewer friendly. It will allow us to create visual breakdowns that explain the data found over the course of our analysis. 

### Data Exploration
***
While our concept of determining how housing prices may be impacted by various demographic and crime data initially seemed simple, as we began to consider visualizations we had to change our strategy on how best to approach the data.

We had initially hoped to view the data by zipcode, but ultimately determined organizing the data by city was necessary. In addition to offering better visualizations, the crime data we hoped to include was only organized by city. Another challenge was how best to visualize the data. Once we determined we wanted to include maps, the need to include the longitude and latitude for each city became evident.

As a result of these shifts, our initial plan to merge income data ([MedianIncome_Zip.csv](https://github.com/sonjaynicolay/Final_Project/blob/liviblocker/raw_data/MedianIncome_Zip.csv)), demographic census data ([acs_data.csv](https://github.com/sonjaynicolay/Final_Project/blob/liviblocker/raw_data/acs_data.csv)), crime data ([crime_data.csv](https://github.com/sonjaynicolay/Final_Project/blob/liviblocker/raw_data/crime_data.csv)), and housing data ([zhvi_2018.csv](https://github.com/sonjaynicolay/Final_Project/blob/liviblocker/raw_data/zhvi_2018.csv)) suddenly included the need to add datasets that showed zipcode by city ([zipcode_to_city.csv](https://github.com/sonjaynicolay/Final_Project/blob/liviblocker/raw_data/zipcode_to_city.csv)) and the longitude and latitude of each city ([city_long_lat.csv](https://github.com/sonjaynicolay/Final_Project/blob/liviblocker/raw_data/city_long_lat.csv)).

As we began analysis, we also determined that it was necessary to drop various columns that were not serving our analysis. The crime data includes vio_crime and prop_crime which are actually aggregates of other crimes listed in the dataset (e.g. murder and aggrevated assault for violent crimes, and arson and robbery for property crimes). We ultimately decided to drop the aggregated vio_crime and prop_crime data points.

As we continued to refine our finalized dataset, we also made the decision to turn all null values in the crime dataset to zero. While there is a difference between cities that had, for example, no incidents of arson in 2018 vs. cities that simply did not report incidents of arson in 2018, we determined that the difference was likely negligible and that if the frequency of a particular offense were significant in a particular city it would have been reported.

#### Navigating the Joins
Due to the complexity of the joins and merges of our 6 distinct datasets - this section is to help navigate the process. In the [data_merging](https://github.com/sonjaynicolay/Final_Project/tree/liviblocker/data_merging) folder, you can find 4 folder and an ERD image. To follow the process of merging I recommend viewing the files in the following order:
1. [schemas.sql](https://github.com/sonjaynicolay/Final_Project/blob/liviblocker/data_merging/schemas.sql) shows the development of schemas in PGAdmin into which the raw data will be input.
2. [AWS_to_PGAdmin](https://github.com/sonjaynicolay/Final_Project/blob/liviblocker/data_merging/AWS_to_PGAdmin.ipynb) shows the process of bringing the raw data files from AWS, initial cleaning, and the upload into PGAdmin.
3. [queries.sql](https://github.com/sonjaynicolay/Final_Project/blob/liviblocker/data_merging/queries.sql) shows the initial merges of the demographic and housing data.
4. Finally, [Development_of_FinalTable.ipynb](https://github.com/sonjaynicolay/Final_Project/blob/liviblocker/data_merging/Development_of_FinalTable.ipynb) pulls data from PGAdmin back into a Colab file, aggregates the zipcodes by city, and merges the newly aggregated table with the crime data and coordinate data.

Below you can see the ERD that breaks down the merges:

<p align="center">
  <img src="https://github.com/sonjaynicolay/Final_Project/blob/liviblocker/data_merging/ERD.png" width="600" />
</p>

### Data Analysis

#### Description of how data was split into training and testing sets 
We decided not to split the dataset into training and testing sets because KNeighborsRegressor does not require training steps.
#### Explanation of model choice, including limitations and benefits 
We decided to choose KNeighborsRegressor because of the following reasons:
-	It gives the highest R-square value compare to other algorithms. 
-	It does not require training steps. KNeighborsRegressor does not explicitly build any model. It merely tags the new data entry-based learning from historical data. The new data entry would be tagged with the majority class in the nearest neighbor.
-	KNeighborsRegressor might take some time while selecting the first hyperparameter, but after that rest of the parameters are aligned to it.
However, the following limitations are associated with it :
-	KNeighborsRegressor works well with the small number of input variables, but as the numbers of variables grow, the KNeighborsRegressor algorithm struggles to predict the output of a new data point.
-	KNeighborsRegressor is very sensitive to outliers as it simply chose the neighbors based on distance criteria.
-	KNeighborsRegressor inherently has no capability of dealing with missing value problems.

***

