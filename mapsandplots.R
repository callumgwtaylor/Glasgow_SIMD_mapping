## this is to be run after Glasgow_SIMD_Mapping.R
# collect a section of glasgow from googlemaps
b <- bbox(glasgow.wgs84)
b[1, ] <- (b[1, ] - mean(b[1, ])) * 1.5 + mean(b[1, ])
b[2, ] <- (b[2, ] - mean(b[2, ])) * 1.5 + mean(b[2, ])
# scale longitude and latitude (increase bb by 5% for plot) replace 1.05
# with 1.xx for an xx% increase in the plot size
glasgow.b1 <- ggmap(get_map(location = b, color = "bw"))


## Heres a quick map of the Glasgow city post codes, with the fill indicating their SIMD rank in 2016
# glasgow.b1 +
#   geom_polygon(data = glasgow.wgs84.f, aes(x = long, y = lat, group = group, fill =  SIMD16_Rank), alpha = 0.8)


NAVY <- '#001f3f'
BLUE <- '#0074D9'
AQUA <- '#7FDBFF'
TEAL <- '#39CCCC'
OLIVE <- '#3D9970'
GREEN <- '#2ECC40'
LIME <- '#01FF70'
YELLOW <- '#FFDC00'
ORANGE <- '#FF851B'
RED <- '#FF4136'
MAROON <- '#85144b'
FUCHSIA <- '#F012BE'
PURPLE <- '#B10DC9'
BLACK <- '#111111'
GRAY <- '#AAAAAA'
SILVER <- '#DDDDDD'

map <- glasgow.b1 + geom_polygon(data = glasgow.wgs84.f, aes(x = long, y = lat, group = group, fill =  SIMD16_Rank), alpha = 0.8)
map + scale_fill_gradient(low = "#B04475", high = "#F6F3FA") + theme(axis.title.x=element_blank(), 
                                                                     axis.text.x=element_blank(),
                                                                     axis.ticks=element_blank(),
                                                                     axis.title.y=element_blank(), 
                                                                     axis.text.y=element_blank(),
                                                                     legend.position = "none") +
  labs(title ="Scottish Index of Multiple Deprivation Ranking in Glasgow 2016", subtitle = "More Deprived Areas are in Darker Colours, Less Deprived are in Lighter Colours")
# CLRS <- c(NAVY, BLUE, AQUA, TEAL, RED, OLIVE, GREEN, LIME, YELLOW, ORANGE, MAROON, FUCHSIA, PURPLE, BLACK, GRAY, SILVER)
# rm(AQUA, BLACK, BLUE, CLRS, FUCHSIA, GRAY, GREEN, LIME, MAROON, NAVY, OLIVE, ORANGE, PURPLE, RED, SILVER, TEAL, YELLOW)
