% TEST_JACOBIANS  Checks each analytic Jacobian against central finite differences.
cases = {@funcorazon,   @jacfuncorazon,   [0.3;2],  [];
         @funvanderpol, @jacfunvanderpol, [-2;0.5], [2,3]};
e = 1e-6;
for k = 1:size(cases,1)
    f = cases{k,1}; J = cases{k,2}; x = cases{k,3}; par = cases{k,4};
    n = numel(x); Jfd = zeros(n);
    for j = 1:n
        d = zeros(n,1); d(j) = e;
        Jfd(:,j) = (f(0,x+d,par) - f(0,x-d,par))/(2*e);
    end
    fprintf('%-16s max difference %.2e (expected ~1e-8 or less)\n', ...
            func2str(f), max(max(abs(J(0,x,par) - Jfd))));
end