% 传统PID控制函数
function u = TraditionalPIDControl(error, Kp, Ki, Kd, N, dt)
    % 初始化误差积分和误差历史
    persistent errorIntegral
    persistent errorHistory
    
    if isempty(errorIntegral)
        errorIntegral = 0;
    end
    if isempty(errorHistory)
        errorHistory = zeros(1, N);
    end
    
    % 更新误差历史
    errorHistory = [error errorHistory(1:end-1)];
    
    % 计算误差积分
    errorIntegral = trapz(errorHistory) * dt;
    
    % 计算控制信号
    u = Kp * error + Ki * errorIntegral + Kd * (error - errorHistory(N));
end
