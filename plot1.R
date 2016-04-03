#Download and unzip zip file
#url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
#f <- file.path(getwd(), "NEI_data.zip")
#download.file(url, f)
#unzip(f, exdir=getwd())

# Load the NEI & SCC data frames.
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# total emissions by year
Total <- aggregate(Emissions ~ year,NEI, sum)

png("plot1.png",width=480,height=480)

barplot(
  (Total$Emissions/1000000),
  names.arg=Total$year,
  xlab="Year",
  ylab="PM2.5 Emissions in Megatons",
  main="Total PM2.5 Emissions in US"
)

dev.off()