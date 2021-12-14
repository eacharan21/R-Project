#Importing Libraries
library(readr)
library(plyr)
library(ggplot2)
library(dplyr)
library(devtools)
library(inspectdf)
#Importing data
pc_1 <- read_csv("C:/Users/Pavan/Desktop/postcooperative.csv")

colnames(pc_1)<-c("L_CORE","L_SURF","L_O2","L_BP","SURF_STBL","CORE_STBL","BP_STBL","COMFORT","ADM_DECS")
View(pc_1)

inspect_types(pc_1)
inspect_cat(pc_1)
inspect_cor(pc_1)

#Bar graph Using the comfort of patients
counts1<-table(pc_1$COMFORT)
barplot(counts1,xlab="No. of Patients",ylab="Comfort of Patient",
     main="Bargraph depending on the Comfort of patient ",
     col=c("springgreen1","sienna3","navajowhite","mistyrose2"),horiz = TRUE)


#Bar graph depending on the Core Temperature
counts2 <- table(pc_1$L_CORE)
barplot(counts2,col=c("salmon","springgreen","cornflowerblue"),
     xlab="Patient's Core temperature",ylab="No.of Patients",
     main = "Patient's Core Temp",horiz = FALSE)


#Bar Plot Depending on the Patient's BP
counts3 <- table(pc_1$L_BP)
barplot(counts3,col=c("lightblue","purple","orange"),main = "Stability of patient's BP", horiz=FALSE)


#plot depending on Surface temp. & surface temp stability
counts4 <- table(pc_1$L_SURF, pc_1$SURF_STBL)
barplot(counts4,main="Plot by L_SURF and SUBL_STBL",
     xlab="Patient's Surface Temperature",
     ylab="Stability Of surface temperature",
     col=c("skyblue","palegoldenrod"))

#CONTINGENCY TABLES FOR CORE TEMP.,SURFACE TEMP. & BP

table(X=pc_1$SURF_STBL,Y=pc_1$L_SURF)
plot(table(X=pc_1$SURF_STBL,Y=pc_1$L_SURF),col=c("gold","tomato","steelblue1"),
     main="Contingency table For Surface Temp Vs Stability In Surface Temp")

table(X=pc_1$CORE_STBL,Y=pc_1$L_CORE)
plot(table(X=pc_1$CORE_STBL,Y=pc_1$L_CORE),col=c("orchid3","aquamarine","khaki1"),
     main="Contingency table For Surface Temp Vs Stability In Surface Temp")

table(X=pc_1$BP_STBL,Y=pc_1$L_BP)
plot(table(X=pc_1$BP_STBL,Y=pc_1$L_BP),col=c("bisque","plum1","peru"),
     main="Contingency table For Surface Temp Vs Stability In Surface Temp")

