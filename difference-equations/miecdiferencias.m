function X=miecdiferencias(x0,x1,N)
% MIECDIFERENCIAS  Computes the first N terms of a second-order recurrence
%                  X(n+2) = funecdif([X(n), X(n+1)]), with X(1)=x0, X(2)=x1.
%
%   X = miecdiferencias(x0,x1,N)   (requires N >= 2)
X=zeros(1,N);
X(1)=x0;
X(2)=x1;
for n=1:N-2
    X(n+2)=funecdif([X(n),X(n+1)]);
end

