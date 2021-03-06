#' ---
#' title: "Introduction to ggplot2"
#' author: "Adam M. Wilson"
#' date: "October 2015"
#' output:
#'   revealjs::revealjs_presentation:
#'       theme: sky
#'       transition: fade
#'       highlight: monochrome
#'       center: false
#'       width: 1080
#'       widgets: [mathjax, bootstrap,rCharts]
#'       keep_md:  true
#'       pandoc_args: [ "--slide-level", "2" ]
#' ---
#' 
#' 
#' ## Today
#' 
#' 1. Projects
#' 2. `ggplot` graphics
#' 3. spatial (vector) data with `sp` package
#' 
#' 
#' ## Projects
#' 
#' * public transit system
#' * Precision agriculture
#' * temperature change and greenhouse gases
#' * near-bed hydrodynamics and mussels
#' * trajectory-clustering of the Fishing Boat Mutual Aid Group
#' * Ice time of Lake Erie 
#' * demographic factors related to the oral health
#' * dynamic precipitation patterns
#' * air pollution and diverse health outcomes
#' * migration flows
#' * Population Segregation from 1990 to 2010 in Erie County, New York
#' 
#' ## [`ggplot2`](http://ggplot2.org)
#' The _grammar of graphics_:  consistent aesthetics, multidimensional conditioning, and step-by-step plot building.
#' 
#' 
#' 1.	Data: 		The raw data
#' 2.	`geom_`: The geometric shapes representing data
#' 3.	`aes()`:	Aesthetics of the geometric and statistical objects (color, size, shape, and position)
#' 4.	`scale_`:	Maps between the data and the aesthetic dimensions
#' 
#' ```
#' data
#' + geometry,
#' + aesthetic mappings like position, color and size
#' + scaling of ranges of the data to ranges of the aesthetics
#' ```
#' 
#' ---
#' 
#' ### Additional settings
#' 
#' 5.	`stat_`:	Statistical summaries of the data that can be plotted, such as quantiles, fitted curves (loess, linear models), etc.
#' 6.	`coord_`:	Transformation for mapping data coordinates into the plane of the data rectangle
#' 7.	`facet_`:	Arrangement of data into grid of plots
#' 8.	`theme`:	Visual defaults (background, grids, axes, typeface, colors, etc.)
#' 
#' 
#' ---
#' 
#' <img src="assets/ggplot_intro1.png" alt="alt text" width="100%">
#' 
#' 
#' ---
#' 
#' <img src="assets/ggplot_intro2.png" alt="alt text" width="100%">
#' 
#' ## Simple scatterplot
#' 
## ------------------------------------------------------------------------
library(ggplot2)
p <- ggplot(mtcars, aes(x=wt, y=mpg))
p + geom_point()

#' 
#' ---
#' 
#' ### Aesthetic map: color by # of cylinders
#' 
## ------------------------------------------------------------------------
p + 
  geom_point(aes(colour = factor(cyl)))
 

#' 
#' ---
#' 
#' ### Set shape using # of cylinders 
## ------------------------------------------------------------------------
p + 
  geom_point(aes(shape = factor(cyl)))

#' 
#' ---
#' 
#' ### Adjust size by `qsec` 
## ------------------------------------------------------------------------
p + 
  geom_point(aes(size = qsec))

#' 
#' ---
#' 
#' ### Color by cylinders and size by `qsec` 
## ------------------------------------------------------------------------
p + 
  geom_point(aes(colour = factor(cyl),size = qsec))

#' 
#' ---
#' 
#' ### Multiple aesthetics
## ----fig.height=4--------------------------------------------------------
p + 
  geom_point(aes(colour = factor(cyl),size = qsec,shape=factor(gear)))

#' 
#' ---
#' 
#' ### Add a linear model
## ------------------------------------------------------------------------
p + geom_point() + 
  geom_smooth(method="lm")

#' 
#' ---
#' 
#' ### Change scale color
#' 
## ------------------------------------------------------------------------
p + geom_point(aes(colour = cyl)) + 
  scale_colour_gradient(low = "blue")

#' 
#' ---
#' 
#' ### Change scale shapes
#' 
## ------------------------------------------------------------------------
p + geom_point(aes(shape = factor(cyl))) + 
  scale_shape(solid = FALSE)

#' 
#' ---
#' 
#' ### Set aesthetics to fixed value
## ------------------------------------------------------------------------
ggplot(mtcars, aes(wt, mpg)) + 
  geom_point(colour = "red", size = 3)

