function [t,x,H,error,rechazo] = mirkf45(fun,tinic,tfin,x0,par,h0,hmin,tol)
% MIRKF45  Solves x' = fun(t,x,par), x(tinic) = x0, with the embedded
%          Runge-Kutta-Fehlberg 4(5) method and adaptive step size.
%          The error estimate is the difference between the 5th- and
%          4th-order solutions; the 5th-order one is propagated.
%
%   [t,x,H,error,rechazo] = mirkf45(fun,tinic,tfin,x0,par,h0,hmin,tol)
%
%   Inputs:  fun, tinic, tfin, x0, par - as in mieuler
%            h0 - initial step;  hmin - minimum allowed step;  tol - tolerance
%   Outputs: t - times;  x - solution matrix;  H - accepted step sizes
%            error - error estimate of every attempted step
%            rechazo - number of rejected steps
n=1;
c = [0;1/4;3/8;12/13;1;1/2];
hmax = (tfin-tinic)/100;
fac = 0.9;
facmax = 5;
a = zeros(6,6);
a(2,1) = 1/4;
a(3,1) = 3/32;     a(3,2) = 9/32;
a(4,1) = 1932/2197;  a(4,2) = -7200/2197;  a(4,3) = 7296/2197;
a(5,1) = 439/216;    a(5,2) = -8;           a(5,3) = 3680/513;    a(5,4) = -845/4104;
a(6,1) = -8/27;      a(6,2) = 2;            a(6,3) = -3544/2565;  a(6,4) = 1859/4104;  a(6,5) = -11/40;
K=zeros(length(x0),6);
berr=[1/360;0;-128/4275;-2197/75240;1/50;2/55];
bsol=[16/135;0;6656/12825;28561/56430;-9/50;2/55];
x(:,1)=x0;
h=h0;
H=[];
rechazo=0;
error=[];
t(1)=tinic;
while t(n)<tfin
    last = (h >= tfin-t(n));      % final step: land exactly on tfin
    if last
        h = tfin-t(n);
    end
    for i=1:6
        suma = 0;
        for j = 1:i-1
            suma = suma + a(i,j)*K(:,j);
        end
        K(:,i) = fun(t(n) + c(i)*h, x(:,n) + h*suma, par);
    end
    ERR = norm(h*(K*berr));
    error = [error ERR];
    if h<hmin && ~last
        disp('el paso no puede ser menor que hmin')
        break
    elseif ERR<tol
        x(:,n+1) = x(:,n) + h*(K*bsol);
        if last
            t(n+1) = tfin;
        else
            t(n+1) = t(n)+h;
        end
        H=[H h];
        n=n+1;
    else
        rechazo=rechazo+1;
    end
    hpos = fac*(tol/ERR)^(1/5);
    h = min(hmax,h*min(facmax,hpos));
end