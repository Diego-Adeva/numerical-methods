function [t,x] = mimilsimp(fun,tinic,tfin,x0,N,par)
% MIMILSIMP  Solves x' = fun(t,x,par) with a predictor-corrector pair:
%            Milne's formula (predictor) and Simpson's rule (corrector).
%            Order 4, fixed step. The first 4 values are computed with mirk4.
%
%   [t,x] = mimilsimp(fun,tinic,tfin,x0,N,par)   (requires N >= 3)
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
    
    % Predictor M4
    x_pred = x(:,i-3) + 4*h/3*(2*f(:,i) - f(:,i-1) + 2*f(:,i-2));
    f_pred = fun(t(i+1),x_pred,par);   
    
    % Corrector MS2
    x(:,i+1) = x(:,i-1) + h/3*(f(:,i-1) + 4*f(:,i) + f_pred);
    
    f(:,i+1) = fun(t(i+1),x(:,i+1),par);
    
end