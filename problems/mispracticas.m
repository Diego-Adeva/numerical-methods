% MISPRACTICAS  Problem selector: leave exactly one case uncommented.
%   Defines fun, x0, tinic, tfin, N, par (and jac, itmax for implicit methods;
%   pqr, c1, c2, solex for the boundary value case).
clear all
close all
%fun=@funvanderpol; x0=[-2;0]; tinic=0; tfin=50; N=2000; jac=@jacfunvanderpol; itmax=1000; par=[1,1];
%fun=@funcorazon; x0=[0;2]; tinic=0; tfin=2*pi; N=1000; jac=@jacfuncorazon; itmax=100; par=[];
%tinic=0; tfin=pi/2; x0=0; fun=@(t,x,par) -50*(x-cos(t)); jac=@(t,x,par) -50; N=40; itmax=100; par=[];
%fun=@funlorenz; par=[10,8/3,28]; x0=[-1;2;1]; tinic=0; tfin=50; N=5000;
%fun=@pendulo; x0=[pi/4;0]; tinic=0; tfin=10; N=1000; par=[0,1,9.8,0.2];
pqr={@(t) -2*pi^2*t, @(t) pi^2, @(t) -2*pi*(1+pi^2*t^2)*sin(pi*t)}; tinic=-1; tfin=1; x0=[1;-1]; par=[]; N=1000; c1=0; c2=1; solex=@solex1;