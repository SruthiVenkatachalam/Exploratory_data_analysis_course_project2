NEI <- readRDS("summarySCC_PM25.rds")
library(dplyr)
NEIdp <- tbl_df(NEI)
# table with emissions per year of Baltimore
BaltimoraEmissionsForYear = summarize(group_by(filter(NEIdp, fips=="24510"), year), sum(Emissions))
# renamed columns
colnames(BaltimoraEmissionsForYear) <- c("Year", "Emissions")

# 2. Plot
png('plot2.png')
barplot(BaltimoraEmissionsForYear$Emissions, names.arg=EmissionsForYear$Year, col="red", xlab='Years', ylab='Emissions (PM 2.5)', main =  'Baltimore City: Emissions (PM 2.5) per year')
dev.off()


