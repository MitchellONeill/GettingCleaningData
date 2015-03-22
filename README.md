# GettingCleaningData
Repo for the Getting and Cleaning Data course project 
Mitchell O'Neill: March 2015

From the experiment data provided in this repo's "UCI Hara Dataset" folder this project combines 
and simplifies the data so that it can be more readily used for further analysis. The original data
was partitioned into 2 data sets which had 561 variable measures relating to 6 activities completed
by 30 subjects. This project combines all the information for the 2 data sets including the subject 
indicators, the activity indicators and their corresponding statistcal measures. The activity labeles and
statiscal measures are replaced with their discreptive titles. 
 
This complete data set is then subset twice. The first subsets based on the statiscal measures and shows 
only the ones relating to mean and standard deviation. The second subset takes the average of the these
variables across all the observations on a by subject basis. The final dataset includes 81 variables (1 
indicating the subject, 1 which lists the activity, and 79 statiscal measures relating to the first 2) and
180 observations (30 subjects x 6 activities). 

 