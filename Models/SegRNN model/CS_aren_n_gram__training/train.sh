#!/bin/bash


# create folders to save the results and model parameters
mkdir -p ../Results/1_2_gram
mkdir -p ../Models/1_2_gram

# train the model on the training n-gram data
../cnn-v1/build/examples/segrnn-sup --train_file ../Data/1_2_gram/train.1_2_grams.aren --dev_file ../Data/1_2_gram/test.words.aren --test_file ../Data/1_2_gram/test.words.aren --train --dev_every_i_reports 20 --epochs 50 --results_output ../Results/1_2_gram/ --eval_output ./output.txt --model_file_prefix ../Models/1_2_gram/ --max_consider_sentence_len 40

mv output.txt ../Results/1_2_gram/train.res
