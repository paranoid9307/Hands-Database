prompt = {'Enter number of latent features you want to keep:'
    'Enter tecnique you want to apply (1=SVD, 2=PCA):'
    'Enter feature (1= color moments, 2 = LBP, 3 = Hog, 4 = Sift):'
    'Enter id of the image you want to label:'
    };
dlgtitle = 'Show similar images';
%definput = {'20','hsv'};
answer = inputdlg(prompt,dlgtitle);
k= str2num(answer{1});
tec= str2num(answer{2});
feat= str2num(answer{3});
id= str2num(answer{4});

imToLabel=(imInfo(arrayfun(@(s) ismember(id, s.id), imInfo)));
newimInfoind=[];
newimInfoind1=[];
for i=1:len
    im=(imInfo(arrayfun(@(s) ismember(i, s.id), imInfo)));
    meta= im.meta.aspectOfHand;
    if (strcmp(meta, 'dorsal right'))
        newimInfoind(i)=im.id;
    end
end
newimInfoind = newimInfoind(newimInfoind~=0);

for i=1:len
    im=(imInfo(arrayfun(@(s) ismember(i, s.id), imInfo)));
    meta= im.meta.aspectOfHand;
    if (strcmp(meta, 'dorsal left'))
        newimInfoind1(i)=im.id;
    end
end
newimInfoind1 = newimInfoind1(newimInfoind1~=0);
newimInfoind1= newimInfoind1(1:length(newimInfoind));
red=[];
cmImToLabel=[];
switch tec
    case 1 %SVD
        if feat==1
            cmImToLabel=[reshape(imToLabel.cm{1},1,[]),reshape(imToLabel.cm{2},1,[]),reshape(imToLabel.cm{3},1,[]),reshape(imToLabel.cm{4},1,[]),reshape(imToLabel.cm{5},1,[]),reshape(imToLabel.cm{6},1,[]),reshape(imToLabel.cm{7},1,[]),reshape(imToLabel.cm{8},1,[]),reshape(imToLabel.cm{9},1,[])];
            cmImToLabel=singleSvd(cmImToLabel,k);
            red= colorMomentsSvdLabel(k,imInfo, newimInfoind);
            red1= colorMomentsSvdLabel(k,imInfo, newimInfoind1);
        elseif feat==2
            cmImToLabel=singleSvd(imToLabel.lbp,k);
            red= lbpSvdLabel(k,imInfo,newimInfoind);
            red1= lbpSvdLabel(k,imInfo,newimInfoind1);
        elseif feat== 3
            cmImToLabel=singleSvd(imToLabel.hog{1},k);
            red= hogSvdLabel(k,imInfo,newimInfoind);
            red1= hogSvdLabel(k,imInfo,newimInfoind1);
        elseif feat==4
            %cmImToLabel=imToLabel.sift{1}; bisogna fare quella cosa di riuscire a fare le righe della sift
            red= SiftSvdLabel(k, imInfo,newimInfoind);
            red1= SiftSvdLabel(k, imInfo,newimInfoind1);
        end
        
    case 2 %PCA
        if feat==1
            cmImToLabel=[reshape(imToLabel.cm{1},1,[]),reshape(imToLabel.cm{2},1,[]),reshape(imToLabel.cm{3},1,[]),reshape(imToLabel.cm{4},1,[]),reshape(imToLabel.cm{5},1,[]),reshape(imToLabel.cm{6},1,[]),reshape(imToLabel.cm{7},1,[]),reshape(imToLabel.cm{8},1,[]),reshape(imToLabel.cm{9},1,[])];
            cmImToLabel= cmImToLabel(:,1:k);
            red= colorMomentsPcaLabel(k,imInfo,newimInfoind);
            red1= colorMomentsPcaLabel(k,imInfo,newimInfoind1);
        elseif feat==2
            cmImToLabel=imToLabel.lbp;
             cmImToLabel= cmImToLabel(:,1:k);
            red= lbpPcaLabel(k, imInfo,newimInfoind); 
            red1= lbpPcaLabel(k, imInfo,newimInfoind1);
        elseif feat== 3
            cmImToLabel=imToLabel.hog{1};
             cmImToLabel= cmImToLabel(:,1:k);
            red= hogPcaLabel(k, imInfo,newimInfoind); 
            red1= hogPcaLabel(k, imInfo,newimInfoind1);
        elseif feat==4
            %cmImToLabel=imToLabel.sift{1}; come prima
             %cmImToLabel= cmImToLabel(:,1:k);
            red= siftPcaLabel(k, imInfo,newimInfoind);
            red1= siftPcaLabel(k, imInfo,newimInfoind1);
        end
        
end
s= size(red,1);
s1= size(red1,1);
simil=[];
simil1=[];
for i=1:s
   simil(i)= pdist2(cmImToLabel,red(i,:)); 
end
for i=1:s1
   simil1(i)= pdist2(cmImToLabel,red1(i,:)); 
end
score1=sum(simil); %dorsal right
score2= sum(simil1); %dorsal left

if score1<score2
    disp("Label: dorsal right");
else
    disp("Label: dorsal left");
end

    
    %red= pca(C,'NumComponents',k);
    
