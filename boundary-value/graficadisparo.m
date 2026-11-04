% GRAFICADISPARO  Plots the shooting-method solution (run midisplin first)
%                 and its global error against the exact solution solex1.
figure(1)
subplot(2,1,1)

plot(t,x(1,:),"g")

subplot(2,1,2)

plot(t,x(2,:),"r")

solex=arrayfun(@solex1,t);
error=abs(x(1,:)-solex);
figure; % Abre una nueva ventana
plot(t, error, 'r'); % Grafica la diferencia en rojo
grid on; % Añade rejilla para mejor lectura
title('Diferencia entre solución exacta y aproximada');
xlabel('Tiempo t');
ylabel('|x(t_n) - x_n|');
legend('Error global');