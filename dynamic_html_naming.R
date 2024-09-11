# either can sue function or choose name from specified list
# credit to https://stackoverflow.com/questions/71224773/dynamically-set-r-markdown-title-output-filename-and-global-variables

setwd("C:\\Users\\kelvi\\Desktop\\r_test\\")
output_folder <- ""

# link to Rmd or quarto file

###################################### rmd #####################################
# function to create a file
name_file <- function(name) {
  rmarkdown::render(
    input = "dynamic_html.Rmd", # must be in same place as this file
    params = list(set_title = name),
    output_file = paste0(output_folder, name, '_output_', Sys.Date(), '.html')
  )
}

# can make singlar instances like
name_file("abc")

# or in list like
lst_nmes <- c("def","ghi")

for (i in lst_nmes) {
  name_file(i)
}

###################################### quarto #####################################
# function to create a file
name_file_quarto <- function(name) {
  rmarkdown::render(
    input = "dynamic_html_quarto.QMD", # must be in same place as this file
    params = list(set_title = name),
    output_file = paste0(output_folder, name, '_output_quarto_', Sys.Date(), '.html')
  )
}

# can make singlar instances like
name_file_quarto("abc")

# or in list like
lst_nmes <- c("def","ghi")

for (i in lst_nmes) {
  name_file_quarto(i)
}