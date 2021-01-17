# test.py is to test the trained model on a specific sentence
import os 
import sys

# start command of the test
if len(sys.argv) != 2:
    print("python test.py sentence")
    sys.exit()

# get the words of the sentence
words = (sys.argv[1]).split()
outfile = open("temp", 'w')

# prepare the words to be tested on the model
for word in words:
    word = list(word) 
    print(" ".join(word)+" ||| ", file=outfile)
outfile.close()

# use the sh file to call the model
os.system('sh test_one_sentence.sh')

# get the results and print it
out = open("sentence_out.txt").read().split("\n")[:-1]
print('\n')
if(len(out) != len(words)):
    print ("the output is not consistent")
else:
    result = ""
    i = 0
    for word in words:
        if(result == ""):
            result += word +"/" + out[i]
        else:
            result += " , " + word +"/" + out[i]
        i += 1
    print(result)

# remove the temporary files
os.remove("temp")
os.remove("sentence_out.txt")