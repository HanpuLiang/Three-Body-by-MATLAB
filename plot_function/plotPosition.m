% 做运动图像并保存视频
function plotPosition(pos, vx, vy, time)
    global isOutVideo;
    figure(1)
    if isOutVideo == true
        % 创建视频句柄，视频名称three_body.avi
        writerObj = VideoWriter('three_body.avi');
        open(writerObj);
        myMovie(1:length(time)) = struct('cdata', [], 'colormap', []);
    end
    % 迭代计算得到图像
    for t = 1:length(time)
        plotPosVec(pos(:,:,t), vx(t,:), vy(t,:), t, pos)
        if isOutVideo == true
            frame = getframe;
            % 修改帧参数
            frame.cdata = imresize(frame.cdata, [685, 685]);
            writeVideo(writerObj, frame);
        end
    end
    % 关闭视频句柄
    if isOutVideo == true
        close(writerObj);
    end
end