clear;clc
% ��ȡshepp_loganͼ��Image
Image = S_L();
% ��ȡ��ͶӰ����P
P = prej();
% ��ȡֱ�ӷ�ͶӰͼ��dbp
dbp = DBP(P');
% ��ȡ�����ͶӰͼ��cbp
cbp = CBP(P);
% ��ʾ����ͼ��
figure;imshow(Image,[])
figure;imshow(P',[])
figure;imshow(dbp,[])
figure;imshow(cbp,[])