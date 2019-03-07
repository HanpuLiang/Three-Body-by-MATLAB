% 绘制轨迹
function plotCurrentTrace(pos, t)
    global x_min x_max y_min y_max;
    if t ~= 0
        [a, ~, ~] = size(pos);
        hold on
        axis equal
        box on
        grid on
        set(gca, 'linewidth', 1.5)
        axis([x_min x_max y_min y_max])
        for i = 1:a
            x = zeros(1, t);
            y = zeros(1, t);
            for j = 1:t
                x(j) = pos(i, 1, j);
                y(j) = pos(i, 2, j);
            end
            plot(x, y, 'linewidth', 1.5)
        end
    end
end