#' 
#' ---
#' 
#' ### Transparancy: alpha=0.2
## ------------------------------------------------------------------------
d <- ggplot(diamonds, aes(carat, price))
d + geom_point(alpha = 0.2)

#' 
#' Varying alpha useful for large data sets
#' 
#' ---
#' 
#' ### Transparancy: alpha=0.1
#' 
## ------------------------------------------------------------------------
d + 
  geom_point(alpha = 0.1)

#' 
#' --- 
#' 
#' ### Transparancy: alpha=0.01
#' 
## ------------------------------------------------------------------------
d + 
  geom_point(alpha = 0.01)

#' 
#' 
#' ## Building ggplots
#' 
#' <img src="assets/ggplotSyntax.png" alt="alt text" width="90%">
#' 
#' ## Other Plot types
#' 
#' ---
#' 
#' <img src="assets/ggplot01.png" alt="alt text" width="70%">
#' 
#' ---
#' 
#' ## Your turn
#' 
#' Edit plot `p` above to include:
#' 
#' 1. points
#' 2. A smooth ('loess') curve
#' 3. a "rug" to the plot
#' 
#' ```
#' p <- ggplot(mtcars, aes(x=wt, y=mpg))
#' p + geom_point()
#' ```
#' 
#' ---
#' 
## ----message=F-----------------------------------------------------------
p+
  geom_point()+
  geom_smooth()+
  geom_rug()

#' 
#' ---
#' 
#' <img src="assets/ggplot02.png" alt="alt text" width="100%">
#' 
#' ---
#' 
#' <img src="assets/ggplot03.png" alt="alt text" width="70%">
#' 
#' ---
#' 
#' <img src="assets/ggplot05.png" alt="alt text" width="80%">
#' 
#' ---
#' 
#' ### Discrete X, Continuous Y
#' 
## ------------------------------------------------------------------------
p <- ggplot(mtcars, aes(factor(cyl), mpg))
p + geom_point()

#' 
#' ---
#' 
#' ### Discrete X, Continuous Y + geom_jitter()
#' 
## ------------------------------------------------------------------------
p + 
  geom_jitter()

#' 
#' ---
#' 
#' ### Discrete X, Continuous Y + geom_violin()
#' 
## ------------------------------------------------------------------------
p + 
  geom_violin()

#' 
#' ---
#' 
#' ### Discrete X, Continuous Y + geom_violin()
#' 
## ------------------------------------------------------------------------
p + 
  geom_violin() + geom_jitter(position = position_jitter(width = .1))

#' 
#' ---
#' 
#' <img src="assets/ggplot06.png" alt="alt text" width="100%">
#' 
#' ---
#' 
#' ### Three Variables
#' <img src="assets/ggplot07.png" alt="alt text" width="120%">
#' 
#' Will come back to this next week for raster package.
#' 
#' ---
#' 
#' ### Stats
#' Visualize a data transformation
#' 
#' <img src="assets/ggplotStat01.png" alt="alt text" width="100%">
#' 
#' * Each stat creates additional variables with a common ``..name..`` syntax
#' * Often two ways: `stat_bin(geom="bar")`  OR  `geom_bar(stat="bin")`
#' 
#' ---
#' 
#' <img src="assets/ggplotStat02.png" alt="alt text" width="100%">
#' 
#' ---
#' 
#' ### 2D kernel density estimation
#' 
#' Old Faithful Geyser Data on duration and waiting times.
#' 
## ------------------------------------------------------------------------
library("MASS")
data(geyser)
m <- ggplot(geyser, aes(x = duration, y = waiting))

#' 
#' <img src="assets/Old_Faithful.jpg" alt="alt text" width="50%"> <small>[photo: Greg Willis](https://commons.wikimedia.org/wiki/File:Old_Faithful_(3679482556).jpg)</small>
#' 
#' See `?geyser` for details.
#' 
#' ---
#' 
## ------------------------------------------------------------------------
m + 
  geom_point()

#' 
#' ---
#' 
## ------------------------------------------------------------------------
m + 
  geom_point() +  stat_density2d(geom="contour")

#' 
#' Check `?geom_density2d()` for details
#' 
#' ---
#' 
## ------------------------------------------------------------------------
m + 
  geom_point() +  stat_density2d(geom="contour") +
  xlim(0.5, 6) + ylim(40, 110)

#' 
#' Update limits to show full contours.  Check `?geom_density2d()` for details
#' 
#' 
#' ---
#' 
## ------------------------------------------------------------------------
m + stat_density2d(aes(fill = ..level..), geom="polygon") + 
  geom_point(col="red")

