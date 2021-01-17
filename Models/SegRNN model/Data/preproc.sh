# prepare the Data to train and develop and test

mkdir -p Words/Train
mkdir -p Words/Dev
mkdir -p Words/Test
mkdir -p Phrases/Train
mkdir -p Phrases/Dev
mkdir -p Phrases/Test
#!/bin/bash

# 5-fold matrix
for i in 1 2 3 4 5;
do
  # Arabic - English dataset Words
  python3 preproc_words.py "../../../AR-EN Intra-Word CS Corpus/Train/5Fold_Evaluation/Train/train.$i.aren" Words/Train/train.$i.words.aren
  python3 preproc_words.py "../../../AR-EN Intra-Word CS Corpus/Train/5Fold_Evaluation/Dev/dev.$i.aren" Words/Dev/dev.$i.words.aren

  # Arabic - English dataset Phrase
  python3 preproc_phrases.py "../../../AR-EN Intra-Word CS Corpus/Train/5Fold_Evaluation/Train/train.$i.aren" Phrases/Train/train.$i.phrases.aren
  python3 preproc_phrases.py "../../../AR-EN Intra-Word CS Corpus/Train/5Fold_Evaluation/Dev/dev.$i.aren" Phrases/Dev/dev.$i.phrases.aren

done

# testing data
# Arabic - English dataset Words
python3 preproc_words.py "../../../AR-EN Intra-Word CS Corpus/Test/test.aren" Words/Test/test.words.aren
# Arabic - English dataset Phrase
python3 preproc_phrases.py "../../../AR-EN Intra-Word CS Corpus/Test/test.aren" Phrases/Test/test.phrases.aren

# all training data
# Arabic - English dataset Words
python3 preproc_words.py "../../../AR-EN Intra-Word CS Corpus/Train/train.aren" Words/Train/train.words.aren
# Arabic - English dataset Phrase
python3 preproc_phrases.py "../../../AR-EN Intra-Word CS Corpus/Train/train.aren" Phrases/Train/train.phrases.aren
