function y=jacfunvanderpol(t,x,par)
% JACFUNVANDERPOL  Jacobian of funvanderpol with respect to x. par = [alpha, beta].
alpha=par(1);
beta=par(2);
y=[0,1; -2*alpha*x(1)*x(2)-1, -alpha*(x(1)^2-beta)];