#' 
#' Check `?geom_density2d()` for details
#' 
#' ---
#' 
#' <img src="assets/ggplotStat03.png" alt="alt text" width="80%">
#' 
#' ---
#' 
#' ## Your turn
#' 
#' Edit plot `m` to include: 
#' 
#' * The point data (with red points) on top
#' * A `binhex` plot of the Old Faithful data
#' 
#' Experiment with the number of bins to find one that works.  
#' 
#' See `?stat_binhex` for details.
#' 
#' ```
#' m <- ggplot(geyser, aes(x = duration, y = waiting))
#' ```
#' 
#' 
#' 
#' ---
#' 
#' 
#' 
#' ## Specifying Scales
#' 
#' <img src="assets/ggplotScales01.png" alt="alt text" width="100%">
#' 
#' ---
#' 
#' ### Discrete color: default
#' 
## ------------------------------------------------------------------------
b=ggplot(mpg,aes(fl))+
  geom_bar( aes(fill = fl)); b

#' 
#' 
#' ---
#' 
#' ### Discrete color: greys
#' 
## ------------------------------------------------------------------------
b + scale_fill_grey( start = 0.2, end = 0.8, 
                   na.value = "red")

#' 
#' ---
#' 
#' ### Continuous color: defaults
#' 
## ---- message=F----------------------------------------------------------
a <- ggplot(mpg, aes(hwy)) + 
  geom_dotplot( aes(fill = ..x..)); a

#' 
#' ---
#' 
#' ### Continuous color: `gradient`
#' 
## ---- message=F----------------------------------------------------------
a +  scale_fill_gradient( low = "red", 
                          high = "yellow")

#' 
#' ---
#' 
#' ### Continuous color: `gradient2`
#' 
## ---- message=F----------------------------------------------------------
a + scale_fill_gradient2(low = "red", high = "blue", 
                       mid = "white", midpoint = 25)

#' 
#' ---
#' 
#' ### Continuous color: `gradientn`
#' 
## ---- message=F----------------------------------------------------------
a + scale_fill_gradientn(
  colours = rainbow(10))

#' 
#' ---
#' 
#' ### Discrete color: brewer
#' 
## ------------------------------------------------------------------------
b + 
  scale_fill_brewer( palette = "Blues")

#' 
#' ## [colorbrewer2.org](http://colorbrewer2.org)
#' 
#' 
#' <img src="assets/brewer1.png" alt="alt text" width="100%">
#' 
#' ---
#' 
#' ## ColorBrewer: Diverging
#' 
#' <img src="assets/brewer2.png" alt="alt text" width="100%">
#' 
#' ## ColorBrewer: Filtered
#' 
#' <img src="assets/brewer3.png" alt="alt text" width="100%">
#' 
#' 
#' ## Your turn
#' 
#' Edit the contour plot of the geyser data:
#' 
#' 1. Reduce the size of the points
#' 2. Use a sequential brewer palette (select from [colorbrewer2.org](http://colorbrewer2.org)) 
#' 3. Add informative x and y labels
#' 
#' ```
#' m +
#'   stat_density2d(aes(fill = ..level..), geom="polygon") + 
#'   geom_point(col="red")
#' ```
#' 
#' Note:  `scale_fill_distiller()` rather than `scale_fill_brewer()` for continuous data
#' 
#' ---
#' 
#' 
#' ---
#' 
#' Or use `geom=tile` for a raster representation.
#' 
#' 
#' 
#' ---
#' 
#' ## Axis scaling
#' 
#' 
#' Create noisy exponential data
#' 
## ------------------------------------------------------------------------
set.seed(201)
n <- 100
dat <- data.frame(
    xval = (1:n+rnorm(n,sd=5))/20,
    yval = 10^((1:n+rnorm(n,sd=5))/20)
)

#' 
#' ---
#' 
#' Make scatter plot with regular (linear) axis scaling
## ------------------------------------------------------------------------
sp <- ggplot(dat, aes(xval, yval)) + geom_point()
sp

#' 
#' <small> Example from [R Cookbook](http://www.cookbook-r.com/Graphs/Axes_(ggplot2)/) </small>
#' 
#' ---
#' 
#' log10 scaling of the y axis (with visually-equal spacing)
#' 
## ------------------------------------------------------------------------
sp + scale_y_log10()

#' 
#' ## Coordinate Systems
#' 
#' <img src="assets/ggplotCoords.png" alt="alt text" width="55%">
#' 
#' 
#' ## Position
#' 
#' <img src="assets/ggplotPosition.png" alt="alt text" width="80%">
#' 
#' ---
#' 
#' ### Stacked bars
#' 
## ------------------------------------------------------------------------
ggplot(diamonds, aes(clarity, fill=cut)) + geom_bar()


