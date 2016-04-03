# NEI & SCC data 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# All NEI data which corresponds to vehicles
Allvehicle <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
AllvehicleSCC <- SCC[Allvehicle,]$SCC
AllvehicleNEI <- NEI[NEI$SCC %in% AllvehicleSCC,]

# NEI data to Baltimore's fip
BaltimoreVehicles <- AllvehicleNEI[AllvehicleNEI$fips=="24510",]

#Plot
png("plot5.png",width=480,height=480)

ggplot(BaltimoreVehicles,aes(factor(year),Emissions)) +
  geom_bar(stat="identity") +
   labs(x="year", y=expression("Total Emission in Tons"), title=expression("Motor Vehicle Source Emissions in Baltimore from 1999-2008"))

dev.off()