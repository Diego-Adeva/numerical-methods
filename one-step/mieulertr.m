function [t,x] = mieulertr(fun,tinic,tfin,x0,N,par)
% MIEULERTR  Solves x' = fun(t,x,par) with Heun's method (explicit trapezoidal
%            rule): an Euler step predicts x(i+1), a trapezoidal step corrects it.
%            Order 2, fixed step.
%
%   [t,x] = mieulertr(fun,tinic,tfin,x0,N,par)
%
%   Inputs and outputs: same as mieuler. Calls mieuler.
h=(tfin-tinic)/N;
t=tinic:h:tfin;
x=zeros(length(x0),N+1);
x(:,1)=x0;
for i=1:N
[~,x_pred]=mieuler(fun,t(i),t(i+1),x(:,i),1,par);
x(:,i+1) = x(:,i) + h/2 *( fun(t(i),x(:,i),par) + fun(t(i+1),x_pred(:,end),par));
end
