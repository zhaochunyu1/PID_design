%% 计算三种控制方法的响应与误差 分别合并在一个图便于可视化分析
load('.\data\e3.mat');load('.\data\e2.mat');load('.\data\e1.mat');
load('.\data\y3.mat');load('.\data\y2.mat');load('.\data\y1.mat');
load('.\data\u3.mat');load('.\data\u2.mat');load('.\data\u1.mat');
load('.\data\time.mat');load('.\data\r.mat');
% 1:专家 2:传统 3:模糊
figure(1)
plot(time,r,time,y1,time,y2,time,y,LineWidth=1.5);
legend('r','专家PID','传统PID','模糊PID');
grid on
xlabel('time')
ylabel('y')

figure(2)
plot(time,e1,time,e2,time,e,LineWidth=1.5);
legend('专家PID','传统PID','模糊PID');
grid on
xlabel('time')
ylabel('error')

% figure(3)
% plot(time,u1,time,u2,time,u,LineWidth=1.5);
% legend('专家PID','传统PID','模糊PID');
% grid on
% xlabel('time')
% ylabel('u')
