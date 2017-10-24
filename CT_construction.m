clear;clc
% 获取shepp_logan图像Image
Image = S_L();
% 获取反投影数据P
P = prej();
% 获取直接反投影图像dbp
dbp = DBP(P');
% 获取卷积反投影图像cbp
cbp = CBP(P);
% 显示所有图像
figure;imshow(Image,[])
figure;imshow(P',[])
figure;imshow(dbp,[])
figure;imshow(cbp,[])