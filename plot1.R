# Have total emissions from PM2.5 decreased in the United States from 1999 
# to 2008? Using the base plotting system, make a plot showing the total 
# PM2.5 emission from all sources for each of the years 1999, 2002, 2005, 
# and 2008.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

tidydata<-aggregate(Emissions ~ year,data = NEI,FUN=sum)
tidydata$EmissionsDivided<-tidydata$Emissions / 1000

with(tidydata, plot(year, EmissionsDivided, type="l", ylab=expression('PM'[2.5]*' emission from all sources (in 1000 tons)'), xlab="year"))