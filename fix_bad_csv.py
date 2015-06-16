
import csv
from io import StringIO
import sys

if __name__=="__main__":
    output_file = sys.argv[1]
    input_file  = sys.argv[2]
    bad_col     = int(sys.argv[3])-1

    with open(input_file) as f_in:
        with open(output_file, "w") as f_out:
            writer = csv.writer(f_out)
            for line in f_in:
                row = csv.reader(StringIO(line.strip().replace("{", "\"").replace("}", "\""))).__next__()
                for el in csv.reader(StringIO(row[bad_col].replace("(", "\"").replace(")", "\""))).__next__():
                    writer.writerow(row[:bad_col] + el.split(","))
