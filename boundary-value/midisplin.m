function [t,x]=midisplin(pqr,tinic,tfin,x0,par,N,c1,c2)
% MIDISPLIN  Linear shooting method for the boundary value problem
%            x'' = p(t)x' + q(t)x + r(t),  t in [tinic,tfin].
%
%   [t,x] = midisplin(pqr,tinic,tfin,x0,par,N,c1,c2)
%
%   Inputs:  pqr   - cell {p,q,r} of function handles of t
%            x0    - [left value; right value] of the boundary data
%            c1    - 0: x(tinic) = x0(1) (Dirichlet);  1: x'(tinic) = x0(1)
%            c2    - 0: x(tfin)  = x0(2) (Dirichlet);  1: x'(tfin)  = x0(2)
%            N     - number of RK4 steps;  par - passed through to mirk4_d
%   Outputs: t - times;  x - 2 x (N+1) matrix, rows [x; x']
%   Note: if the homogeneous solution vanishes at the right boundary, the
%         problem has infinitely many solutions or none; a message is shown.
fun1=@fundisplin1;
fun2=@fundisplin2;
valor_inic_1=[];
valor_inic_2=[];
if c1==1
    valor_inic_1=[0;x0(1)];
    valor_inic_2=[1;0];

else
    valor_inic_1=[x0(1);0];
    valor_inic_2=[0;1];
end
[t,v1]=mirk4_d(fun1,tinic,tfin,valor_inic_1,N,par,pqr);
[~,v2]=mirk4_d(fun2,tinic,tfin,valor_inic_2,N,par,pqr);

if c2==0

    if abs(v2(1,end))<1e-12
    display("Hay infinitas soluciones de la forma x=v1+sv2 para todo s de R")
    s=1;
    
    else
        s = (x0(2)-v1(1,end))/v2(1,end);
    end
else
    if abs(v2(2,end))<1e-12
    display("Hay infinitas soluciones de la forma x=v1+sv2 para todo s de R")
    s=1;
    else
        s = (x0(2)-v1(2,end))/v2(2,end);
    end
end

x=v1+s*v2;