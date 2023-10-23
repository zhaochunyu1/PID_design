%% 计算三种控制方法的指标，以及在图上进行标注
load('.\data\time.mat');
load('.\data\y3.mat');
load('.\data\y2.mat');
load('.\data\y1.mat');
Fun_Step_Performance(time,y,1);
Fun_Step_Performance(time,y2,1);
Fun_Step_Performance(time,y1,1);
