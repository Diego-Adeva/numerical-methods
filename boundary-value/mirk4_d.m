function [t,x] = mirk4_d(fun,tinic,tfin,x0,N,par,pqr)
% MIRK4_D  Same as mirk4, but fun takes the extra argument pqr:
%          fun(t,x,pqr,par). Used by midisplin (shooting method).
%
%   [t,x] = mirk4_d(fun,tinic,tfin,x0,N,par,pqr)
h=(tfin-tinic)/N;
t=tinic:h:tfin;
x=zeros(size(x0,1),N+1);
x(:,1)=x0(:);
for i=1:N
k1 = fun(t(i), x(:,i),pqr,par);

k2 = fun(t(i) + h/2, x(:,i) + (h/2)*k1,pqr,par);

k3 = fun(t(i) + h/2, x(:,i) + (h/2)*k2,pqr,par);

k4 = fun(t(i) + h,x(:,i) + h*k3,pqr,par);

x(:,i+1) = x(:,i) + (h/6)*(k1 + 2*k2 + 2*k3 + k4);
end

