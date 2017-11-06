# A_module11.R
# Assignment for module 11 from Group A
# Korik Vargas, Connor Breton, and Drew Robison
# Github repo https://github.com/robisona/A_module11.git

# Create and save an R script in RStudio with the file name GroupLetter_module11.R.  You will submit this 
# file as this week’s assignment, so be sure to follow good coding practices throughout.  Include your 
# answers to the following questions as labeled comments in the script.

# The data for this week are a subset from Diamond et al. 2012, which examined the effect of elevated 
# temperature on ant distributions on the eastern United States.  The dataset provided includes ant species
# names (Binom), counts of individuals (Abundance), the temperature treatment in degrees Celsius (Delta),
# and a critical thermal maximum in degrees Celsius (CTmax; this essentially indicates lethal temperature).  

# Set your working directory and read in the ants_duke.csv data file.  
setwd("C:\\Users\\Drew\\Documents\\UNH\\Courses\\NR 995 - R\\Modules\\11")

AntsData <- read.table("ants_duke.csv", sep=",", header = T, stringsAsFactors = F)





# (1)	Get to know the data.  For example, how many observations are in the dataset? How many species are in 
# the dataset?  How many unique temperature treatments?  Are there missing data?  Do the values and 
# descriptive statistics of numerical variables make sense with their definitions above? 



  
# (2)	Recall that Delta is a temperature treatment variable.  Categorize the values provided into three
# classes: low (Delta ≤ 4), moderate (Delta > 4 and ≤ 8), and high (Delta > 8).  Be sure that your new 
# temperature treatment variable is a factor.  How many observations fall into each temperature class? 




  
# (3)	You want to know whether the abundance is different for each temperature class.  Run and interpret an
# ANOVA to test the hypothesis that higher temperature reduces ant abundance.  Be sure to check assumptions!






  
# (4)	After running the ANOVA you think about the Delta variable a bit more, and decide to treat it as a 
# numeric variable.  Test the hypothesis that temperature and abundance are positively correlated. Is your 
# interpretation qualitatively different than your interpretation of the ANOVA? 
  



