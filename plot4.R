#Download and unzip zip file
#url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
#f <- file.path(getwd(), "NEI_data.zip")
#download.file(url, f)
#unzip(f, exdir=getwd())

#NEI data
NEI <- readRDS("summarySCC_PM25.rds")
#SCC data
SCC <- readRDS("Source_Classification_Code.rds")

# coal combustion related NEI data
comb <- grepl("comb", SCC$SCC.Level.One, ignore.case=TRUE)
coal <- grepl("coal", SCC$SCC.Level.Four, ignore.case=TRUE) 
coalComb <- (comb & coal)
combSCC <- SCC[coalComb,]$SCC
combNEI <- NEI[NEI$SCC %in% combSCC,]

png("plot4.png",width=480,height=480)

ggplot(combNEI,aes(factor(year),Emissions/100000)) +
  geom_bar(stat="identity") +
  labs(x="year", y=expression("Total Emission")) + 
  labs(title=expression("Coal Combustion Source Emissions Across US from 1999-2008"))

dev.off()
