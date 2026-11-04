% TEST_METODOS  Convergence-order check on x' = -x, x(0)=1, t in [0,1].
%   Doubling N should divide the error by about 2^p for a method of order p.

fun = @(t,x,par) -x;
jac = @(t,x,par) -1;
methods = {
  'mieuler',   @(N)mieuler(fun,0,1,1,N,[]),        1
  'mieulertr', @(N)mieulertr(fun,0,1,1,N,[]),      2
  'mitrap',    @(N)mitrap(fun,0,1,1,N,jac,100,[]), 2
  'mirk4',     @(N)mirk4(fun,0,1,1,N,[]),          4
  'miab4',     @(N)miab4(fun,0,1,1,N,[]),          4
  'mimilne',   @(N)mimilne(fun,0,1,1,N,[]),        4
  'miab4am3',  @(N)miab4am3(fun,0,1,1,N,[]),       4
  'mimilsimp', @(N)mimilsimp(fun,0,1,1,N,[]),      4
};

Ns = [50 100 200 400];
for m = 1:size(methods,1)
    errs = zeros(size(Ns));
    for k = 1:numel(Ns)
        [~,x] = methods{m,2}(Ns(k));
        errs(k) = abs(x(end) - exp(-1));
    end
    orders = log2(errs(1:end-1)./errs(2:end));
    fprintf('%-10s expected %d, observed %s\n', methods{m,1}, methods{m,3}, mat2str(orders,2));
end