#Download and unzip zip file
#url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
#f <- file.path(getwd(), "NEI_data.zip")
#download.file(url, f)
#unzip(f, exdir=getwd())

# NEI data.
NEI <- readRDS("summarySCC_PM25.rds")

#  Create Data for baltimore
BaltimoreCity <- subset(NEI, fips == "24510")
# Agregate data for Baltimore
Total <- aggregate(BaltimoreCity[c("Emissions")], list(year = BaltimoreCity$year), sum)

#  Create Plot
png('plot2.png', width=480, height=480)
barplot( Total$Emissions,  names.arg=Total$year,
     main = "Total Emissions from PM2.5 in Baltimore City",
     xlab = "Year", ylab = "Emissions")
dev.off()