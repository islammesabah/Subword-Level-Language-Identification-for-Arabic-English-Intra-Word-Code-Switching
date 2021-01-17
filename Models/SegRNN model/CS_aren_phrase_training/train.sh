#!/bin/bash

# create folders to save the results and model parameters
mkdir -p ../Models/modelsPhrase
mkdir -p ../Results/resultsPhrase

# train the model on the training data on the sentences
for i in 1 2 3 4 5;
do
  cnn-v1/build/examples/segrnn-sup --train_file ../Data/Phrases/Train/train.$i.phrases.aren --dev_file ../Data/Phrases/Dev/dev.$i.phrases.aren --test_file ../Data/Phrases/Test/test.phrases.aren --train --dev_every_i_reports 1000 --epochs 50 --results_output ../Results/resultsPhrase/ --eval_output ./output.txt --model_file_prefix ../Models/modelsPhrase/ 
  mv output.txt ../Results/resultsPhrase/fold$i.dev.res
done

