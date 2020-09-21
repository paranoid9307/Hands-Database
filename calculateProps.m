function  calculateProps(imInfo)
    %UNTITLED3 Summary of this function goes here
    %   Detailed explanation goes here
    for id= 1:size(imInfo,2)
        im=(imInfo(arrayfun(@(s) ismember(id, s.id), imInfo)));
        im.cm = colorMoments(im.img);
    end
    
    
    
    
end

% function CM = calculateCm(img)
%     yuvIm = rgb2ycbcr(img);
%     Y=yuvIm(:,:,1);
%     U=yuvIm(:,:,2);
%     V=yuvIm(:,:,3);
%     fun =@(MEANS) mean(MEANS.data(:));
%     Ymean=blockproc(Y,[100 100],fun);
%     Umean=blockproc(U,[100 100],fun);
%     Vmean=blockproc(V,[100 100],fun);
%     
%     fun1 =@(STD) std2(STD.data(:));
%     Ystd=blockproc(Y,[100 100],fun1);
%     Ustd=blockproc(U,[100 100],fun1);
%     Vstd=blockproc(V,[100 100],fun1);
%     
%     fun2=@(SKEW) skewness(SKEW.data(:));
%     Yskw=blockproc(Y,[100 100],fun2);
%     Uskw=blockproc(U,[100 100],fun2);
%     Vskw=blockproc(V,[100 100],fun2);
%     
%     CM={};
%     CM{1}= Ymean;
%     CM{2}= Ystd;
%     CM{3}= Yskw;
%     CM{4}= Umean;
%     CM{5}= Ustd;
%     CM{6}= Uskw;
%     CM{7}= Vmean;
%     CM{8}= Vstd;
%     CM{9}= Vskw;
%     
%     
% end
% function CM = calculateLBP(img)
%     
% end