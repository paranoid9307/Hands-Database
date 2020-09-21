function labelFolder(imtoLabel, sem1, sem2)
s= size(sem1,1);
s1= size(sem2,1);
simil=[];
simil1=[];
imtoLabelLbp=singleSvd(imtoLabel.lbp,30);
for i=1:s
   simil(i)= pdist2(imtoLabelLbp,sem1(i,:)); 
end
for i=1:s1
   simil1(i)= pdist2(imtoLabelLbp,sem2(i,:)); 
end
score1=sum(simil); %dorsal 
score2= sum(simil1); %palmar

if score1<score2
    disp("Label immagine "+imtoLabel.id+" : dorsal");
else
    disp("Label immagine "+imtoLabel.id+" : palmar");
end 
end