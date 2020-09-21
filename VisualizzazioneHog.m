[Gx,Gy] = imgradientxy(rgb2gray(img));
imshow(Gx);
imshow(Gy);
[Gmag,Gdir] = imgradient(Gx,Gy);
histogram(Gmag);
histogram(Gdir);