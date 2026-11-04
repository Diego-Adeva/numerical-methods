function [t,x] = mirk4(fun,tinic,tfin,x0,N,par)
% MIRK4  Solves the IVP x' = fun(t,x,par), x(tinic) = x0, using the
%        classical fourth-order Runge-Kutta method with fixed step size.
%
%   [t,x] = mirk4(fun,tinic,tfin,x0,N,par)
%
%   Inputs:
%     fun   - function handle fun(t,x,par) returning a column vector
%     tinic - initial time
%     tfin  - final time
%     x0    - initial condition (vector)
%     N     - number of steps (step size h = (tfin-tinic)/N)
%     par   - parameters passed to fun
%
%   Outputs:
%     t     - row vector of N+1 equally spaced times
%     x     - d x (N+1) matrix; column i is the approximation at t(i)
h=(tfin-tinic)/N;
t=tinic:h:tfin;
x=zeros(size(x0,1),N+1);
x(:,1)=x0(:);
for i=1:N
k1 = fun(t(i), x(:,i),par);

k2 = fun(t(i) + h/2, x(:,i) + (h/2)*k1,par);

k3 = fun(t(i) + h/2, x(:,i) + (h/2)*k2,par);

k4 = fun(t(i) + h,x(:,i) + h*k3,par);

x(:,i+1) = x(:,i) + (h/6)*(k1 + 2*k2 + 2*k3 + k4);
end

