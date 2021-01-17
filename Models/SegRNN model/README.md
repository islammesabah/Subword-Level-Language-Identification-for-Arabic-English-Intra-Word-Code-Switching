# SegRNN-model
Our Main model: Segmental Recurrent Neural Network model For language identification on Arabic-English intra-word Code-Switching

## important: cnn-v1 requirement
You need the [version 1 of the CNN](https://github.com/clab/cnn-v1) library for training, test and use the SegRnn model.

## prepare the code
after installing the CNN library move the __./segrnn-sup.cc__ file to the examples folder in the CNN library.

then change these files to call the __segrnn-sup.cc__ in the CNN library after build it:

```
./cs_aren_data/dev.sh
./cs_aren_data/test_one_sentence.sh
./cs_aren_data/test.sh
./cs_aren_data/train.sh
./cs_aren_phrase/test.sh
./cs_aren_phrase/train.sh
```
if you don't have embedding file remove the --upe flag or keep it committed
## Corpus
use this [Arabic-English data](https://github.com/islamkaloop/Subword-Level-Language-Identification-for-Arabic-English-Intra-Word-Code-Switching/tree/master/AR-EN%20Intra-Word%20CS%20Corpus) to train the model.

## Word Embedding
use this [link](https://github.com/islamkaloop/Subword-Level-Language-Identification-for-Arabic-English-Intra-Word-Code-Switching/tree/master/Word%20Embeddimg) to generate the embedding file to use in 
```
./cs_aren_data/train.sh
```
after the --upe flag 