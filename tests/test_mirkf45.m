% TEST_MIRKF45  Adaptive RKF45 on x' = -x, x(0)=1, t in [0,1].
fun = @(t,x,par) -x;
[t,x,H,err,rechazo] = mirkf45(fun,0,1,1,[],0.5,1e-12,1e-10);
fprintf('t(end) = %g (expected 1)\n', t(end));
fprintf('error at tfin = %.2e (expected < 1e-8)\n', abs(x(end)-exp(-1)));
fprintf('rejected steps = %d (expected > 0)\n', rechazo);