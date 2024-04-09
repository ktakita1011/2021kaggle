#/bin/bash

mkdir -p /kaggle/input/

kaggle competitions download -c home-credit-credit-risk-model-stability

mkdir /kaggle/input/home-credit-credit-risk-model-stability

unzip home-credit-credit-risk-model-stability.zip -d /kaggle/input/home-credit-credit-risk-model-stability
