function f=funcorazon(t,x,par)
% FUNCORAZON  Forced oscillator x'' = -16x + 4sin(2t) as a first-order system.
%             State x = [x; x']. par is unused.
f=[x(2);-16*x(1)+4*sin(2*t)];