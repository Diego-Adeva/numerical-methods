function dx=fundisplin2(t,x,pqr,par)
% FUNDISPLIN2  Homogeneous version of fundisplin1 (r = 0):
%              x'' = p(t)x' + q(t)x, with state x = [x; x'].
dx=zeros(2,1);
dx(1)=x(2);
dx(2)=feval(pqr{1},t)*x(2)+feval(pqr{2},t)*x(1);