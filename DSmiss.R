library(readr)
library(plyr)
library(aqp)
library(ggplot2)
library(soilDB)

pc<- read_csv("C:/Users/Pavan/Desktop/postcooperative.csv")
colnames(pc)<-c("L_CORE","L_SURF","L_O2","L_BP","SURF_STBL","CORE_STBL","BP_STBL","COMFORT","ADM_DECS")
View(pc)

sapply(pc,function(pc) sum(is.na(pc)))
colSums(is.na(pc))

f=function(pc){
  if(class(pc)=="numeric"){
    pc<-as.numeric(as.character(pc))
    pc[is.na(pc)]=median(pc,na.rm = TRUE)
  }else{
    
  }
return(pc)
}

pc_changed<-sapply(pc,f)
View(pc_changed)
colSums(is.na(pc_changed))
