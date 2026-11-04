function fun=pendulo(t,x,par)
% PENDULO  Damped, forced pendulum: theta'' = M - 2*B*theta' - (g/l)*sin(theta).
%          State x = [theta; theta']. par = [M, l, g, B]
%          (M: constant forcing, l: length, g: gravity, B: damping).
M=par(1);
l=par(2);
g=par(3);
B=par(4);
fun=[x(2);M-2*B*x(2)-g*sin(x(1))/l];