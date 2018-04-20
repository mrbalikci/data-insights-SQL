# Real World Data Insights with SQL

This data from an online hospitality company that provides rental vacation places around the world over 190 countries. 

There are two sites in this data. Site A and Site B
Queries for the following questions: 

1. What is booking and inquiry conversions for each site? How do they compare over years? How do they compare between owner types? How does it compare to supplier type?

2. What is cancellation rate for each site? How do they compare over years? How do they compare between owner types? How does it compare to supplier type?

3. What is the take rate for each site? How do they compare between owner types? How does it compare to supplier type?

# About The Data
In .xlsx format
The length of data is 7728

Columns: Site, Month of Date Id, Day of Date Id, Year of Date Id, Measure Names, Person Type, Supplier Type, Measure Values

Measure Names:
Gross Booking Value, 
Inquiries, 
Property Detail Page Views, 
Total Cancellations, 
Total Gross Bookings, 
Total Net Bookings, 
Transactional Sales

Site: Site A and Site B
Year of Date Id: 2016 and 2017

Person Type: FRBO, PM
Supplier Type: Platform and Integrated

# Glossary
* Property Detail Page Views - Page View of a Property, a measure of traveler demand
* Total Net Bookings - Bookings net of cancellations
* Total Gross Bookings - Total Bookings Including Cancellations
* Inquiries - Traveler message to an owner
* Gross Booking Value - Total value of a booking
* Transactional Sales - Sales generated by an individual booking
* FRBO - For Rent By Owner, generally refers to a property managed by the owner
* PM - Property Manager - a company that markets and manages the properties for many owners
* Platform - Properties that use our site tools to manage their property - mostly FBOs but also includes some smaller PMs
* Integrated - Larger PMs that connect with our sites through their own property management software
* Take Rate - Comparison of transactional sales to gross booking value (transactional sales/gross booking value)

# The Case 
This real-world data is looking for 3 answers: 
* What do you think we could do to move travelers from inquiries to bookings?
* How could we try to decrease the cancellation rate?
* How could we go about increasing take rate percentage along with any potential risks to doing so?

# Findings 
1. More travelers need to be moved from Platform to Integrated to decrease the cancellation rate
2. It seems property management companies leave higher take rate than the individual. Tools working for PM could be helpful in order to increase the take rate. 

![alt text](https://github.com/mrbalikci/data-insights-Python/blob/master/pandas.gif)

# Tools Used 
* Python
* Pandas
* Matplotlib

