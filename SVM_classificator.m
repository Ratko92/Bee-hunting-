clear all
% read the data set
load('Features_all');

% Determine the train and test index
train_number = 50;
trainLabel = zeros(2*train_number,1);
trainLabel = [ ones(train_number,1); zeros(train_number,1)];
trainData = [Feat_mat_yes(1:train_number,:);Feat_mat_no(1:train_number,:)];
testLabel = [ ones(size(Feat_mat_yes,1)-train_number,1); zeros(size(Feat_mat_no,1)-train_number,1)];
testData  = [Feat_mat_yes(train_number+1:end,:);Feat_mat_no(train_number+1:end,:)];
trainData_norm = [Feat_mat_reg_yes(1:train_number,:);Feat_mat_reg_no(1:train_number,:)];
testData_norm = [Feat_mat_reg_yes(train_number+1:end,:);Feat_mat_reg_no(train_number+1:end,:)];


% Train the SVM
model = svmtrain(trainLabel, trainData_norm, '-t 2  -c 10.0 -g 0.4 -b 1');
% Use the SVM model to classify the data
[predict_label, accuracy, prob_values] = svmpredict(testLabel, testData_norm(:,[1,3,4]), model, '-b 1'); % run the SVM model on the test data

conf_mat(predict_label+1,testLabel+1,2)