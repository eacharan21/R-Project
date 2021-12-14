#Importing libraries
library(party)
library(dplyr)
library(party)
library(rpart)
library(rattle)
library(readr)
library(devtools)
#importing dataset
p_1 <- read_csv("C:/Users/Pavan/Desktop/postcooperative1.csv")
View(p_1)
p_2<-data.frame(p_1$L_CORED,p_1$L_SURFD,p_1$L_O2D,p_1$L_BPD,
                p_1$SURF_STBLD,p_1$CORE_STBLD,p_1$BP_STBLD,p_1$COMFORT,p_1$`ADM-DECS`) #Filtered Only Dummy Values
colnames(p_2)<-c("L_CORED","L_SURFD","L_O2D","L_BPD","SURF_STBLD",
                 "CORE_STBLD","BP_STBLD","COMFORT","ADM_DECS")
View(p_2)
set.seed(1234)

#CLASSIFICATION TREE
dt=sort(sample(nrow(p_2),nrow(p_2)*.7))
train<-p_2[dt,]
test<-p_2[-dt,]
fit=rpart(ADM_DECS~.,data=train,method = "class")
rpart.plot(fit)
pre=predict(fit,test,type="class")
pre

table(pre,test$ADM_DECS)


#CHI-SQUARE TEST
chisq.test(p_2$L_SURFD, p_2$SURF_STBLD ,correct=FALSE)
chisq.test(p_2$L_O2D, p_2$L_O2D ,correct=FALSE)
