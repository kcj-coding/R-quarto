# either can sue function or choose name from specified list
# credit to https://stackoverflow.com/questions/71224773/dynamically-set-r-markdown-title-output-filename-and-global-variables

setwd("C:\\Users\\kelvi\\Desktop\\r_test\\") # where the scripts are located
files_folder <- "C:\\Users\\kelvi\\Desktop\\"
output_folder <- "C:\\Users\\kelvi\\Desktop\\Files\\"

# link to Rmd or quarto file

# list e.g. word files
list_word_files <- list.files(files_folder, pattern=".docx|.doc")

###################################### rmd #####################################
# function to create a file
name_file <- function(name) {
  rmarkdown::render(
    input = "dynamic_html.Rmd", # must be in same place as this file
    params = list(set_title = name),
    output_dir = output_folder,
    output_file = paste0(name, '_output_', Sys.Date(), '.html')
  )
}

# can make singlar instances like
name_file("abc")

# or in list like
lst_nmes <- c("def","hij")

for (i in lst_nmes) {
  tryCatch({
  name_file(i)}, error = function(e) e)
}

for (i in list_word_files) {
  tryCatch({
    name_file(i)}, error = function(e) e)
}
