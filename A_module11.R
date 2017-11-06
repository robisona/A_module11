# A_module11.R
# Assignment for module 11 from Group A
# Korik Vargas, Connor Breton, and Drew Robison
# Github repo https://github.com/robisona/A_module11.git

##############################################################################################################
# Create and save an R script in RStudio with the file name GroupLetter_module11.R.  You will submit this 
# file as this week’s assignment, so be sure to follow good coding practices throughout.  Include your 
# answers to the following questions as labeled comments in the script.

# The data for this week are a subset from Diamond et al. 2012, which examined the effect of elevated 
# temperature on ant distributions on the eastern United States.  The dataset provided includes ant species
# names (Binom), counts of individuals (Abundance), the temperature treatment in degrees Celsius (Delta),
# and a critical thermal maximum in degrees Celsius (CTmax; this essentially indicates lethal temperature).  


##############################################################################################################
# Set your working directory and read in the ants_duke.csv data file.  
setwd("C:\\Users\\Drew\\Documents\\UNH\\Courses\\NR 995 - R\\Modules\\11")

AntsData <- read.table("ants_duke.csv", sep=",", header = T, stringsAsFactors = F)


##############################################################################################################
# (1)	Get to know the data.  For example, how many observations are in the dataset? How many species are in 
# the dataset?  How many unique temperature treatments?  Are there missing data?  Do the values and 
# descriptive statistics of numerical variables make sense with their definitions above? 

summary(AntsData)               
str(AntsData)                   # There are 54 obsevations and 4 variables
length(unique(AntsData$Binom))  # There are 5 species
length(unique(AntsData$Delta))  # There are 12 temperature treatments
sum(is.na(AntsData))            # There is no missing data



##############################################################################################################
# (2)	Recall that Delta is a temperature treatment variable.  Categorize the values provided into three
# classes: low (Delta ≤ 4), moderate (Delta > 4 and ≤ 8), and high (Delta > 8).  Be sure that your new 
# temperature treatment variable is a factor.  How many observations fall into each temperature class? 

# Assign Temperature treatment as a character class based on the range of Delta
AntsData$TempTreat[AntsData$Delta <= 4] <- "Low"
AntsData$TempTreat[AntsData$Delta > 4 & AntsData$Delta <= 8] <- "Moderate"
AntsData$TempTreat[AntsData$Delta > 8] <- "High"

# Convert character vector to factor
AntsData$TempTreat <- as.factor(AntsData$TempTreat)

# Find how many observations fall into each temperature class
summary(AntsData$TempTreat)   # There are 18 observations in each temperature class


##############################################################################################################
# (3)	You want to know whether the abundance is different for each temperature class.  Run and interpret an
# ANOVA to test the hypothesis that higher temperature reduces ant abundance.  Be sure to check assumptions!


# Run ANOVA determining is the abundance is similar among temperature calsses?
Ants.AOV <- aov(AntsData$Abundance ~ AntsData$TempTreat)
Ants.AOV
summary(Ants.AOV)

# Perform Tukey Honestly Significant Difference (HSD)
TukeyHSD(Ants.AOV)

# Plots pairwise mean differences in response variable with 95% CI
plot(TukeyHSD(Ants.AOV))


# Test assumptions:
# Load "car" package
library(car)


# Perform the  Levene test
leveneTest(AntsData$Abundance ~ AntsData$TempTreat) # p > 0.05, so no problem here


# Perform the Bartlett test
bartlett.test(AntsData$Abundance ~ AntsData$TempTreat) # p > 0.05, so no problem here


# Check normality of residuals visually
## focus on first two plots for examining normality assumption
## want even scatter in residual values among fitted values (flat line) on first plot
## Normal q-q plots compares residuals (y) to a theoretical distribution (normal, on x), want points on line
par(mfrow = c(2,2))
plot(Ants.AOV)
# Maybe some problems here....?


# Finally, perform the Shapiro test for normality of residuals
shapiro.test(Ants.AOV$residuals)  
# p < 0.05, so there is a problem. Our system is non-normal, and thus we should re-think using an ANOVA on
# the data.


##############################################################################################################
# (4)	After running the ANOVA you think about the Delta variable a bit more, and decide to treat it as a 
# numeric variable.  Test the hypothesis that temperature and abundance are positively correlated. Is your 
# interpretation qualitatively different than your interpretation of the ANOVA? 
  










