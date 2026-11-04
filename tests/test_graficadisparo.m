% TEST_GRAFICADISPARO  Shooting method on x'' = p x' + q x + r in [-1,1] with
%   x(-1) = 1 (Dirichlet) and x'(1) = -1 (derivative condition).
%   Exact solution: x(t) = t*cos(pi*t)  (solex1).
%   Checks the convergence order (expected 4, from RK4) and then runs
%   graficadisparo to make sure the plotting script works.

pqr = {@(t) -2*pi^2*t, @(t) pi^2, @(t) -2*pi*(1+pi^2*t^2)*sin(pi*t)};
tinic = -1; tfin = 1; x0 = [1; -1]; par = []; c1 = 0; c2 = 1;

Ns = [20 40 80 160];
errs = zeros(size(Ns));
for k = 1:numel(Ns)
    [t,x] = midisplin(pqr,tinic,tfin,x0,par,Ns(k),c1,c2);
    errs(k) = max(abs(x(1,:) - solex1(t)));
end
fprintf('Errors:   %s\n', mat2str(errs,3));
fprintf('midisplin (c2=1)  expected 4, observed %s\n', ...
        mat2str(log2(errs(1:end-1)./errs(2:end)),2));

% Boundary conditions satisfied by the numerical solution
fprintf('x(-1)  = %.6f (expected  1)\n', x(1,1));
fprintf('x''(1)  = %.6f (expected -1)\n', x(2,end));

% Run the plotting script on the last solution (N = 160)
close all
graficadisparo