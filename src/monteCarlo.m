function samples = monteCarlo(sample_means, sample_sigmas, sample_unit) 
%% Sampling

% "samples" should be a sample_unit-by-360 matrix
samples = zeros(sample_unit, 360);

% % generate QMC samples, add iter to function input
% p = haltonset(360, 'Skip', 1e3, 'Leap', 1e2);
% p = scramble(p, 'RR2');
% num = iter * sample_unit;
% points = net(p, num);
% for i = 1:sample_unit
%     ind = i + (iter-1)*sample_unit;
%     samples(i, :) = norminv(points(ind, :), sample_means, sample_sigmas);
% end

% generate MC samples
for i = 1:sample_unit
    samples(i,:) = normrnd(sample_means, sample_sigmas);
end

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
for i = 1:sample_unit
    for j = 1:60
        for k = 1:6
            fprintf(fid1, '%e\t', samples(i,(j-1)*6+k));
        end  
        fprintf(fid1, '\n'); 
    end
end

fprintf(fid1, '.ENDDATA\n');
fclose(fid1);

