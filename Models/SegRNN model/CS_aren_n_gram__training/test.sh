# test the trained models on the testing data
#!/bin/bash

../cnn-v1/build/examples/segrnn-sup --test_file ../Data/1_2_gram/test.words.aren --test --eval_output ./output.txt --model_file_prefix ../Models/1_2_gram/ --results_output ../Results/1_2_gram

mv output.txt ../Results/1_2_gram/testOutput.res