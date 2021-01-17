# get the maximum length of tokens
import os

max = 0
i = 0

# get the maximum length on dev data
for i in range(1,6):
    out = open("dev."+str(i)+".words.aren").read().split("\n")
    for lin in out:
        p = lin.split(" ||| ")
        phrase = list(p[0])
        leng = len(phrase)
        if(leng>max):
            i+=1
        if(leng>max):
            max = leng

# get the maximum length on train data
for i in range(1,6):
    out = open("train."+str(i)+".words.aren").read().split("\n")
    for lin in out:
        p = lin.split(" ||| ")
        phrase = list(p[0])
        leng = len(phrase)
        if(leng>max):
            i+=1
        if(leng>max):
            max = leng

# get the maximum length on test data
out = open("test.words.aren").read().split("\n")
for lin in out:
    p = lin.split(" ||| ")
    phrase = list(p[0])
    leng = len(phrase)
    if(leng>max):
        i+=1
    if(leng>max):
        max = leng

# print the maximum length and how much it changes
print(max)
print(i)