# This file is to get the best model out of hyperparameters tuning process based on the highest average of segmentation and tagging F-score on more than one file

# The input files will consist of lines of the next two lines:
# Iter: 75580 seg: p: 0.987167	r: 0.986888	f: 0.987028
# Iter: 75580 tag: p: 0.943873	r: 0.943606	f: 0.943739
import sys

best_global = 0
fold=0
string_global = ""
seg_f = 0
tag_f = 0
for j in [1,2,3,4,5]:
    # read the train result file
    F = open("fold"+str(j)+".dev.res").read().split('\n')
    best = 0
    string = ""
    seg_f_l = 0
    tag_f_l = 0
    # print the information of the best model for every file
    for i in range(int(len(F)/2)):
        seg = F[i*2].split()
        tag = F[i*2+1].split()
        score = (float(tag[8])+float(seg[8]))/2
        if score > best:
            string = "SEG:\t"+ seg[1]+"\t"+ seg[4]+"\t"+ seg[6]+"\t"+ seg[8]+"\n"
            string += "TAG:\t"+ tag[1]+"\t"+ tag[4]+"\t"+ tag[6]+"\t"+ tag[8]+"\n"
            print("SEG:", seg[1], seg[4], seg[6], seg[8], sep='\t')
            print("TAG:",tag[1], tag[4], tag[6], tag[8], sep='\t')
            seg_f_l = float(seg[8])
            tag_f_l = float(tag[8])
            best = score
    seg_f += seg_f_l
    tag_f += tag_f_l
    if best > best_global:
        fold = j
        string_global = string
        best_global = best
    print("---------------------------------")

# print the information of the best model of all files
print("---------------------------------")
print(string_global)
print(fold)
print(seg_f/5,tag_f/5)


