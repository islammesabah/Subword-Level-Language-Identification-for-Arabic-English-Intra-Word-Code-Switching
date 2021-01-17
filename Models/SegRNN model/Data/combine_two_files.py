import sys

# start command of the preproc
if len(sys.argv) != 4:
    print("python combine_two_files.py inputfile1 inputfile2 outputfile")
    sys.exit()
    
infile1 = open(sys.argv[1]).read()
infile2 = open(sys.argv[2]).read()
outfile = open(sys.argv[3], 'w')

print(infile1, end="", file=outfile)
print(infile2, end="", file=outfile)