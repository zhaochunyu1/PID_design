% 定义传递函数
num = 1;
den = [1, 3, 3, 1];

% den = conv([1, 0], conv([1, 0], [1, 1]));
sys = tf(num, den);

% 定义PID控制器参数
Kp = 1;
Ti = 1;

time = 1:0.01:40;
% 不同微分时间常数（T_d）的取值
Td_values = [0.1, 1, 2, 4];

% 创建图形窗口
figure;

for i = 1:length(Td_values)
    Td = Td_values(i);
    
    % 创建PID控制器
    C = pid(Kp, Ti, Td);
    
    % 计算闭环系统传递函数
    sys_cl = feedback(C * sys, 1);
    
    % 计算单位阶跃响应
    response = step(sys_cl,time);
    
    % 绘制不同Td值的单位阶跃响应曲线
    plot(time, response, 'DisplayName', ['T_d = ', num2str(Td)],'LineWidth',1.25);
    hold on;
    
    xlabel('时间');
    ylabel('系统响应');
end

% 添加图例
legend('Location', 'Best');
