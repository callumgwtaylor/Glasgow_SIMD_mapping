# This uses rgdal to export/import the adapted shapefiles and base r for the data frames
dir.create("maps")
writeOGR(obj=glasgow.wgs84, dsn="maps", layer="glasgow.wgs84", driver="ESRI Shapefile")
saveRDS(glasgow.wgs84.f, file="fortifiedglasgow.Rda")

exportedmaps <- readOGR(dsn = "maps", layer = "glasgow.wgs84")
fortifiedglasgow <- readRDS(file="fortifiedglasgow.Rda")