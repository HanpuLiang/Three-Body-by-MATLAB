% 计算小球的速度变化
function [vx, vy] = calVelocity(vx_p, vy_p, da)
    global dt;
    vx = vx_p + dt*da(:,1)';
    vy = vy_p + dt*da(:,2)';
end