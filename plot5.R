# How have emissions from motor vehicle sources changed from 1999–2008 in 
# Baltimore City?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

vehiclebasedscc<-SCC[c(grep("Veh", SCC$Short.Name)),]

tidydata<-NEI[NEI$SCC %in% vehiclebasedscc$SCC,]
tidydata2<-aggregate(Emissions ~ year + fips,data = tidydata,FUN=sum)
wanteddata<-tidydata2[tidydata2$fips == "24510",]

png("plot5.png")

with(wanteddata, plot(year, Emissions, type="l", ylab=expression('PM'[2.5]*' emission from Motor Vehicle Sources (in tons) in Baltimore City'), xlab="year"))

dev.off()

