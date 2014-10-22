# Q6
# Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#get indice for pollution with motor vehicle sources
Vehicleind <- SCC[grep("vehicle", SCC$EI.Sector, ignore.case=T), "SCC"]
NEIinBaltimore<- subset(NEI, select= c("SCC", "Emissions", "year"), fips == "24510")
EmissionBaltimore_Vehicle <- subset(NEIinBaltimore, select= c("Emissions", "year"), SCC %in% Vehicleind)
TotEmissionBaltimore_Vehicle <- aggregate(Emissions ~ year, FUN ="sum", data=EmissionBaltimore_Vehicle)

NEIinLA<- subset(NEI, select= c("SCC", "Emissions", "year"), fips == "06037")
EmissionLA_Vehicle <- subset(NEIinLA, select= c("Emissions", "year"), SCC %in% Vehicleind)
TotEmissionLA_Vehicle <- aggregate(Emissions ~ year, FUN ="sum", data=EmissionLA_Vehicle)

TotEmissionBaltimore <-TotEmissionBaltimore_Vehicle
TotEmissionBaltimore$city <- rep("Baltimore", each=4)
TotEmissionBaltimore$change <-TotEmissionBaltimore$Emissions-TotEmissionBaltimore$Emissions[1]

TotEmissionLA <-TotEmissionLA_Vehicle
TotEmissionLA$city <- rep("LA", each=4)
TotEmissionLA$change <-TotEmissionLA$Emissions-TotEmissionLA$Emissions[1]

TotEmission<- rbind.data.frame(TotEmissionBaltimore,TotEmissionLA)


png(filename="plot6.png", height=480, width=480)
qplot(x=year, y=change, data=TotEmission, color= city, xlab="year", ylab="Emission Change", main="Comparison of Emission change between Baltimore City and LA City")
dev.off()
