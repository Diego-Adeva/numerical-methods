function [t,x] = mimilne(fun,tinic,tfin,x0,N,par)
% MIMILNE  Solves x' = fun(t,x,par) with Milne's explicit 4-step formula
%          x(i+1) = x(i-3) + 4h/3*(2f(i) - f(i-1) + 2f(i-2))   (order 4).
%          The first 4 values are computed with mirk4.
%          Note: this formula is only weakly stable.
%
%   [t,x] = mimilne(fun,tinic,tfin,x0,N,par)   (requires N >= 3)
%
%   Inputs and outputs: same as mieuler. Calls mirk4.
h=(tfin-tinic)/N;
t=tinic:h:tfin;
x = zeros(length(x0),N+1);
f = zeros(length(x0),N+1);   
[~,xinit] = mirk4(fun,tinic,t(4),x0,3,par);
x(:,1:4) = xinit;
for i = 1:4
f(:,i) = fun(t(i),x(:,i),par);
end
for i = 4:N 
x(:,i+1) = x(:,i-3) + 4*h/3*(2*f(:,i) - f(:,i-1) + 2*f(:,i-2));
f(:,i+1) = fun(t(i+1),x(:,i+1),par);   
end
