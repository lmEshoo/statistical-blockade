function [sample_n, pfail, fom, total_error_counter] = postSpice(sample_n, sample_unit, threshold, total_error_counter, pfail, fom, results, samples, fidP, fidF)
%% post processing HSpice results
sample_n = [sample_n, sample_n(end)+sample_unit];
error_counter = nnz(results > threshold);
total_error_counter = total_error_counter + error_counter;

pfail = [pfail total_error_counter/sample_n(end)]; 
fom = [fom std(pfail)/mean(pfail)];

str = sprintf('%d out of %d samples failed(%d/%d), failure rate = %e, FOM = %e', total_error_counter, sample_n(end), error_counter, sample_unit, pfail(end), fom(end));
disp(str);

% write fail training sample, as many as possible
if error_counter > 0
    for i = 1:sample_unit
        if results(i) > threshold
            for j = 1:60
                for k = 1:6
                    fprintf(fidF, '%e\t', samples(i,(j-1)*6+k));
                end  
                fprintf(fidF, '\n'); 
            end
        end
    end
end

% write pass training sample, about 1000
if sample_n(end) < 1000
    for i = 1:sample_unit
        if results(i) < threshold
            for j = 1:60
                for k = 1:6
                    fprintf(fidP, '%e\t', samples(i,(j-1)*6+k));
                end  
                fprintf(fidP, '\n'); 
            end
        end
    end
end


