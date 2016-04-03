#Download and unzip zip file
#url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
#f <- file.path(getwd(), "NEI_data.zip")
#download.file(url, f)
#unzip(f, exdir=getwd())
#NEI data frame.
NEI <- readRDS("summarySCC_PM25.rds")

# Baltimore's data only.
baltimore <- NEI[NEI$fips=="24510",]

#plot size
png("plot3.png",width=800,height=800)

#ggplot
ggplot(baltimore,aes(factor(year),Emissions,fill=type)) +
  geom_bar(stat="identity") +
  facet_grid(.~type) + 
  labs(x="year", y=expression("Total PM"[2.5]*" Emission ") , title=expression("PM"[2.5]*" Emissions, Baltimore City 1999-2008 by Source Type"))
 

dev.off()