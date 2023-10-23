% 定义s值 0到10，采样间隔为0.1
s = 0:0.01:0.3;  

% 计算函数的值
G = 523500 ./ (s.^3 + 87.35*s.^2 + 10470*s);

% 使用plot绘制图像
figure;
plot(s, G,'p-','MarkerFaceColor','b','MarkerEdgeColor','b','LineWidth',1.25,'Color','k');

% 添加标题和标签
title('523500 / (s^3 + 87.35*s^2 + 10470*s)');
xlabel('s');
ylabel('G_p(s)');
