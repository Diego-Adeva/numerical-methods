\# Numerical Methods for ODEs (MATLAB)



From-scratch MATLAB implementations of classical numerical methods for

ordinary differential equations, each verified by a convergence-order test.



\## Methods



| Folder | Methods | Order |

|---|---|---|

| `one-step/` | Euler, Heun (explicit trapezoidal), implicit trapezoidal rule (Newton), RK4, Runge-Kutta-Fehlberg 4(5) with adaptive step | 1, 2, 2, 4, 4(5) |

| `multistep/` | Adams-Bashforth 4, AB4-AM3 predictor-corrector, Milne, Milne-Simpson | 4 |

| `boundary-value/` | Linear shooting method (Dirichlet and derivative conditions) | 4 |

| `difference-equations/` | Iteration of second-order recurrences | - |



`problems/` contains test systems: Lorenz, Van der Pol, damped pendulum and a forced oscillator.



\## Usage



```matlab

addpath(genpath(pwd))

fun = @(t,x,par) -x;

\[t,x] = mirk4(fun, 0, 1, 1, 100, \[]);   % x' = -x, x(0) = 1

```



All right-hand sides have the form `fun(t,x,par)`; Jacobians `jac(t,x,par)`.

Run `problems/mispracticas.m` to select a sample problem and plot it.



\## Verification



Scripts in `tests/` check each method against exact solutions and report the

observed convergence order, e.g. halving the step size divides the RK4 error by \~16.



\## Notes

Milne's method is only weakly stable, so it can behave poorly on long intervals.

