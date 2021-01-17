# This file is to get the best model out of hyperparameters tuning process based on the highest average of segmentation and tagging F-score

# The input file will consist of lines of the next two lines:
# Iter: 75580 seg: p: 0.987167	r: 0.986888	f: 0.987028
# Iter: 75580 tag: p: 0.943873	r: 0.943606	f: 0.943739
import sys

# read the train result file
F = open("1_2_grams/train.res").read().split('\n')

# print the information of the best model
best = 0
string = ""
seg_f_l = 0
tag_f_l = 0
for i in range(int(len(F)/2)):
    seg = F[i*2].split()
    tag = F[i*2+1].split()
    score = (float(tag[8])+float(seg[8]))/2
    if score > best:
        print("SEG:", seg[1], seg[4], seg[6], seg[8], sep='\t')
        print("TAG:",tag[1], tag[4], tag[6], tag[8], sep='\t')
        seg_f_l = float(seg[8])
        tag_f_l = float(tag[8])
        best = score
print("---------------------------------")
