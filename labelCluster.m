function labelCluster(im, C, C1)
s= size(C,1);
s1= size(C1,1);
simil=[];
simil1=[];
imtoLabel=reshape(im.img,1,[]);
imtoLabel=imtoLabel(:,1:57600);
for i=1:s
   simil(i)= pdist2(double(imtoLabel),C(i,:)); 
end
for i=1:s1
   simil1(i)= pdist2(double(imtoLabel),C1(i,:)); 
end
score1=sum(simil); %dorsal 
score2= sum(simil1); %palmar

if score1<score2
    disp("Label immagine "+im.id+" : dorsal");
else
    disp("Label immagine "+im.id+" : palmar");
end 
end