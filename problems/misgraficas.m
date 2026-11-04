dim = size(x0,1);
if dim == 1
    plot(t,x(1,:))
end
if dim == 2
    figure(1)
    subplot(2,1,1)
    plot(t,x(1,:),"g")
    subplot(2,1,2)
    plot(t,x(2,:),"r")
    figure(2)
    plot( x ( 1 , : ) , x ( 2 , : ),"r")
end
if dim == 3
    figure(1)
    subplot(3,1,1)
    plot(t,x(1,:),"r")
    subplot(3,1,2)
    plot(t,x(2,:),"g")
    subplot(3,1,3)
    plot(t,x(3,:),"b")
    %figure(2)
    %plot3(x(1,:), x(2,:), x(3,:))
    figure(2)
    grid on
    xlabel('x')
    ylabel('y')
    zlabel('z')
    view(45,30)
    axis tight
    
    h = animatedline('Color','b','LineWidth',1);
    
    for k = 1:length(t)
        addpoints(h, x(1,k), x(2,k), x(3,k));
        drawnow
    end
    
end