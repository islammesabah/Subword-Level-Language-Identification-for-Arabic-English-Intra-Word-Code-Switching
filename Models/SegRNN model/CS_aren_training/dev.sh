# train the models on the 5-fold validation matrix (development process) to tune the hyperparameters of the model

#!/bin/bash

for i in  5;
do
  cnn-v1/build/examples/segrnn-sup --train_file ../Data/Words/Train/train.$i.words.aren --dev_file ../Data/Words/Dev/dev.$i.words.aren --test_file ../Data/Words/Test/test.words.aren --train --dev_every_i_reports 20 --epochs 50 --results_output ../Results/ --eval_output ./output.txt --model_file_prefix ../Models/ --max_consider_sentence_len 20
  mv output.txt ../Results/Dev/fold$i.dev.res
done
