# test the trained models on the testing data
#!/bin/bash

../cnn-v1/build/examples/segrnn-sup --test_file ../Data/WordsCGrainedNE/Test/test.words.aren --test --eval_output ./output.txt --model_file_prefix ../Models/MCGrainedNE/ --results_output ../Results/MCGrainedNE

mv output.txt ../Results/MCGrainedNE/testOutput.res