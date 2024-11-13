function [ys,yi_or_p] = orthofit(x,y,n)

% Reshape
x = x(:);
siz0 = size(y);
y = y(:);

% Coefficients of the orthogonal polynomials
p = zeros(3,n+1);
p(2,2) = mean(x);

N = length(x);
PL = ones(N,n+1);
PL(:,2) = x-p(2,2);
for i = 3:n+1
    p(2,i) = sum(x.*PL(:,i-1).^2)/sum(PL(:,i-1).^2);
    p(3,i) = sum(x.*PL(:,i-2).*PL(:,i-1))/sum(PL(:,i-2).^2);
    PL(:,i) = (x-p(2,i)).*PL(:,i-1)-p(3,i)*PL(:,i-2);
end
p(1,:) = sum(repmat(y,[1,n+1]).*PL)./sum(PL.^2);


if nargin<4 || (nargin==4 && nargout==2)
    ys = sum(PL.*repmat(p(1,:),[N,1]),2);
    ys = reshape(ys,siz0);
end