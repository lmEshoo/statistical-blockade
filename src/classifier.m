clc;
clear;

% % % %  Set all 60 lines into 1 line from documentation
% % % %  Each row of X corresponds to one observation 
% % % %  (also known as an instance or example), and 
% % % %  each column corresponds to one predictor 
% % % %  (also known as a feature).


% % % % % % % % % % % % % % % % % % % % % % %
% % % % % %      Process data     % % % % % % 
% % % % % % % % % % % % % % % % % % % % % % %

%Process failing samples
failed_train = importdata("training_fail_samples");
post_failed_train = zeros(4,360);
j=1;
count = 1;
%go through all lines
for i=1:length(failed_train.data)
    post_failed_train(j,count:count+5) = failed_train.data(i,:);
    count = count + 6;
    if mod(i,60)==0
        j=j+1;
        count = 1;
     end

end

%post_failed_train(1,:)
%size(post_failed_train)
 
%Process passing samples
passed_train = importdata("training_pass_samples");
post_passed_train = zeros(4,360);
j=1;
count = 1;

% length(passed_train.data)
%go through all lines
for i=1:length(passed_train.data)
    post_passed_train(j,count:count+5) = passed_train.data(i,:);
    count = count + 6;
    if mod(i,60)==0
        j=j+1;
        count = 1;
    end
end

%  post_passed_train(1,:);
%  size(post_passed_train)

% % % % % % % % % % % % % % % % % % % % % % % 
% % % % Build and Train the classifier % % % %
% % % % % % % % % % % % % % % % % % % % % % % 

[w,h]=size(post_failed_train);
y = ones(length(post_passed_train)+w,1);
y(1:w) = zeros(w,1);

X = [post_failed_train; post_passed_train];
% Mdl = fitcsvm(X,y, 'Standardize',true,'OptimizeHyperparameters','auto',...
%     'HyperparameterOptimizationOptions',struct('AcquisitionFunctionName',...
%     'expected-improvement-plus'));
Mdl = fitcsvm(X,y, 'Standardize',true);



% % % % % % % % % % % % % % % % % % % % % % % 
% % % % %  Generate MonteCarlo(n) % % % % % %
% % % % % % % % % % % % % % % % % % % % % % % 

sample_unit = 1000;
seed = 20160229;
rng(seed);

% construct mean and sigma for 360 variables
sample_means = zeros(1,360);
sample_sigmas = zeros(1,360);
p_mean=[2.7e-9 5.1e-9 1.8e-8 -0.396 8.80736e-3 -0.15];
n_mean=[2.37e-9 5.8e-9 1.7e-8 0.329 0.02605 -0.154];
p_sigma=[3.376e-20 4.277e-21 5.687e-20 1.150e-2 4.196e-5 1.797e-3];
n_sigma=[3.602e-22 4.681e-20 1.156e-19 1.094e-2 5.942e-6 1.367e-2];
for i=1:10
    sample_means(:,36*(i-1)+1:36*(i-1)+18) = [p_mean p_mean p_mean];
    sample_means(:,36*(i-1)+19:36*(i-1)+36) = [n_mean n_mean n_mean];
    sample_sigmas(:,36*(i-1)+1:36*(i-1)+18) = [p_sigma p_sigma p_sigma];
    sample_sigmas(:,36*(i-1)+19:36*(i-1)+36) = [n_sigma n_sigma n_sigma];
end

samples = monteCarlo(sample_means, sample_sigmas, sample_unit);


% % % % % % % % % % % % % % % % % % % % % % % 
% % % %         Predict         % % % % % % %
% % % % % % % % % % % % % % % % % % % % % % % 

tails = samples(find(predict(Mdl,samples)==0),:)
save('saveTail.mat','tails') 