function dx=fundisplin1(t,x,pqr,par)
% FUNDISPLIN1  First-order system for x'' = p(t)x' + q(t)x + r(t),
%              with state x = [x; x']. pqr = {p, q, r} (function handles).
dx=zeros(2,1);
dx(1)=x(2);
dx(2)=feval(pqr{1},t)*x(2)+feval(pqr{2},t)*x(1)+feval(pqr{3},t);