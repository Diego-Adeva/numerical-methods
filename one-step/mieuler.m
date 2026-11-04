function [t,u] = mieuler(fun,tinic,tfin,x0,N,par)
% MIEULER  Solves x' = fun(t,x,par), x(tinic) = x0, with the explicit
%          Euler method (order 1, fixed step).
%
%   [t,u] = mieuler(fun,tinic,tfin,x0,N,par)
%
%   Inputs:  fun - handle fun(t,x,par) returning a column vector
%            tinic, tfin - initial and final times
%            x0 - initial condition;  N - number of steps;  par - parameters for fun
%   Outputs: t - row vector of N+1 times;  u - d x (N+1) solution matrix
h=(tfin-tinic)/N;
t=tinic:h:tfin;
u=zeros(size(x0,1),N+1);
u(:,1)=x0(:);
for i=1:N
    u(:,i+1) = u(:,i) + h * fun(t(i), u(:,i),par);
end
                    



