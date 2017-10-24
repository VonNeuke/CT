function f1 = CBP(P)
% 获取卷积反投影图像
% P = prej();
% 参数设置
N = 128;    Delta = 185/128;     n = 185;
% 求取卷积函数h
g = -n:n;
h = zeros(1,2*n+1);
for i = 1:2*n+1
    if g(i)==0
        h(i) = 1/(4*Delta^2);
    else if mod(g(i),2)==0
            h(i) = 0;
        else
            h(i) = -1/(pi^2*Delta^2*(g(i)^2));
        end
    end
end
% 求取卷积后的投影数据Q1
Q = zeros(180,3*n);
for i =1:180
    Q(i,:) = conv(P(i,:),h);
end
Q1 = Q(:,n+1:2*n);%Q1取Q每行的[n+1,2n]之间的数据
% 求取C_theta
theta = (0:179)*pi/180;
C_theta = zeros(1,180);
for i = 1:180
    C_theta(i) = N/2 - (N-1)*(cos(theta(i))+sin(theta(i)))/2;
end
% 求取反投影图像f1
R1 = zeros(N);  %R'
f1 = zeros(N);
% 遍历1-179度
for m = 1:180
    %遍历R'所有坐标点
    for i = 1:N
        for j = 1:N
            %求取R'
            R1(i,j) = (i-1)*cos(theta(m))+(j-1)*sin(theta(m))+C_theta(m);
        end
    end
    R1 = R1*Delta;
    %求取R'整数部分n0和小数部分delta
    n0 = floor(R1);
    delta = R1-n0;
    %求取每个角度的反投影数据f
    f = zeros(N);
    for i = 1:N
        for j = 1:N
            if n0(i,j)>0&&n0(i,j)<185
                f(i,j) = (1-delta(i,j))*Q1(m,n0(i,j))+delta(i,j)*Q1(m,n0(i,j)+1);
            else
                f(i,j) = 0;
            end
        end
    end
    %将所有角度的投影数据累加
    f1 = f1+f;
end
f1 = rot90(f1);
% figure;imshow(f1,[])
end