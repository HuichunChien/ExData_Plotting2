# Q3
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEIinBaltimore<- subset(NEI, select= c("Emissions",  "type", "year"), fips == 24510)
NEIinBaltimore<- data.frame(NEIinBaltimore)

NEIinBaltimore_point<- subset(NEIinBaltimore, select= c("type","Emissions", "year"), type == "POINT")
NEIinBaltimore_nonpoint<- subset(NEIinBaltimore, select= c("type","Emissions", "year"), type == "NONPOINT")
NEIinBaltimore_onroad<- subset(NEIinBaltimore, select= c("type","Emissions", "year"), type == "ON-ROAD")
NEIinBaltimore_nonroad<- subset(NEIinBaltimore, select= c("type","Emissions", "year"), type == "NON-ROAD")

TotEmissioninBaltimore <- aggregate(Emissions ~ type + year, FUN = "sum", data= NEIinBaltimore)

install.packages("ggplot2")
library(ggplot2)

png(filename="plot3.png",width=480,height=480)
qplot(x=year, y=Emissions, data=TotEmissioninBaltimore, colour=type , main="Total Emissions of PM2.5 (tons) with various types in Baltimore city")
dev.off()
