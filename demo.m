% This file demonstrates how to use the library by training a neural network on a small version of the MNIST database.
clear all

% 1 - Loads the mnist dataset. If it is not available, print where to download it.
load('HB_desc_lab');
load('truth_data');

data = cat(1,HB_desc_yes_i,HB_desc_no_i);
labels = y_train;

load('Features.mat');
test = Feat_mat;
test_labels = y_true + 1;
% 2 - Creates a default set of parameters.
parameters;
params.Nh = 2; % Use only one hidden layer for the demo.
params.nIter = 20; % Only do 10 passes through the data for the demo.
params.save = 0; % Do not save the network on disk for the demo.
params.nTrain = 100;
params.batchSize = 20;
params.nValidation = 0.3;

% 3 - Split the dataset into train+valid and test.
data_train = data;
labels_train = labels';

data_test = test;
labels_test = test_labels;

% 4 - Train the neural network.
[layers, errors, params, timeSpent] = nnet(data_train, labels_train, params);

% 5 - Test the network using the classification error.
[predicted, errors] = nnetTest(data_test, labels_test, 'class', layers);

% 6 - Display the test error.
fprintf('Test classification error rate: %g%%\n', 100*mean(errors));