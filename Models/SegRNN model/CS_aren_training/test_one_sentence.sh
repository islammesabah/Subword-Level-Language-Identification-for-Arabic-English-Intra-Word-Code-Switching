# This file is used by test.py to test the model on specific sentences
#!/bin/bash

../cnn-v1/build/examples/segrnn-sup --test_file temp --test --eval_output ./sentence_out.txt --model_file_prefix ../Models/M19/