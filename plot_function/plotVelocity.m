% 输出三个小球速度变化图与角度变化图
function plotVelocity(vx, vy)
    global dt time_end;    
    % 速度
    v = sqrt(vx.^2 + vy.^2);
    t = (0:dt:time_end)'*ones(1,3);
    % 角度
    theta = acos(vx./v);
    theta(vx>0&vy<0) = 2*pi-theta(vx>0&vy<0);
    theta(vx<0&vy<0) = (pi-theta(vx<0&vy<0))+pi;
    figure
    plot(t, v, 'linewidth', 1.2)
    box on
    xlabel('Time', 'fontsize', 16)
    ylabel('Velocity' , 'fontsize', 16)
    set(gca, 'linewidth', 1.2)
    figure
    plot(t,theta, 'linewidth', 1.2)
    xlabel('Time', 'fontsize', 16)
    ylabel('Angle \theta' , 'fontsize', 16)
    set(gca, 'linewidth', 1.2)
end