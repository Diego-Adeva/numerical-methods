% TEST_MIECDIFERENCIAS  Recurrence X(n+2) = 4X(n+1) - 3X(n), X(1)=2, X(2)=4.
%   Exact solution: X(n) = 1 + 3^(n-1).
N = 10;
X = miecdiferencias(2,4,N);
exact = 1 + 3.^((1:N)-1);
fprintf('miecdiferencias  max error = %g (expected 0)\n', max(abs(X-exact)));