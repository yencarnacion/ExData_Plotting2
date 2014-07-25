# Across the United States, how have emissions from coal combustion-related 
# sources changed from 1999–2008?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coalbasedcombscc<-SCC[intersect(grep("Comb", SCC$Short.Name, value=FALSE),grep("Coal", SCC$Short.Name, value=FALSE)),]

tidydata<-NEI[NEI$SCC %in% coalbasedcombscc$SCC,]
wanteddata<-aggregate(Emissions ~ year,data = tidydata,FUN=sum)
wanteddata$EmissionsDivided<-wanteddata$Emissions/1000

png('plot4.png')

with(wanteddata, plot(year, EmissionsDivided, type="l", ylab=expression('PM'[2.5]*' emission from coal combustions-related sources (in 1000 tons)'), xlab="year"))

dev.off()