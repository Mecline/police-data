#package data.table 

setwd("C:/Users/Maggie/Police")

#################################################################
#PACKAGES
library(ggplot2)
library(dplyr)
#################################################################
#FILES
calls <- read.table(file = "911_Calls_for_Service.csv", sep=",", fill=TRUE, header=TRUE)
smallcall  <- subset(calls, select= -(c(callDateTime, location, callNumber)))
useforce <- read.csv(file="BPD_Officer_Involved_Use_Of_Force.csv", fill=TRUE, header=TRUE)
incident <- read.csv(file="BPD_Part_1_Victim_Based_Crime_Data.csv", fill=TRUE, header=TRUE)
smallinc <- subset(incident, select= -(c(CrimeDate, CrimeTime, Longitude,
                                         Latitude, Total.Incidents)))
cameras <- read.csv(file="CCTV_Locations.csv", fill=TRUE, header=TRUE)
arrests <- read.csv(file="BPD_Arrests.csv", fill=TRUE, header=TRUE)
education <- read.csv(file="Education_and_Youth__2010-2013_.csv", fill=TRUE, header=TRUE)
droped <- education[,c(1,101:104)]
########################### CLOCK ###############################
#START CLOCK
ptm <- proc.time()


#END CLOCK
proc.time() - ptm
###################################A#############################
#ANALYSIS


