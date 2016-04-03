# NEI & SCC data 
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# All NEI data which corresponds to vehicles
Allvehicle <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
AllvehicleSCC <- SCC[Allvehicle,]$SCC
AllvehicleNEI <- NEI[NEI$SCC %in% AllvehicleSCC,]

# NEI data to Baltimore's fip
BaltimoreVehicles <- AllvehicleNEI[AllvehicleNEI$fips=="24510",]
# NEI data to LA's fip
LAvehicles <- AllvehicleNEI[AllvehicleNEI$fips=="06037",]

#Create one dataset for both 
BaltimoreAndLA <- rbind(BaltimoreVehicles,LAvehicles)
BaltimoreAndLA[BaltimoreAndLA=="24510"]<-"Baltimore"
BaltimoreAndLA[BaltimoreAndLA=="06037"]<-"LA"

#Plot
png("plot6.png",width=800,height=800)

 ggplot(BaltimoreAndLA, aes(x=factor(year), y=Emissions, fill=fips)) +
  geom_bar(aes(fill=year),stat="identity") +
   guides(fill=FALSE) +
  facet_grid(.~fips) +
   labs(x="year", y=expression("Emission") , title=expression("Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))

dev.off()