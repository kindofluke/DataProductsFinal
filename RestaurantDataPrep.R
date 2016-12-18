restaurantbase <- read.csv("./data/FoodAtlasRestaurantData.csv", stringsAsFactors = FALSE)
countysocial <- read.csv("./data/SocioEcoCounty.csv", stringsAsFactors = FALSE)
limitRestaurant <- restaurantbase[c("FIPS","State", "County","FSRPTH07", "PC_FFRSALES07")]
fullresult <- merge(limitRestaurant, countysocial, ID="FIPS" )
fullresult$MEDHHINC10 <- as.numeric(fullresult$MEDHHINC10)
fullresult$POVRATE10 <- as.numeric(fullresult$POVRATE10)
states <- unique(limitRestaurant$State)
socio_columns <- c("PCT_NHWHITE10", "PCT_NHBLACK10", "PCT_HISP10", "PCT_NHASIAN10", "PCT_NHNA10", "PCT_NHNA10", "PCT_65OLDER10", "PCT_18YOUNGER10", "MEDHHINC10", "POVRATE10", "PERPOV10","CHILDPOVRATE10" )
socia_defs <- c("% White", "% Black","% Hispanic",  "% Asian", "% American Indian or Alaska Native", "% Hawaiian or Pacific Islander", "% Population 65 years or older", "% Population under age 18", "Median household income", "Poverty rate", "Persistent-poverty counties", "Child poverty rate"  )
socio_lookup <- data.frame(socio_columns, row.names = socia_defs)
parresult <- subset(fullresult, fullresult$State == "NH")
parresult[,c("FSRPTH07", "POVRATE10", "State", "County")]


