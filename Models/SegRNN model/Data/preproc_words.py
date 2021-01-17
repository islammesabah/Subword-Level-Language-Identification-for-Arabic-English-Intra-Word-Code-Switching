# Prepare the data for train the model on the single token
import sys

# start command of the preproc
if len(sys.argv) != 3:
    print("python preproc_words.py inputfile outputfile")
    sys.exit()

# Read the data and open the output file 
infile = open(sys.argv[1]).read().split('\n')[:-2]
outfile = open(sys.argv[2], 'w')

# construct the data on this format "l o u t p u t ||| AR:1 EN:6"
new_line = False
tmp = list()
chars_tmp = list()
tags = list()
i = 0
j = 0
for line in infile:
    j += 1
    i += 1
    if not line:
        continue
    line=line.split("\t")
    word = list(line[0])
    splited_t = line[2].split()
    if(len(splited_t)>1):
        splited_w = line[1].split()
    else:
        splited_w = [line[1]]
    
    if len(splited_w) != len(splited_t):
        print(i,splited_w)
        print(i,splited_t)
    if len(splited_w) > 1:
        out = ""
        for morph, tag in zip(splited_w,splited_t):
            out = out+" "+tag+":"+str(len(morph))
        print(" ".join(word)+" |||"+out, file=outfile)
    else:
        tmp.append((line[2], len(line[1])))
        print(" ".join(word)+" ||| "+line[2]+":"+str(len(word)), file=outfile)
