function [x,y] = limits(a)

if nargin~=1 | nargout>2 %bogus syntax
    error('usage: [lo,hi]=limits(a)')
end

siz = size(a);

if prod(siz)==1 % scalar
    result = a;                         
else % matrix
    result = [min(a(:)) max(a(:))]; % limits
end

if nargout==1 % composite result
    x = result;                         % 1x2 vector
elseif nargout==2 % separate results
    x = result(1);                      % two scalars
    y = result(2);
else % no result
    ans = result;                        
end