clc, clear, close all

%{ 
个人声明：
@author: Liang Hanpu
@bilibili ID: 小风寒呐
@date: 2019/3/3
@description: 本程序用于模拟多个有质量质点在二维平面内受到万有引力运动的运动情况。
    初始条件: 坐标, 速度大小, 速度方向, 质量
    基础参数: 结束时间, 时间间隔, 万有引力系数, 输出图像边界大小
    输出文件: 该程序运行完毕后, 会在改文件夹下创建出three_body.avi视频文件
@statement: 此程序修改, 转发时请注明原作者。
%}

%% 初始条件
addpath(genpath('./plot_function'))
addpath(genpath('./cal_function'))
% 初始条件为以圆心为(0, 0)半径r的圆上有三个等质量的点
r = 10;
% 坐标(等边三角形)
pos0 = [0, r; r/2*sqrt(3), -r/2; -r/2*sqrt(3), -r/2];
% 速度大小
v0 = [6, 6, 6];
% 速度方向(x轴正方向为参考)
theta0 = [0, 4*pi/3, 2*pi/3];

%% 参数设置
global G dt m x_min x_max y_min y_max time_end isOutVideo;
% 结束时间
time_end = 10;
% 时间间隔
dt = 0.05;
% 万有引力系数，随便设置的
G = 1;
% 质量
m = [1000, 1000, 1000];
% 小球个数
N = length(v0);
% 图像边界
x_min = -25;
x_max = -x_min;
y_min = x_min;
y_max = -y_min;
% 是否输出视频图像
isOutVideo = true;

%% 初始设置
time = 0:dt:time_end;
% 坐标
pos = zeros(N, 2, length(time));
pos(:,:,1) = pos0;
% 速度
vx = zeros(length(time), N);
vx(1,:) = v0.*cos(theta0);
vy = zeros(length(time), N);
vy(1,:) = v0.*sin(theta0);
% 加速度大小
a = zeros(length(time), N);

%% 迭代开始
for t = 2:length(time)
    % 得到分加速度
    da = calAcceleration(pos(:,:,t-1));
    % 计算速度
    [vx(t,:), vy(t,:)] = calVelocity(vx(t-1,:), vy(t-1,:), da);
    % 计算位移
    pos(:,:,t) = calDisplacement(vx(t-1:t,:), vy(t-1:t,:), pos(:,:,t-1));
end

%% 作图区
% 做轨迹图像
plotPosition(pos, vx, vy, time)
% 做速度随时间图像
plotVelocity(vx, vy)