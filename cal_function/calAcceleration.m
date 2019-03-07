% 计算x与y轴加速度变化量da(3x2)
function da = calAcceleration(pos)
    global m;
    % 小球数量
    [n, ~] = size(pos);
    da = zeros(n, 2);
    for i = 1:n
        dax = 0;
        day = 0;
        for j = 1:n
            if i ~= j
                % i小球和j小球相对角度与距离
                [theta, r] = calRelatively(pos(i,:), pos(j,:));
                % 两个小球的引力大小
                F = calGravitation(r, i, j);
                % 第i个小球收到来自j的加速度分量
                dax = dax + F/m(i)*cos(theta);
                day = day + F/m(i)*sin(theta);
            end
        end
        da(i,:) = [dax, day];
    end
end