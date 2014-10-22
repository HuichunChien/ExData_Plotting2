# Q4
# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# get Coal related pullutant source
Coalsource <- SCC[grep("coal", SCC$Short.Name, ignore.case=T), "SCC"]
Emission_Coal <- subset(NEI, select= c("Emissions", "year"), SCC %in% Coalsource)
TotEmission_Coal <- aggregate(Emissions ~ year, FUN ="sum", data=Emission_Coal)

png(filename="plot4.png", height=480, width=480)
qplot(year, Emissions, data=TotEmission_Coal, main="Total Emissions of PM2.5 (tons) with coal-related sources across the United States")
dev.off()
