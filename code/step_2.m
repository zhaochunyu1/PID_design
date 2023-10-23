% 创建传递函数模型
num = 523500;          % 分子的系数
den = [1, 87.35, 10470, 0]; % 分母的系数，s^3 + 87.35s^2 + 10470s

Gp = tf(num, den);

t = [0 : 20];
% 绘制阶跃响应曲线
figure;
y = step(Gp,t);
% plot(t, y,'p-','MarkerFaceColor','r','MarkerEdgeColor','r','LineWidth',1.25,'Color','b');
plot(t, y,'-','LineWidth',1.25,'Color','b');
% 添加标题和标签
xlabel('s');
ylabel('G_p(s)');

grid on; % 添加网格线
