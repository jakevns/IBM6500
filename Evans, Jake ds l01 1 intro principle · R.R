###############################################################################

# DS-L01-1: Introduction to R and RStudio - Principle Assignment ----------
# Course: DS-L01
# Purpose: Build a personal "Codebook" foundation of R commands demonstrated in the Intro to R video, with ntoes for future reference.
###############################################################################

###############################################################################
# SECTION 1: R as a Calculator (basic operators) --------------------------
#R can evaluate math directly in the console/ script,which is a good way to confirm R and R studio are installed and are working correctly
###############################################################################

1+1
# Run w/ Ctrl + Enter.  Output should be 2. 

2*2
# Multiplication uses the asterisk.  Output should be 4.

3^3
# The caret (^) is the exponent operator.  3 to the power of 3 = 27. 

###############################################################################

###############################################################################
# SECTION 2: Creating Variables
# The assignment operator in R is "<-" (Less than + hyphen).  
# Think of it as "store the value on the right INTO the name on the left."
###############################################################################

# Storing text (a "string") requires quotation marks 
message <- "hello world"

#Run the line above, then check the Environment pane (top right) - you should see the "message" listed with the value "hello world" 

#Storing a number works exactly the same way, R figures out the data type automatically so there is no need to declare it (like in C++/Java).
number <- 7

###############################################################################

###############################################################################
# SECTION 3: Using Functions
#Functions take an input (an "argument") inside paranthesis and do something with it.  RStudio auto suggests function names and arguments are you type (use TAB to accept the suggestions).
###############################################################################

# Print() displays the balue of a bariable in the console
print(message)

# You can also just type the variable name by itself to print it.
message

# Max () and Min () take a list of numbers and return the largest / smallest value.  Numbers are seperated by commas. 
max(2, 5, 90, 30)  # expect 90
min( 2, 5, 90, 30) # expect 2

# NOTE: max()/min() can take huge lsits of numbers, not just a handful.  This is useful once you're pulling in real data columns. 

###############################################################################

###############################################################################
# SECTION 4: Installing and Loading Packages 
#Base R has biild in functions, but "Packages" (there are thousands of them) add extra tools; such as ggplot2 for graphing as an example.
#install.packages() only needs to be run ONCE per computer.
#After installing, comment it out (with #) so it doesn't re-run and re-download everytime you execute the script. 
###############################################################################

# install.packages("ggplot2") # <- run this once, then comment out

# library() loads a package so its functions become available in your current session.  This DOES need to run every session. 
library(ggplot2)

# NOTE: if you get an error here, its often a Java installation issue (see the video notes / classmates chat links for the fix).

###############################################################################

###############################################################################
# SECTION 5: Intro to Data Visualization with ggplot2. 
# Using the built in "mpg" dataset (fuel economy data) that comes bundles with ggplot2 (no need to import anything).
###############################################################################

# Build a density plot of highway mpg, colored by number of cylinders.
g <-  ggplot(mpg, aes(x=hwy)) +
  geom_density(aes(fill = factor(cyl)), alpha = 0.6) +
  labs(
    title = "Highway MPG by Number of Cylinders",
    subtitle = "Density plot using the built-in mpg dataset",
    x = "Highway MPG",
    fill = "# Cylinders"
  )

# Display the plot, just call the object by name. 
g

# NOTE: from the Plots pane you can see Export as an image/PDF, copy to clipboard, or ZOOM to preview it larger.
# Observation from the video: 8-cylinder cars tend to have worse highway mpg on average than 6 cylinder cars. 

###############################################################################

###############################################################################
# SECTION 6: R Markdown (conceptual note - not run from this script)
# R Markdown (.Rmd) files combine code, output, and narrative text into one shareable document (knit to HTML, PDF, or Word).
# Useful for documenting/explaining code to someone who isn't fluent in R.  Created via File -> New File -> R Markdown, then run using the "Knit" button. 
# (This assignment specifically asks for a .R script, so the Rmd workflow is just noted here for future reference)
###############################################################################

###############################################################################
# PERSONAL NOTES / TAKEAWAYS
# - <- is assignment; = also works in most contexts but <0 is the R convention.  
# - Ctrl + Enter runs the current line (or highlighted block) without needing to select the whole script. 
# - Comment liberally with # - future will thank present me. 
# - RStudio auto-complete (TAB) saves a lot of typing. 
# - Console work is NOT saved when RStudio closes; anything worth keeping belogns int he script, not typed directly into the console
###############################################################################