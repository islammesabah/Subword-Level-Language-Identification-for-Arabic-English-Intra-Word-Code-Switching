# test the trained models on the testing token/phrase data 
#!/bin/bash

cnn-v1/build/examples/segrnn-sup --test_file ../Data/Phrases/Test/test.words.aren --test --eval_output ./output.txt --model_file_prefix ../Models/modelsPhrase/ --results_output ../Results/resultsPhrase/
mv output.txt ../Results/resultsPhrase/valuestest.res

