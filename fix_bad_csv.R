
library(readr)

args <- CommandArgs(trailingOnly = TRUE)

output_csv <- args[1]
input_csv  <- args[2]
bad_col    <- as.numeric(args[3])

read_bad_csv <- function(file_name, bad_col=3, n_max=-1) {
  f_in <- file(file_name)
  lines <- readLines(f_in, n=n_max)
  close(f_in)
  temp_csv_1 <- tempfile()
  f_out_1 <- file(temp_csv_1, "w")
  writeLines(gsub("\\{|\\}", '"', lines), f_out_1)
  close(f_out_1)
  data <- read_csv(temp_csv_1, col_names=FALSE)
  temp_csv_2 <- tempfile()
  f_out_2 <- file(temp_csv_2, "w")
  for (i in 1:nrow(data)) {
    bad_lines <- strsplit(substr(data[i,bad_col], 2, nchar(data[i,bad_col])-1), "\\),\\(")[[1]]
    if (bad_col==1) {
      lines <- paste(bad_lines,
                     paste0(as.character(data[i,2:ncol(data)]), collapse=","),
                     sep=",")
    } else if (bad_col<ncol(data)) {
      lines <- paste(paste0(as.character(data[i,1:bad_col-1]), collapse=","),
                     bad_lines,
                     paste0(as.character(data[i,bad_col+1:ncol(data)]), collapse=","),
                     sep=",")
    } else {
      lines <- paste(paste0(as.character(data[i,1:ncol(data)-1]), collapse=","),
                     bad_lines,
                     sep=",")
    }
  writeLines(lines, f_out_2)
  }
  close(f_out_2)
  return(read_csv(temp_csv_2))
}

data <- read_bad_csv(input_csv, bad_col=bad_col)
write_csv(data, output_csv)
