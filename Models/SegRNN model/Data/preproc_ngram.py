# Prepare the data for train the model on the n0gram
import sys

# start command of the preproc
if len(sys.argv) != 4:
    print("python preproc.py inputfile outputfile n")
    sys.exit()

# Read the data and open the output file 
infile = open(sys.argv[1]).read().split('\n')[:-2]
outfile = open(sys.argv[2], 'w')
ngram=int(sys.argv[3])

# construct the data on this format "5 / 1 t 2 r e e b a n ||| OTHER:1 OTHER:1 OTHER:1 AR:8"
new_line = False
tmp = list()
chars_tmp = list()
data = list()
i = 0
j = 0

for line in infile:
    j += 1
    if not line:
        i += 1
        new_line = False
        ngram_token = list()
        ngram_tag = list()
        for i in range(0,len(chars_tmp)-(ngram-1)):
            for j in range(0,ngram):
                ngram_token.append(chars_tmp[i+j])
                if isinstance(tmp[i+j], list):
                    ngram_tag+=tmp[i+j]
                else:
                    ngram_tag.append(tmp[i+j])
            chars_tmp_text =  " ".join(list(("".join(ngram_token))))
            print(chars_tmp_text, end="", file=outfile)
            out = list()
            for tag, size in ngram_tag:
                out.append(tag+":"+str(size))
            if not out or not chars_tmp_text:
                continue
            print(" ||| "+" ".join(out), file=outfile)
            ngram_token = list()
            ngram_tag = list()
        tmp = list()
        chars_tmp = list()
        continue

    line = line.split("\t")
    chars_tmp.append(line[0])
    splited_t = line[2].split()
    if(len(splited_t)>1):
        splited_w = line[1].split()
    else:
        splited_w = [line[1]]
    if len(splited_w) != len(splited_t):
        print(i,splited_w)
        print(i,splited_t)
    if len(splited_w) > 1:
        ntag = list()
        for morph, tag in zip(splited_w,splited_t):
            ntag.append((tag, len(morph)))
            i+=1
        tmp.append(ntag)
    else:
        tmp.append((line[2], len(line[1])))