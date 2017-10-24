function Image = S_L()
% 获取shepp_logan头模型图像
N = 128;
ellpar = [...
    0 0	0.92 0.69 90 2;
    0 -0.0184 0.874	0.6624 90 -0.98;
    0.22 0 0.31	0.11 72	-0.2;
    -0.22 0 0.41 0.16 108 -0.2;
    0 0.35 0.25 0.21 90	0.2;
    0 0.1 0.046	0.046 0	0.2;
    0 -0.1 0.046 0.046 0 0.2;
    -0.08 -0.605 0.046 0.023 0 0.2;
    0 -0.605 0.023 0.023 0 0.2;
    0.06 -0.605 0.046 0.023 90 0.2];
%图像的初始化
Image = zeros(N);
%获取坐标网格
xx = linspace(-1, 1, N);
yy = linspace(-1, 1, N);
[xx,yy] = ndgrid(xx,yy);
%获取头模型（10个椭圆的累加）
for ie = 1:10
    %参数的设置
	ell = ellpar(ie, :);
	cx = ell(1);	rx = ell(3);
	cy = ell(2);	ry = ell(4);
	theta = ell(5) / 180 * pi;
    %坐标变换
	x = cos(theta) * (xx-cx) + sin(theta) * (yy-cy);
	y = -sin(theta) * (xx-cx) + cos(theta) * (yy-cy);
    %获取在椭圆内的坐标点
	tmp = (x/rx).^2 + (y/ry).^2 < 1;
    %椭圆内的点灰度赋值
	Image = Image + tmp * ell(6)/2;
end
Image = rot90(Image);
% figure;imshow(Image)
end