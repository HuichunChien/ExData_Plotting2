# Final project for EDA
# read data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Q1
# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
TotEmission <- tapply(NEI[,"Emissions"], NEI[,"year"], sum)

png(filename="plot1.png",width=480,height=480)
plot(unique(NEI[,"year"]), TotEmission, xlab= "year", ylab="Total Emissions of PM2.5 from all sources in 1999-2008", main="Total Emissions of PM2.5 (tons)")
dev.off()