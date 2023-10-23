% 定义传递函数
num = 1;
den = [1, 3, 3, 1];
sys = tf(num, den);

% 创建PID控制器对象
controller = pid(1, 0, 0);

% 设置仿真时间和步长
T = 0:0.01:40;  % 时间向量

% 不同的Kp值
Kp_values = [1, 3, 5];

% 初始化图形
figure;

% 为每个Kp值绘制系统响应
for i = 1:length(Kp_values)
    Kp = Kp_values(i);
    controller.Kp = Kp;
    
    % 仿真系统响应
%     [y,t]= step(feedback(sys * controller, 1),t);
    y = step(feedback(sys * controller, 1),T);
    
    % 绘制响应曲线
    plot(T, y, 'DisplayName', ['Kp = ', num2str(Kp)],'LineWidth',1.25);
    ylabel('系统响应');
    hold on
end
legend('Location', 'Best');  % 添加图例
xlabel('时间');

% 设置图形标题
% title('不同Kp值对于PID系统的系统响应（传递函数：1/(s+1)^3）');
