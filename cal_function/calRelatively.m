% 计算两个小球的相对角度与距离
function [theta, r] = calRelatively(pos1, pos2)
    dx = pos2(1) - pos1(1);
    dy = pos2(2) - pos1(2);
    r = sqrt(dx^2 + dy^2);
    theta = acos(dx/r);
    % 因为cos值的两个象限需要区分，所以这里要变换
    if dy < 0 && dx >0
        theta = -theta;
    end
    if dx < 0 && dy < 0
        theta = (pi-theta)+pi;
    end
end