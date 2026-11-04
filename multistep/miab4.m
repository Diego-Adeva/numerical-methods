function [t,x] = miab4(fun,tinic,tfin,x0,N,par)
% MIAB4  Solves x' = fun(t,x,par) with the 4-step Adams-Bashforth method
%        (explicit, order 4). The first 4 values are computed with mirk4.
%
%   [t,x] = miab4(fun,tinic,tfin,x0,N,par)   (requires N >= 3)
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
for i=4:N
x(:,i+1)=x(:,i)+h/24*(55*f(:,i)-59*f(:,i-1)+37*f(:,i-2)-9*f(:,i-3));
f(:,i+1) = fun(t(i+1),x(:,i+1),par);
end
