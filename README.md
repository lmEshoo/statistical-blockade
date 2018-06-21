# statistical-blockade
This repo contains an implementation of Statistical Blockade: A Novel Method for Very Fast Monte Carlo Simulation of Rare Circuit Events, and its Application.


Research paper can be found [here](https://ieeexplore.ieee.org/document/4212000/)

## Prerequisites 

- MATLAB
  - Statistics and Machine Learning Toolbox
- HSPICE 

## Generate Monte Carlo Training Data

1) In `main.m`, change varilable `sample_training` to the amount of samples you'd like to train on.

2) Run `main.m`

- Two output files will be generated `training_fail_samples` and `training_pass_samples`.


## Train Classifier

*****Need Statistics and Machine Learning Toolbox****

1) Run `classifier.m`

- This will save the classifier tail predictions into `saveTail.mat` for use later.

## Simulate Using HSPICE

1) Run `sim.m`

- This will use the classifier tail predictions from `saveTail.mat`.

- In `sim.m`:
  - Setting the `threshold` variable and you'll notice the change in the `error` count.
  - You can change the `gppdf` to `gpcdf` to get GDP CDF's plot.

## Contributors

- Lini Mestar
- Yan Chen
