% 创建时间向量
t = -1:0.01:1; % 定义时间范围和时间步长

% 创建阶跃信号
u = zeros(size(t)); % 创建一个与t相同大小的零向量
u(t >= 0) = 1;      % 在t大于等于0的时刻将u设为1

% 绘制阶跃函数的图像
figure;
plot(t, u, 'b', 'LineWidth', 1.25);

% 添加标题和标签
xlabel('t');
ylabel('u(t)');

% 设置图形的坐标范围
axis([-1 1 -0.2 1.2]);
grid on; % 添加网格线

% 画出坐标轴
hold on;
plot([0 0], [-0.2 1.2], 'k--','LineWidth', 1.25); % 画y=0的坐标轴
plot([-1 1], [0 0], 'k--','LineWidth', 1.25);    % 画x=0的坐标轴
hold off;
