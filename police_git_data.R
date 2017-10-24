#package data.table 

setwd("C:/Users/Maggie/Police")

#################################################################
#PACKAGES
library(ggplot2)
library(cowplot)
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
########################### CLOCK ###############################
#START CLOCK
ptm <- proc.time()


#END CLOCK
proc.time() - ptm
###################################A#############################
#ANALYSIS

nullie <- NULL
for (i in nrow:newdrop){
  
  j <- cbind(newdrop, (sub("%", "", newdrop[,i])))
  nullie <- cbind(nullie, j)
  
}

#Education all in lowercase
droped <- education[,c(1,101:108)]
region <- as.factor(as.character(tolower(droped$Neighborhood)))
newdrop <- cbind(region, droped)
newdrop <- subset(newdrop, select = -c(Neighborhood))

###
nullie <- NULL
for (i in 2:9) {

  j <- as.numeric(as.character((sub("%", "", newdrop[,i]))))
    nullie <- cbind(nullie, j) 
    

}
###

row.names(nullie) <- row.names(newdrop)
colnames(nullie) <- colnames(newdrop[,2:9])

finaldrop <- cbind(region, nullie)

finaldrop <- as.data.frame(finaldrop)



#Neighborhood all in lowercase
arr <-  subset(arrests, select= c(Neighborhood, ArrestDate, Age, Sex))

neighborhood <- as.factor(tolower(arr$Neighborhood))
newarr <- cbind(neighborhood, arr)
newarr <- subset(newarr, select = -Neighborhood)


ggplot (data=finaldrop)+geom_point(mapping=aes(x=region,y=drop10),
                                 color= ifelse((finaldrop$drop10>5), "red", "black"),
                                 shape = ifelse((finaldrop$drop10>5), 20, 1),
                                 size = ifelse((finaldrop$drop10>5), 3, 1.5))


####################################### EXCESS CODE


