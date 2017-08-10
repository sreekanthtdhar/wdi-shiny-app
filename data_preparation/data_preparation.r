
#http://databank.worldbank.org/data/reports.aspx?Code=SP.POP.TOTL&id=1ff4a498&report_name=Popular-Indicators&populartype=series&ispopular=y#


setwd("C://Data Science/world/")
data=read.csv("Data.csv",header = T,na.strings = "..")
View(data)
data<-data[c(1:11718),]

str(data)

library(reshape2)

names(data)[1:4]

new_data<-melt(data,id.vars = names(data)[1:4])

View(new_data)
new_data<-new_data[c(1,3,5,6)]
melt(new_data,id.vars = names(new_data[2:4]))
names(new_data)<-c("Parameter","Country","Year","Value")
final_data<-dcast(new_data,formula = Country+Year~Parameter,value.var = "Value")
final_data$Year<-substr(final_data$Year,start = 2,stop = 5)
View(final_data)

final_data$Year<-as.numeric(final_data$Year)

library(googleVis)
MyState<-'
{
  "colorOption":"_UNIQUE_COLOR"
}'
g<-gvisMotionChart(final_data,idvar="Country",timevar="Year")
plot(g)


write.csv(final_data,"wdi.csv")
