tic
load("HandInfo.mat");
% pathbase1= "Hands//Hand_000000%d%s";
% pathbase2= "Hands//Hand_00000%d%s";
% pathbase3= "Hands//Hand_0000%d%s";
% pathbase4= "Hands//Hand_000%d%s";
% pathbase5= "Hands//Hand_0%d%s";
% jp=".jpg";
 for i=1:len
 imInfo(i).id=i;
% if i<10
%    imInfo(i).img= sprintf(pathbase1, ++i, jp);   
% 
% elseif i<100
%    imInfo(i).img= sprintf(pathbase2, ++i, jp);    
% 
% elseif i<1000
%    imInfo(i).img= sprintf(pathbase3, ++i, jp);    
% 
% elseif i<10000
%    imInfo(i).img= sprintf(pathbase4, ++i, jp);    
% 
% 
% else
%    imInfo(i).img= sprintf(pathbase5, ++i, jp);
% end
imInfo(i).img= imgs{i};
imInfo(i).cm=colorMoments(imgs{i});
imInfo(i).lbp=calculateLBP(imgs{i});
imInfo(i).hog= calculateHOG(imgs{i});
imInfo(i).sift=[];
imInfo(i).meta=HandInfo(i);
 end
 
 toc
% clear imds
% clear imgs
% clear len
% valuetofind=1;
% im=(imInfo(arrayfun(@(s) ismember(valuetofind, s.id), imInfo)));
