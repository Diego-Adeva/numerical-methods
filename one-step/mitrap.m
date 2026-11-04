function [t,x] = mitrap(fun,tinic,tfin,x0,N,jac,itmax,par)
% MITRAP  Solves x' = fun(t,x,par) with the implicit trapezoidal rule (order 2).
%         Each step solves the nonlinear equation with Newton's method.
%
%   [t,x] = mitrap(fun,tinic,tfin,x0,N,jac,itmax,par)
%
%   Inputs:  fun, tinic, tfin, x0, N, par - as in mieuler
%            jac   - handle jac(t,x,par) returning the Jacobian of fun w.r.t. x
%            itmax - maximum Newton iterations per step
%            (Newton stops when the update is smaller than h^3)
%   Outputs: t - row vector of N+1 times;  x - d x (N+1) solution matrix
h=(tfin-tinic)/N;
t=tinic:h:tfin;
x=zeros(length(x0),N+1);
x(:,1)=x0;
m=length(x0);
for i=1:N
iter=1;
Z=zeros(m,itmax+1);
Z(:,1)=x(:,i);
F=@(z)z-x(:,i)-h/2*(fun(t(i),x(:,i),par)+fun(t(i+1),z,par));
DF=@(z) eye(m)-h/2*jac(t(i+1),z,par);
error=1;
    while (error>h^3 && iter<itmax)
    Z(:,iter+1) = Z(:,iter) - DF(Z(:,iter))\F(Z(:,iter)); 
    error = norm(Z(:,iter+1)-Z(:,iter));
    iter=iter+1;
    end
x(:,i+1)=Z(:,iter);
end
                    
