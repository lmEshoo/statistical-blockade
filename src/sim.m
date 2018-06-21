clear all;
clc;


%threshold = 1.395e-10; % real delay time for failure
 threshold = 1.375e-10; % initial delay time, relaxed

% replace HSPICE_PATH with your HSPICE path 
hspice_path = 'hspice';

% Sample for Simulation
example = matfile('saveTail.mat');
samples = example.tails;

[w2,h2]=size(samples);
sample_size = w2;
results = zeros(sample_size, 1);


%% Generate sweep_data_mc file for Simulation
% write MC or QMC sample into sweep file 
fid1 = fopen('sweep_data_mc','w');
fprintf(fid1, '.DATA data\n');

% write header to file
for i = 1:10
    for j = 1:3
        pNum = sprintf('_p%d%d', i, j);
        stringP = sprintf('toxe%s xl%s xw%s vth0%s u0%s voff%s', pNum, pNum, pNum, pNum, pNum, pNum);
        fprintf(fid1, stringP);
        fprintf(fid1, '\n');
    end
    for j = 1:3
        nNum = sprintf('_n%d%d', i, j);
        stringN = sprintf('toxe%s xl%s xw%s vth0%s u0%s voff%s', nNum, nNum, nNum, nNum, nNum, nNum);
        fprintf(fid1, stringN);
        fprintf(fid1, '\n');
    end
end

% write sample
for i = 1:sample_size
    for j = 1:60
        for k = 1:6
            fprintf(fid1, '%e\t', samples(i,(j-1)*6+k));
            
        end  
        fprintf(fid1, '\n'); 
    end
end

fprintf(fid1, '.ENDDATA\n');
fclose(fid1);



%%
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
errors=find(results > threshold);
XX = find(results > threshold);
% samples(XX,:)  % This is the actual failed samples from simulation
% [a,k] = fitgpd_pwm(results(XX,:), threshold);
% k=k*-1;
% F = gpdcdf(a, k, results(XX,:));

figure
plot(results(XX,:), gppdf(results(XX,:),-0.0213))
xlabel('x (tails from Fsim)') % x-axis label
ylabel('F(x) ') % y-axis label
% plot(samples(XX,:))
% axis([1.2e-10 1.4e-10 0 inf])