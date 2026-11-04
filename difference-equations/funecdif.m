function y=funecdif(x)
% FUNECDIF  Right-hand side of the recurrence X(n+2) = 4*X(n+1) - 3*X(n).
%           Input x = [X(n), X(n+1)]; output y = X(n+2).
y = 4*x(2)-3*x(1);
