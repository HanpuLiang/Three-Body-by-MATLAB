% 计算小球的位移变化
function pos = calDisplacement(vx, vy, pos_p)
    global dt;
    vx = vx';
    vy = vy';
    % 计算下一时刻的坐标
    pos(:,1) = pos_p(:,1) + (vx(:,1)+vx(:,2))/2*dt;
    pos(:,2) = pos_p(:,2) + (vy(:,1)+vy(:,2))/2*dt;
end