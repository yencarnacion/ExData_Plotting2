# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland 
# (fips == "24510") from 1999 to 2008? Use the base plotting system to make 
# a plot answering this question.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

tidydata<-aggregate(Emissions ~ year + fips,data = NEI,FUN=sum)
wanteddata<-tidydata[tidydata$fips == "24510",]

with(wanteddata, plot(year, Emissions, type="l", ylab=expression('PM'[2.5]*' emission from all sources (in tons) in Baltimore City'), xlab="year"))