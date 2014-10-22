# Q5
# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#get indice for pollution with motor vehicle sources
Vehicleind <- SCC[grep("vehicle", SCC$EI.Sector, ignore.case=T), "SCC"]
NEIinBaltimore<- subset(NEI, select= c("SCC", "Emissions", "year"), fips == 24510)
Emission_Vehicle <- subset(NEIinBaltimore, select= c("Emissions", "year"), SCC %in% Vehicleind)
TotEmission_Vehicle <- aggregate(Emissions ~ year, FUN ="sum", data=Emission_Vehicle)

png(filename="plot5.png", height=480, width=480)
qplot(year, Emissions, data=TotEmission_Vehicle, main="Total Emissions of PM2.5 (tons) from motor vehicle sources in Baltimore City")
dev.off()
