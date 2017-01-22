x <- c("ggmap", "rgdal", "rgeos", "maptools", "plyr", "dplyr", "tidyr", "tmap", "readxl", "leaflet", "ggplot2", "readr") 
# install.packages(x) #Use this if you need any of the packages
lapply(x, library, character.only = TRUE)

# This line imports the electoral shape file of glasgow city from 2010 (https://data.glasgow.gov.uk/dataset/output-areas)
glasgow <- readOGR(dsn = "elect_codes", layer = "Glasgow_elect_codes_2010")
# This line loads in the postcode data and SIMD rank of glasgow city from 2016 (http://www.gov.scot/Topics/Statistics/SIMD) (and then filters out unneccesary stuff)
postcodes <- read_excel("00505244.xlsx", sheet=2, col_names = TRUE)
postcodes <- postcodes %>%
  select(Postcode, DZ, SIMD16_Rank)
#This section imports the latitude and longitude for all uk postcodes, then it merges with the postcode section (https://www.freemaptools.com/download-uk-postcode-lat-lng.htm)
#I haven't uploaded this CSV to github as I'm not sure about their usage policy and it's 90mb
longlat <- read_csv("ukpostcodes/ukpostcodes.csv", col_names = TRUE)
colnames(longlat)[colnames(longlat)=="postcode"] <- "Postcode"
longlat <- as.data.frame(longlat)
postcodes <- merge(postcodes, longlat, by = "Postcode")
#Then it renames the column name 'postcode' in postcodes to match with the 'SUL_PCSU' in glasgow
colnames(postcodes)[colnames(postcodes)=="Postcode"] <- "SUL_PCSU"
postcodes <- as.data.frame(postcodes)
#then this line merges everything nicely
glasgow@data = data.frame(glasgow@data, postcodes[match(glasgow@data[, "SUL_PCSU"], postcodes[,"SUL_PCSU"]),])
rm(longlat)
rm(postcodes)
#So ultimately the section above imports the glasgow shapefile, and adds further information about it's longitude and latitude

# Now we import the information about each SIMD data zone
SIMDIndicator <- read_excel("00510566.xlsx", sheet=3, col_names = TRUE)

# We want to change the projection of the shape files from UK grid to latitude and longitude
proj4string(glasgow) <- CRS("+init=epsg:27700")
glasgow.wgs84 <- spTransform(glasgow, CRS("+init=epsg:4326"))

# Fortifying this allows us to use ggplot
glasgow.wgs84.f <- fortify(glasgow.wgs84, region = "DZ")

# but fortifying also cuts out a load of information we need to merge back in
colnames(glasgow.wgs84.f)[colnames(glasgow.wgs84.f)=="id"] <- "Data_Zone"
glasgow.wgs84.f <- left_join(glasgow.wgs84.f, SIMDIndicator, by= "Data_Zone")
glasgow.wgs84.f <- merge(glasgow.wgs84.f, glasgow.wgs84@data, by.x = "Data_Zone", by.y = "DZ")

## But that's it now done! glasgow.wgs84.f is the fortified dataframe we can use in ggplot, and glasgow.wgs84 are the shape files plotted on a gps longlat, allowing us to use them.

<<<<<<< HEAD

# rm(glasgow.wgs84.f, glasgow.wgs84, glasgow, glasgow.b1, b, x)
=======
# rm(postcodes, glasgow.wgs84.f, glasgow.wgs84, SIMDIndicator, wardwatcher, glasgow, glasgow.b1, b, longlat, SIMDWardwatcher, x, surviveddied, spatialdata, ggGlasgow)
# rm(AQUA, BLACK, BLUE, CLRS, FUCHSIA, GRAY, GREEN, LIME, MAROON, NAVY, OLIVE, ORANGE, PURPLE, RED, SILVER, TEAL, YELLOW)
# rm(x)
>>>>>>> 915f2e1317a7fb6e24c895628e6d27556901fe6e
