prompt = {'Enter number of latent features you want to keep:'
    'Enter tecnique you want to apply (1=SVD, 2=PCA):'
    'Enter feature (1= color moments, 2 = LBP, 3 = Hog, 4 = Sift):'
    'Enter id of the image you want to confront:'
    'Enter number of images you want in return'};
dlgtitle = 'Show similar images';
%definput = {'20','hsv'};
answer = inputdlg(prompt,dlgtitle);
k= str2num(answer{1});
tec= str2num(answer{2});
feat= str2num(answer{3});
id= str2num(answer{4});
m= str2num(answer{5});

newimInfoind=[];
for i=1:len
    im=(imInfo(arrayfun(@(s) ismember(i, s.id), imInfo)));
    meta= im.meta.aspectOfHand;
    if (strcmp(meta, 'dorsal right'))
        newimInfoind(i)=im.id;
    end
end
newimInfoind = newimInfoind(newimInfoind~=0);
red=[];
switch tec
    case 1 %SVD
        if feat==1
            red= colorMomentsSvdLabel(k,imInfo, newimInfoind);
        elseif feat==2
            red= lbpSvdLabel(k,imInfo,newimInfoind);           
        elseif feat== 3
            red= hogSvdLabel(k,imInfo,newimInfoind);   
        elseif feat==4
            red= SiftSvdLabel(k, imInfo,newimInfoind);
        end
        
    case 2 %PCA
        if feat==1
            red= colorMomentsPcaLabel(k,imInfo,newimInfoind);
        elseif feat==2
            red= lbpPcaLabel(k, imInfo,newimInfoind);           
        elseif feat== 3
            red= hogPcaLabel(k, imInfo,newimInfoind);   
        elseif feat==4
            red= siftPcaLabel(k, imInfo,newimInfoind);
        end
        
end
conf= red(id,:);
s= size(red,1);
simil=[];
for i=1:s
   simil(i)= pdist2(conf,red(i,:)); 
end
[val,idx]=mink(simil, m+1); 
mont= {};
    for i= 1: length(idx)
        ind=idx(i);
        sim=(imInfo(arrayfun(@(s) ismember(ind, s.id), imInfo)));
        mont{i}=sim.img;
    end

    montage(mont);
    for i=1:m+1
        disp("Valore di somiglianza con immagine num. "+ idx(i)+ " : "+ val(i));
    end

    
    %red= pca(C,'NumComponents',k);
    
