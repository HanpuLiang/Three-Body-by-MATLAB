% 作图位置+速度矢量
function plotPosVec(pos, vx, vy, t, pos_all)
    % 小球
    global x_min x_max y_min y_max;
    figure(1)
    scatter(pos(:,1), pos(:,2), 'ok', 'filled')
    % 图像细节调整
    axis equal
    box on
    grid on
    set(gca, 'linewidth', 1.5, 'xtick', floor(linspace(x_min, x_max, 11)), 'ytick', floor(linspace(y_min, y_max, 11)))
    hold on
    % 三条速度线
    for i = 1:length(vx)
        line([pos(i,1) pos(i,1)+vx(i)/2], [pos(i,2), pos(i,2)+vy(i)/2], 'linewidth', 1.2)
    end
    % 添加轨道线
    plotCurrentTrace(pos_all, t)
    % 添加文本
    text(x_max*13/25, y_min*20/25, 'Made By Liang Hanpu', 'horiz', 'center', 'color', 'r')
    axis([x_min x_max y_min y_max])
    hold off
end