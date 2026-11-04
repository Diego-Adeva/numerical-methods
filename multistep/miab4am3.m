function [t,x] = miab4am3(fun,tinic,tfin,x0,N,par)
% MIAB4AM3  Solves x' = fun(t,x,par) with a predictor-corrector pair:
%           Adams-Bashforth 4 (predictor) and Adams-Moulton 3 (corrector).
%           Order 4, fixed step. The first 4 values are computed with mirk4.
%
%   [t,x] = miab4am3(fun,tinic,tfin,x0,N,par)   (requires N >= 3)
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
    
    % Predictor AB4
    x_pred = x(:,i) + h/24*(55*f(:,i)-59*f(:,i-1)+37*f(:,i-2)-9*f(:,i-3));
    
    f_pred = fun(t(i+1),x_pred,par);
    
    % Corrector AM3
    x(:,i+1) = x(:,i) + h/24*(9*f_pred+19*f(:,i)-5*f(:,i-1)+f(:,i-2));
    
    f(:,i+1) = fun(t(i+1),x(:,i+1),par);
    
end
