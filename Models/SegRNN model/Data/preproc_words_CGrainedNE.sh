# prepare the Data to train and develop and test

mkdir -p WordsCGrainedNE/Train
mkdir -p WordsCGrainedNE/Test
#!/bin/bash

# testing data
# Arabic - English dataset Words
python3 preproc_words_CGrainedNE.py "../../../AR-EN Intra-Word CS Corpus/Test/test.aren" WordsCGrainedNE/Test/test.words.aren

# all training data
# Arabic - English dataset Words
python3 preproc_words_CGrainedNE.py "../../../AR-EN Intra-Word CS Corpus/Train/train.aren" WordsCGrainedNE/Train/train.words.aren

