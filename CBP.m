function f1 = CBP(P)
% ��ȡ�����ͶӰͼ��
% P = prej();
% ��������
N = 128;    Delta = 185/128;     n = 185;
% ��ȡ�������h
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
% ��ȡ������ͶӰ����Q1
Q = zeros(180,3*n);
for i =1:180
    Q(i,:) = conv(P(i,:),h);
end
Q1 = Q(:,n+1:2*n);%Q1ȡQÿ�е�[n+1,2n]֮�������
% ��ȡC_theta
theta = (0:179)*pi/180;
C_theta = zeros(1,180);
for i = 1:180
    C_theta(i) = N/2 - (N-1)*(cos(theta(i))+sin(theta(i)))/2;
end
% ��ȡ��ͶӰͼ��f1
R1 = zeros(N);  %R'
f1 = zeros(N);
% ����1-179��
for m = 1:180
    %����R'���������
    for i = 1:N
        for j = 1:N
            %��ȡR'
            R1(i,j) = (i-1)*cos(theta(m))+(j-1)*sin(theta(m))+C_theta(m);
        end
    end
    R1 = R1*Delta;
    %��ȡR'��������n0��С������delta
    n0 = floor(R1);
    delta = R1-n0;
    %��ȡÿ���Ƕȵķ�ͶӰ����f
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
    %�����нǶȵ�ͶӰ�����ۼ�
    f1 = f1+f;
end
f1 = rot90(f1);
% figure;imshow(f1,[])
end