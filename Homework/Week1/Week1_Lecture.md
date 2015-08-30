Spatial environmental data analysis with R
========================================================
author: Adam M. Wilson
date: August 31, 2015

GEO 503

* Course: Mondays 3-5pm 144 Wilkeson Quad
* Office Hours: Mondays 3-5pm, 120 Wilkeson Quad

Spatial environmental data analysis with R
========================================================

For more details on authoring R presentations click the
**Help** button on the toolbar.

- Bullet 1
- Bullet 2
- Bullet 3

The R Project for Statistical Computing
========================================================

* Open source
* Data manipulation
* Data analysis tools
* Great graphics
* Programming language
* 6,000+ free, community-contributed packages
* A supportive and increasing user community

R is a dialect of the S language and environment developed at Bell Laboratories (formerly AT&T) by John Chambers and colleagues (the same group that developed C and UNIX©)


What is the R environment?
========================================================
* an effective data handling and storage facility
* a suite of operators for (vectorized) calculations
* a large, coherent, integrated collection of tools for data analysis
* graphical capabilities (screen or hardcopy)
* a well-developed, simple, and effective programming language  which includes
  * conditionals
  * loops
  * user defined functions
  * input and output facilities


R Packages
==============
![packages](images/packages.png)
Over 6k packages!
Task Views organize packages by topic: [http://cran.r-project.org/web/views/]

Other Resources
===============
![R Books](images/Rbooks.png)



Reproducible, Portable, & Transparent
===============
![Mann Climate curve](images/MannCurve.png)

> "... all the code and data used to recreate Mann’s original analysis has been made available to the public [...] in R"
[Matthew Pocernich, R news 6/4, 10/31/06](http://www.cgd.ucar.edu/ccr/ammann/millennium/refs/WahlAmmann_ClimChange2006.html)


Figures in R
==============
If you can imagine it...

![Map](images/map.png)

[source](http://blog.revolutionanalytics.com/2009/01/r-graph-gallery.html)

Figures in R
==============
If you can imagine it...

![weather](images/weather.png)
[source](http://rpubs.com/bradleyboehmke/weather_graphic)


Spatial Analysis & Visualization
==============

Packages: `sp`, `maptools`, `rgeos`, `raster`, `ggmap`

Example: species range overlays
![ranges](images/sprange.png) [source](http://www.nceas.ucsb.edu/)

Spatial Analysis & Visualization
==============

Packages: `sp`, `maptools`, `rgeos`, `raster`, `ggmap`

Example: Visualizing Data with basemaps with `ggmap`
![Robbery Map](images/robmap.png) [source](http://journal.r-project.org/archive/2013-1/kahle-wickham.pdf)

Parallel Processing
=======

For *BIG* jobs:

multi-core processors / high performance computing

![parallel](images/Parallel.png)

Strengths & Limitations
=======

* Just-in-time compilation: 
  * <span style="color:red"> Slower than compiled languages (-) </span>
  * <span style="color:green">  Faster to compose and develop (+) </span>
* <span style="color:green"> Many available packages (+) </span>
* Most operations conducted in RAM
  * <span style="color:red"> RAM can be limiting and/or expensive (-) </span>
  * <span style="color:red"> “Error: cannot allocate vector of size X Mb” </span>
  * <span style="color:green"> Various packages and clever programming can overcome this… (+) </span>
* <span style="color:green"> Free like beer and speech! (+) </span>

R Interface
=========
![terminal](images/Terminal.png)

But there are other options...

R Interface: Mac
=========
![osx](images/osx.png)



R Interface: Windows
=========
![terminal](images/Windows.png)



R Interface: RStudio
=========
![Rstudio](images/Rstudio.png)

Mac, Windows, Linux, and over the web (via RStudio Server)

Workflow
=========
![workflow](images/workflow.png)

Adapted from Gandrud (2014) _Reproducible Research with R and RStudio_.