#' 
#' ---
#' 
#' ### Dodged bars
#' 
#' 
## ------------------------------------------------------------------------
ggplot(diamonds, aes(clarity, fill=cut)) + geom_bar(position="dodge")


#' 
#' 
#' # Facets
#' 
#' 
#' `facet_wrap()`: one variable
#' 
## ------------------------------------------------------------------------
ggplot(mpg, aes(x = cty, y = hwy, color = factor(cyl))) +
  geom_jitter()+
  facet_wrap(~year)

#' 
#' ---
#' 
#' `facet_grid()`: two variables
#' 
## ------------------------------------------------------------------------
ggplot(mpg, aes(x = cty, y = hwy, color = factor(cyl))) +
  geom_jitter()+
  facet_grid(year~cyl)

#' 
#' Very useful for timeseries of spatial data.
#' 
#' 
#' # Themes
#' 
#' 
#' ## GGplot Themes
#' 
#' <img src="assets/ggplotThemes.png" alt="alt text" width="80%">
#' 
#' Quickly change plot appearance with themes.
#' 
#' ### More options in the `ggthemes` package.
## ------------------------------------------------------------------------
library(ggthemes)

#' 
#' Or build your own!
#' 
#' ---
#' 
#' ### Theme examples: default
## ------------------------------------------------------------------------
p=ggplot(mpg, aes(x = cty, y = hwy, color = factor(cyl))) +
  geom_jitter() +
  labs(
    x = "City mileage/gallon",
    y = "Highway mileage/gallon",
    color = "Cylinders"
  )

#' 
#' ---
#' 
#' ### Theme examples: default
## ------------------------------------------------------------------------
p

#' 
#' --- 
#' 
#' ### Theme examples: Solarized
## ------------------------------------------------------------------------
p + theme_solarized()

#' 
#' --- 
#' 
#' ### Theme examples: Solarized Dark
## ------------------------------------------------------------------------
p +  theme_solarized(light=FALSE)

#' 
#' --- 
#' 
#' ### Theme examples: Excel
## ------------------------------------------------------------------------
p + theme_excel() 

#' 
#' --- 
#' 
#' ### Theme examples: _The Economist_
## ------------------------------------------------------------------------
p + theme_economist()

#' 
#' 
#' # Saving/exporting
#' 
#' ## Saving using the GUI
#' <img src="assets/ggplot_guisave.png" alt="alt text" width="80%">
#' 
#' ---
#' 
#' 
#' ## Saving using `ggsave()`
#' Save a `ggplot` with sensible defaults:
## ----eval=F--------------------------------------------------------------
## ggsave(filename, plot = last_plot(), scale = 1, width, height)

#' 
#' ---
#' 
#' ## Saving using devices
#' 
#' Save any plot with maximum flexibility:
#' 
## ----eval=F--------------------------------------------------------------
## pdf(filename, width, height)  # open device
## ggplot()                      # draw the plot(s)
## dev.off()                     # close the device

#' 
#' **Formats**
#' 
#' * pdf
#' * jpeg
#' * png
#' * tif
#' 
#' and more...
#' 
#' ---
#' 
#' ## Your turn: save a plot
#' 
#' 1. Save the `p` plot from above using `png()` and `dev.off()`
#' 2. Switch to the solarized theme with `light=FALSE`
#' 2. Adjust fontsize with `base_size` in the theme `+ theme_solarized(base_size=24)`
#' 
#' ## Save a plot: Example 1
#' 
#' <img src="assets/test1.png" alt="alt text" width="80%">
#' 
#' ## Save a plot: Example 2
#' 
#' <img src="assets/test2.png" alt="alt text" width="80%">
#' 
#' 
#' ## GGPLOT2 Documentation
#' 
#' Perhaps R's best documented package: [docs.ggplot2.org](http://docs.ggplot2.org/current/)
#' 
#' <img src="assets/ggplotDoc.png" alt="alt text" width="100%">
#' 
#' ## Colophon
#' 
#' Sources:
#' 
#' *  [ggplot cheatsheet](https://www.rstudio.com/wp-content/uploads/2015/03/ggplot2-cheatsheet.pdf)
#' 
#' Licensing: 
#' 
#' * Presentation: [CC-BY-3.0 ](http://creativecommons.org/licenses/by/3.0/us/)
#' * Source code: [MIT](http://opensource.org/licenses/MIT) 
#' 
