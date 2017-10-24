function g = prej()
% ��ȡshepp_loganͼ��ͶӰ����
ellpar = [...
0	0	0.92	0.69	90	2;
0	-0.0184	0.874	0.6624	90	-0.98;
0.22	0	0.31	0.11	72	-0.2;
-0.22	0	0.41	0.16	108	-0.2;
0	0.35	0.25	0.21	90	0.2;
0	0.1	0.046	0.046	0	0.2;
0	-0.1	0.046	0.046	0	0.2;
-0.08	-0.605	0.046	0.023	0	0.2;
0	-0.605	0.023	0.023	0	0.2;
0.06	-0.605	0.046	0.023	90	0.2];
% ����������
x = ellpar(:,1);    A = ellpar(:,3);
y = ellpar(:,2);    B = ellpar(:,4);
alpha = ellpar(:,5)*pi/180;
p = ellpar(:,6);
% ���۹�ϵ��ת��Ϊ�Ҷ�ֵ
for i = 1:9
    p(i+1) = p(i)+p(i+1);
end
p = p/2;
% ͶӰ���ݳ�ʼ��
g = zeros(180,185);
theta = linspace(0,179,180)*pi/180;
R = linspace(-92,92,185)/64;
% ��ȡͶӰ���ݣ�10����ԲͶӰ���ۼӣ�
for ie = 1:10
    %����0-179�Ƚ���ͶӰ
    for i = 1:180
        %ÿ��ͶӰ�Ƕ�185��ͶӰ��
        for j = 1:185
            g(i,j) = g(i,j) + p(ie)*2*A(ie)*B(ie)*...
                sqrt(A(ie)^2*cos(theta(i)-alpha(ie))...
                ^2+B(ie)^2*sin(theta(i)-alpha(ie))^2-...
                (R(j)-x(ie)*cos(theta(i))-y(ie)*sin...
                (theta(i)))^2)/(A(ie)^2*cos(theta(i)...
                -alpha(ie))^2+B(ie)^2*sin(theta(i)-...
                alpha(ie))^2);
        end
    end
end
% ͶӰ����ֻȡʵ��
g = real(g);
% figure;imshow(rot90(g),[]);
end