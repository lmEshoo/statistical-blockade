# statistical-blockade
This repo contains an implementation of Statistical Blockade: A Novel Method for Very Fast Monte Carlo Simulation of Rare Circuit Events, and its Application.


Research paper can be found [here](https://ieeexplore.ieee.org/document/4212000/)

## Problem

> The delay distribution of a gate strongly depends on the device geometry and doping profile.
In nano-scaled CMOS devices, the random variations of dopant atoms in the channel region
cause random variations in the transistor threshold voltage (Vt), known as “random (or discrete)
dopant effect”. This result in threshold voltage mismatch between transistors on die and
significant delay variation of logic gates and circuit. Hence, a statistical modeling and analysis of
the delay of logic gate is necessary. In this project, we consider random variation in transistors,
and apply stochastic modeling to estimate distribution of propagation delay in given circuit.

> Consider a critical path made with 5 inverter and 5 NAND cascaded as below. With variations in
MOSFET, try to estimate the yield rate of circuits that have a delay time less than `1.395e-10s`. In
another word, try to estimate the probability of high sigma event that the time delay of
the circuit is equal to or larger than `1.395e-10s`.

<p align="center">
<img src="https://user-images.githubusercontent.com/3256544/41701170-498cc0c0-74e0-11e8-98fb-1c32400a6032.png" alt="drawing2" height="350"/>
</p>

> The MOSFET used in circuit are shown as below. Both components should follow a design in
BSIM3 model, which is given in the project `src/` folder.

<p align="center">
<img src="https://user-images.githubusercontent.com/3256544/41701218-8153c968-74e0-11e8-9a2b-52b9542c440f.png" alt="drawing2" height="350"/>
</p>

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
