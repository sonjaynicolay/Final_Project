-- Create housing data schema
CREATE TABLE zhvi_data (
	zipcode INT,
	zhvi NUMERIC,
	PRIMARY KEY (zipcode)
);

-- Create income data schema
CREATE TABLE income_data (
	zipcode INT,
	med_income INT,
	PRIMARY KEY (zipcode)
);

-- Create acs data schema
CREATE TABLE acs_data (
	zipcode INT,
	total_pop NUMERIC,
	male NUMERIC,
	female NUMERIC,
	med_age NUMERIC,
	race_w NUMERIC,
	race_aa NUMERIC,
	race_nat NUMERIC,
	race_as NUMERIC,
	race_api NUMERIC,
	race_oth NUMERIC,
	eth_hisp NUMERIC,
	eth_nonhisp NUMERIC,
	PRIMARY KEY (zipcode)
);

-- Create crime data schema
CREATE TABLE crime_data (
	city VARCHAR,
	vio_crime NUMERIC,
	murder_mansl NUMERIC,
	rape NUMERIC,
	robbery NUMERIC,
	agg_assault NUMERIC,
	prop_crime NUMERIC,
	burglary NUMERIC,
	lar_theft NUMERIC,
	car_theft NUMERIC,
	arson NUMERIC,
	PRIMARY KEY (city)
);

-- Create city data schema
CREATE TABLE city_data (
	zipcode INT,
	city VARCHAR,
	PRIMARY KEY (zipcode)
);

-- Create coordinate data schema
CREATE TABLE coord_data (
	city VARCHAR,
	county_name VARCHAR,
	lat NUMERIC,
	long NUMERIC,
	PRIMARY KEY (city)
);