# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999–2008?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coalbasedscc<-SCC[c(grep("[Cc][Oo][Aa][Ll]", SCC$Short.Name)),]
tidydata<-NEI[NEI$SCC %in% coalbasedscc$SCC,]
wanteddata<-aggregate(Emissions ~ year,data = tidydata,FUN=sum)
wanteddata$EmissionsDivided<-wanteddata$Emissions/1000

with(wanteddata, plot(year, EmissionsDivided, type="l", ylab=expression('PM'[2.5]*' emission from coal sources (in 1000 tons)'), xlab="year"))

