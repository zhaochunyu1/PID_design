% 定义传递函数
num = 1;
den = [1, 3, 3, 1];
sys = tf(num, den);

% 设置不同的积分时间常数
T_i_values = [1, 3, 5, 100000000];
kp = 1;  % 比例增益

% 初始化存储静差和时间向量
steady_state_error = zeros(size(T_i_values));
time_vector = 0:0.01:40;

% 创建图表
figure;

% 绘制不同积分时间常数下的阶跃响应
for i = 1:length(T_i_values)
    T_i = T_i_values(i);
    
    % 创建PID控制器
    num_pid = [kp * T_i, kp];
    den_pid = [T_i, 0];
    pid_controller = tf(num_pid, den_pid);
    
    % 闭环系统
    closed_loop_sys = feedback(pid_controller * sys, 1);
    
    % 计算静差
    steady_state_error(i) = 1 / (1 + dcgain(closed_loop_sys));
    
    % 绘制阶跃响应
    plot(time_vector, step(closed_loop_sys, time_vector), 'LineWidth', 1.25, 'DisplayName', ['T_i = ' num2str(T_i)]);
    hold on;
end

xlabel('时间');
ylabel('系统响应');
% title('不同积分时间常数下的系统阶跃响应');
legend('Location', 'Best');

% 显示静差随T_i变化的图表
figure;
plot(T_i_values, steady_state_error, '-o');
xlabel('积分时间常数 (T_i)');
ylabel('静差');
title('静差随积分时间常数变化');
