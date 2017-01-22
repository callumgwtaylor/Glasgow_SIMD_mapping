Glasgow_SIMD_mapping
======

Recreating maps of Glasgow with the Scottish Index of Multiple Deprivation in R
------

Glasgow and the Scottish Government have some great open access data available online, and I needed to use some in a project at work.
I wanted to look at the Scottish Index of Multiple Deprivation for Glasgow City, and use R to look at it further.
Using preexisting datasets, and preexisting guides, I've combined the data sets, making it easier to plot maps of the information.
I've uploaded it to spare other people the effort.


*This is not original work, and I don't pretend that it is. The datasets were preexisting, so was the code in various forms online, I've just cobbled things together!*




The data sets I've used are:

- http://www.gov.scot/Topics/Statistics/SIMD
- https://data.glasgow.gov.uk/dataset/output-areas
- https://www.freemaptools.com/download-uk-postcode-lat-lng.htm

The guides I've used are mainly:

- https://cran.r-project.org/doc/contrib/intro-spatial-rl.pdf
- http://eriqande.github.io/rep-res-web/lectures/making-maps-with-R.html
- https://journal.r-project.org/archive/2013-1/kahle-wickham.pdf
- http://geotheory.co.uk/blog/2013/12/05/british-national-grid-transformation-and-reprojection-in-r/
- http://stackoverflow.com/questions/3650636/how-to-attach-a-simple-data-frame-to-a-spatialpolygondataframe-in-r
- https://rpubs.com/nickbearman/r-google-map-making
- https://github.com/Robinlovelace/Creating-maps-in-R
- http://gis.stackexchange.com/questions/162019/how-to-export-a-dataset-with-spatialpolygonsdataframe-as-a-shapefile

*There were a couple of other blog posts that I found really useful at the time and can't find again now (a few weeks after first doing this), if you see (or if you wrote!) something you think I may have used please let me know and I'll add it to the list.*

## What was the problem?
The data sets that were released for Index Of Multiple Deprivation were linked to data zones, whilst deliberate (it links to smaller population units) it does make it more difficult to map and plot in R

## What was the solution?
Other open data sets are available, to link the 'data zones' to UK Postcodes, and to link UK postcodes to Latitude and Longitude.
By combining all three we're able to plot the SIMD data using R far easier.


For a copy of the code for this, go to Glasgow_SIMD_Mapping.R

For all the datasets, go to the links above. I have not uploaded the freemaptools csv as:

1. Not too sure about their usage policy
2. The file's 90mb

For just the spatial data itself:

1. go to the folder 'maps' for the shapefiles
2. fortifiedglasgow.Rda for the dataframe for ggplot