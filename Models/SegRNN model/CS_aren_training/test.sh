# test the trained models on the testing data
#!/bin/bash

../cnn-v1/build/examples/segrnn-sup --test_file ../Data/Words/Test/test.words.aren --test --eval_output ./output.txt --model_file_prefix ../Models/FlairEmb/ --results_output ../Results/FlairEmb

mv output.txt ../Results/FlairEmb/testOutput.res