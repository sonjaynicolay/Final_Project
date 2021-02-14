-- Joining income data and acs data into census_data table
SELECT acs.zipcode, med_income, total_pop, male, female, med_age, race_w, race_aa, race_nat, race_as, race_api, race_oth, eth_hisp, eth_nonhisp
INTO census_data
FROM acs_data as acs
LEFT JOIN income_data as i ON acs.zipcode = i.zipcode;

-- Joining housing data and new census_data table into census_housing_data
SELECT ce.zipcode, med_income, zhvi, total_pop, male, female, med_age, race_w, race_aa, race_nat, race_as, race_api, race_oth, eth_hisp, eth_nonhisp
INTO census_housing_data
FROM census_data as ce
LEFT JOIN zhvi_data as z ON ce.zipcode = z.zipcode;