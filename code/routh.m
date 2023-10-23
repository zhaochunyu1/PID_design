function R = routh(D)   %R表示劳斯表，D表示特征多项式系数组成的向量
 
L = length(D);
if rem(L,2)==1
    k=L+1;
else
    k=L;
end
 
R = zeros(L,k/2);
if rem(L,2)==0
    for j=1:k/2
        R(1,j) = D(2*j-1);
        R(2,j)=D(2*j);
    end
else
    for j=1:(k/2)-1
        R(1,j)=D(2*j-1);
        R(1,k/2)=D(k-1);
        R(2,j)=D(2*j);
    end
end
 
for i=3:L
    for j=1:k/2-1
        R(i,j)=(R(i-1,1)*R(i-2,j+1)-R(i-2,1)*R(i-1,j+1))/R(i-1,1);
    end
end
R  %在屏幕上显示routh表