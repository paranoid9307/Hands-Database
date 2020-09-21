imtl={};
for i=1:8
    imtl{i}=imInfo(i*5);
end
newimInfoind=[];
newimInfoind1=[];
for i=1:len
    im=(imInfo(arrayfun(@(s) ismember(i, s.id), imInfo)));
    meta= im.meta.aspectOfHand;
    if (strcmp(meta, 'dorsal right')||strcmp(meta, 'dorsal left'))
        newimInfoind(i)=im.id;
    end
end
newimInfoind = newimInfoind(newimInfoind~=0);

for i=1:len
    im=(imInfo(arrayfun(@(s) ismember(i, s.id), imInfo)));
    meta= im.meta.aspectOfHand;
    if (strcmp(meta, 'palmar left')||strcmp(meta, 'palmar right'))
        newimInfoind1(i)=im.id;
    end
end
newimInfoind1 = newimInfoind1(newimInfoind1~=0);
maxLength= min(length(newimInfoind),length(newimInfoind1));
newimInfoind1= newimInfoind1(1:100);
newimInfoind = newimInfoind(1:maxLength);
red= lbpSvdLabel(30,imInfo, newimInfoind);
red1= lbpSvdLabel(30,imInfo, newimInfoind1);
 for i=1:length(imtl)
     labelFolder(imtl{i}, red, red1)
 end

