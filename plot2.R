# Q2
# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

NEIinBaltimore<- subset(NEI, select= c("fips", "SCC", "Pollutant", "Emissions",  "type", "year"), fips == 24510)
TotEmissioninBaltimore <- tapply(NEIinBaltimore[,"Emissions"], NEIinBaltimore[,"year"], sum)

png(filename="plot2.png",width=480,height=480)
plot(unique(NEIinBaltimore[,"year"]), TotEmissioninBaltimore, xlab= "year", ylab="Total Emissions of PM2.5 in Baltimore city in 1999-2008", main="Total Emissions of PM2.5 (tons) in Baltimore city")
dev.off()
