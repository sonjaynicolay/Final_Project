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

As a result of these shifts, our initial plan to merge income data (income_data), demographic census data (acs_data), crime data (crime_data), and housing data (zhvi_data) suddenly included the need to add datasets that showed zipcode by city (city_data) and the longitude and latitude of each city (coord_data).

As we began digging into the data we had to make decisions around what variables we wanted to keep for our final analysis. Due to the complexity of our data

#### Navigating 

### Data Analysis
***

