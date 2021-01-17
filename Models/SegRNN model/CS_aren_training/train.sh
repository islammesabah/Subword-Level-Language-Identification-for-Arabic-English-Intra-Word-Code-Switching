#!/bin/bash


# create folders to save the results and model parameters
mkdir -p ../Results/FlairEmb
mkdir -p ../Models/FlairEmb

# train the model on the training data
../cnn-v1/build/examples/segrnn-sup --train_file ../Data/Words/Train/train.words.aren --dev_file ../Data/Words/Test/test.words.aren --test_file ../Data/Words/Test/test.words.aren --train --dev_every_i_reports 20 --epochs 50 --results_output ../Results/FlairEmb/ --eval_output ./output.txt --model_file_prefix ../Models/FlairEmb/ --max_consider_sentence_len 20 '--upe ../../../Word Embeddimg/Pre_Trained_Embedding/pre_trained.aren' 

mv output.txt ../Results/FlairEmb/train.res
