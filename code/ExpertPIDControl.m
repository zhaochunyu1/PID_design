% 专家PID控制函数
function u = ExpertPIDControl(error, Kp, Ki, Kd)
    % 初始化误差积分和误差微分
    persistent errorIntegral
    persistent prevError
    
    if isempty(errorIntegral)
        errorIntegral = 0;
    end
    if isempty(prevError)
        prevError = 0;
    end
    
    % 计算误差积分
    errorIntegral = errorIntegral + error;
    
    % 计算误差微分
    errorDerivative = error - prevError;
    
    % 计算控制信号
    u = Kp * error + Ki * errorIntegral + Kd * errorDerivative;
    
    % 更新先前误差
    prevError = error;
end