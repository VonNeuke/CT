function I = DBP(P)
% 获取直接反投影图像
% Image = S_L();
% P = radon(Image,0:179);
I = iradon(P,0:179);
end