function fun=funvanderpol(t,x,par)
% FUNVANDERPOL  Van der Pol oscillator x'' = alpha*(beta - x^2)*x' - x
%               as a first-order system. par = [alpha, beta].
alpha=par(1);
beta=par(2);
fun=[x(2,:); -alpha*(x(1,:).^2-beta)*x(2,:)-x(1,:)];