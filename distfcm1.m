function out = distfcm1(center, data)

out = zeros(size(center, 1), size(data, 1));

% fill the output matrix
if size(center, 2) > 1
    for k = 1:size(center, 1)
	out(k, :) = sqrt(sum(((data-ones(size(data, 1), 1)*center(k, :)).^2)'));
    end
else	% 1-D data    
	out = abs(center(1)-data)';
end
out(isnan(0.\out))=0.01;