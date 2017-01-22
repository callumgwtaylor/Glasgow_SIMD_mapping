# Glasgow_SIMD_mapping
Combining existing data sets to recreate Glasgow Index of Multiple Deprivation mapping

This is not original work, and I don't pretend that it is.

Glasgow and the Scottish Government has some great open access data available online, and I wanted to use some in a project at work.

I wanted to look at the Scottish Index of Multiple Deprivation for Glasgow City, and use R to look at it further.

Using preexisting datasets, and preexisting guides, I've combined the data sets, making it easier to plot maps of the information.

I've uploaded it to spare other people the effort.

The data sets I've used are:
http://www.gov.scot/Topics/Statistics/SIMD
https://data.glasgow.gov.uk/dataset/output-areas
https://www.freemaptools.com/download-uk-postcode-lat-lng.htm

The guides I've used are mainly:
https://cran.r-project.org/doc/contrib/intro-spatial-rl.pdf
http://eriqande.github.io/rep-res-web/lectures/making-maps-with-R.html
https://journal.r-project.org/archive/2013-1/kahle-wickham.pdf
http://geotheory.co.uk/blog/2013/12/05/british-national-grid-transformation-and-reprojection-in-r/
http://stackoverflow.com/questions/3650636/how-to-attach-a-simple-data-frame-to-a-spatialpolygondataframe-in-r
https://rpubs.com/nickbearman/r-google-map-making
https://github.com/Robinlovelace/Creating-maps-in-R

There were a couple of other blog posts that I found really useful at the time and can't find again now (a few weeks after first doing this), if you see (or if you wrote!) something that I was clearly using please let me know and I'll add it to the list. Again, not trying to pretend this is any original work, just wanted to save others the effort.

What was the problem?
The data sets that were released for Index Of Multiple Deprivation were linked to data zones.
This is deliberate as it links to smaller population units, but makes it more difficult to map easily.

What was the solution?
Other data sets are available, to link the 'data zones' to UK Postcodes, and to link UK postcodes to Latitude and Longitude.
By combining all three we're able to plot the SIMD data using R far easier.
This means we can use maps, but also ggplot together.

For a copy of the code for this, go to Glasgow_SIMD_Mapping.R

For all the datasets, go to the links above. I have not attached the freemaptools to this as:
1) Not to sure about their usage policy
2) The csv file's 90mb

For just the spatial data itself, go to