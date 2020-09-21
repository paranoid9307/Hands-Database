function CM = colorMoments(img)
    yuvIm = rgb2ycbcr(img);
    Y=yuvIm(:,:,1);
    U=yuvIm(:,:,2);
    V=yuvIm(:,:,3);
    %mean
    
    fun =@(MEANS) mean(MEANS.data(:));
    Ymean=blockproc(Y,[100 100],fun);
    Umean=blockproc(U,[100 100],fun);
    Vmean=blockproc(V,[100 100],fun);
    
    %convert nan values eventually
    
    Ymean(isnan(Ymean))=0;
    Umean(isnan(Umean))=0;
    Vmean(isnan(Vmean))=0;
    
    %standard deviation
    fun1 =@(STD) std2(STD.data(:));
    Ystd=blockproc(Y,[100 100],fun1);
    Ustd=blockproc(U,[100 100],fun1);
    Vstd=blockproc(V,[100 100],fun1);
    
    Ystd(isnan(Ystd))=0;
    Ustd(isnan(Ustd))=0;
    Vstd(isnan(Vstd))=0;
    
    fun2=@(SKEW) skewness(SKEW.data(:));
    Yskw=blockproc(Y,[100 100],fun2);
    Uskw=blockproc(U,[100 100],fun2);
    Vskw=blockproc(V,[100 100],fun2);
    
    Yskw(isnan(Yskw))=0;
    Uskw(isnan(Uskw))=0;
    Vskw(isnan(Vskw))=0;
    
    CM={};
    CM{1}= Ymean;
    CM{2}= Ystd;
    CM{3}= Yskw;
    CM{4}= Umean;
    CM{5}= Ustd;
    CM{6}= Uskw;
    CM{7}= Vmean;
    CM{8}= Vstd;
    CM{9}= Vskw;
    %si può normalizzare utilizzando il massimo di ogni matrice
    %e dividere ogni elemento della matrice per il massimo
    
end