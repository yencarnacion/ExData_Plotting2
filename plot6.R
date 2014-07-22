# Compare emissions from motor vehicle sources in Baltimore City with 
# emissions from motor vehicle sources in Los Angeles County, California 
# (fips == "06037"). Which city has seen greater changes over time in motor 
# vehicle emissions?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

vehiclebasedscc<-SCC[c(grep("Veh", SCC$Short.Name)),]

tidydata<-NEI[NEI$SCC %in% vehiclebasedscc$SCC,]
tidydata2<-aggregate(Emissions ~ year + fips,data = tidydata,FUN=sum)
baltimorecitydata<-tidydata2[tidydata2$fips == "24510",]
losangelesdata<-tidydata2[tidydata2$fips == "06037",]
wanteddata<-rbind(baltimorecitydata,losangelesdata)
wanteddata$fips<-factor(wanteddata$fips, levels=c("24510","06037"), labels=c("Baltimore City", "Los Angeles"))

qplot(year,Emissions, data=wanteddata,geom="line",color=fips, ylab="Emissions (in tons)")


