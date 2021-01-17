# prepare the n-gram Data to train and develop and test

mkdir -p 2_gram/Train
mkdir -p 2_gram/Dev
mkdir -p 2_gram/Test
mkdir -p 3_gram/Train
mkdir -p 3_gram/Dev
mkdir -p 3_gram/Test
mkdir -p 1_2_gram

#!/bin/bash
# 5-fold matrix
for i in 1 2 3 4 5;
do
  # Arabic - English dataset 2 gram
  python3 preproc_ngram.py "../../../AR-EN Intra-Word CS Corpus/Train/5Fold_Evaluation/Train/train.$i.aren" 2_gram/Train/train.$i.2_gram.aren 2
  python3 preproc_ngram.py "../../../AR-EN Intra-Word CS Corpus/Train/5Fold_Evaluation/Dev/dev.$i.aren" 2_gram/Dev/dev.$i.2_gram.aren 2

  # Arabic - English dataset 3 gram
  python3 preproc_ngram.py "../../../AR-EN Intra-Word CS Corpus/Train/5Fold_Evaluation/Train/train.$i.aren" 3_gram/Train/train.$i.3_gram.aren 3
  python3 preproc_ngram.py "../../../AR-EN Intra-Word CS Corpus/Train/5Fold_Evaluation/Dev/dev.$i.aren" 3_gram/Dev/dev.$i.3_gram.aren 3
  
done

# testing data
# Arabic - English dataset 2_gram
python3 preproc_ngram.py "../../../AR-EN Intra-Word CS Corpus/Test/test.aren" 2_gram/Test/test.2_gram.aren 2
# Arabic - English dataset 3_gram
python3 preproc_ngram.py "../../../AR-EN Intra-Word CS Corpus/Test/test.aren" 3_gram/Test/test.3_gram.aren 3
# Arabic - English dataset 1_2_gram
python3 combine_two_files.py Words/Test/test.words.aren 2_gram/Test/test.2_gram.aren 1_2_gram/test.1_2_grams.aren

# all training data
# Arabic - English dataset 1_gram
python3 preproc_ngram.py "../../../AR-EN Intra-Word CS Corpus/Train/train.aren" 2_gram/Train/train.2_gram.aren 2
# Arabic - English dataset 2_gram
python3 preproc_ngram.py "../../../AR-EN Intra-Word CS Corpus/Train/train.aren" 3_gram/Train/train.3_gram.aren 3
# Arabic - English dataset 1_2_gram
python3 combine_two_files.py Words/Train/train.words.aren 2_gram/Train/train.2_gram.aren 1_2_gram/train.1_2_grams.aren