function fun=solex1(t)
% SOLEX1  Exact solution t*cos(pi*t) of the boundary value problem in
%         mispracticas.m (last case); used to measure the shooting error.
fun=t.*cos(pi.*t);