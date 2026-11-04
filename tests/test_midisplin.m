% TEST_MIDISPLIN  Shooting method on x'' = x, x(0)=0, x(1)=sinh(1).
pqr = {@(t) 0, @(t) 1, @(t) 0};
Ns = [20 40 80];
errs = zeros(size(Ns));
for k = 1:numel(Ns)
    [t,x] = midisplin(pqr,0,1,[0; sinh(1)],[],Ns(k),0,0);
    errs(k) = max(abs(x(1,:) - sinh(t)));
end
fprintf('midisplin  expected 4, observed %s\n', mat2str(log2(errs(1:end-1)./errs(2:end)),2));