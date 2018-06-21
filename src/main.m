clear all;
clc;
%% define sample size 
sample_training = 10000;
sample_filter = 5e5;
sample_unit = 100;
% threshold = 1.395e-10; % real delay time for failure
threshold = 1.375e-10; % initial delay time, relaxed

%% Configurations
% please do NOT modify any parameter in this section
seed = 20160229;
rng(seed)
total_error_counter = 0; % failures
pfail = 0;
fom = 0;
sample_n = 0;

% replace HSPICE_PATH with your HSPICE path 
hspice_path = 'hspice';

%% construct mean and sigma for 360 variables
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

%% Sample for training 
sample_size = sample_training;
results = zeros(sample_unit, 1);
fidP = fopen('training_pass_samples','w');
fprintf(fidP, '.DATA data\n');
fidF = fopen('training_fail_samples','w');
fprintf(fidF, '.DATA data\n');

while (sample_n(end) < sample_size)
    % call monteCarlo to generate samplings
    % samples = monteCarlo(sample_means, sample_sigmas, sample_unit, size(sample_n, 2));
    samples = monteCarlo(sample_means, sample_sigmas, sample_unit);
    
    % call spice to simualte samples
    [~,~] = dos([hspice_path, ' -i path_new.sp -o path_new.lis']);
    
    % Parse simulation results from '.lis
    fid = fopen('path_new.lis', 'r');
    idx = 1;
    while(1)
        line = fgetl(fid);
        if(~ischar(line))
            break;
        end
        
        key = 'td';
        ind = strfind(line, key);
        
        if(~isempty(ind))
            line(strfind(line, '=')) = [];
            time = sscanf(line(ind(1) + length(key):end), '%g', 1)';
            results(idx) = time;
            idx = idx+1;
        end
    end
    fclose(fid);
    
    % process spice results & record failure samples
    [sample_n, pfail, fom, total_error_counter] = postSpice(sample_n, sample_unit, threshold, total_error_counter, pfail, fom, results, samples, fidP, fidF); 
end

% close training sample storage files
fprintf(fidP, '.ENDDATA\n');
fclose(fidP);
fprintf(fidF, '.ENDDATA\n');
fclose(fidF);

%% Classifier construction & tuning

%% Sampling for filtering

%% Tail GPD modeling 

