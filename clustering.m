imtl={};
for i=1:10
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
newimInfoind1 = newimInfoind1(1:100);

dorsal=[];
for i=1:length(newimInfoind)
        ind= newimInfoind(i);
        im=(imInfo(arrayfun(@(s) ismember(ind, s.id), imInfo)));
        row = reshape(im.img,1,[]);
        dorsal = [dorsal;row];
end

[idxd,Cd] = kmeans(double(dorsal(:,1:57600)),3);
figure
gscatter(dorsal(:,1),dorsal(:,2),idxd,'bgm')
hold on
plot(Cd(:,1),Cd(:,2),'kx')
legend('Cluster 1','Cluster 2','Cluster 3','Cluster Centroid')

palmar=[];
for i=1:length(newimInfoind1)
        ind= newimInfoind1(i);
        im=(imInfo(arrayfun(@(s) ismember(ind, s.id), imInfo)));
        row = reshape(im.img,1,[]);
        palmar = [palmar;row];
end
[idxp,Cp] = kmeans(double(palmar(:,1:57600)),3);
figure
gscatter(palmar(:,1),palmar(:,2),idxp,'bgm')
hold on
plot(Cp(:,1),Cp(:,2),'kx')
legend('Cluster 1','Cluster 2','Cluster 3','Cluster Centroid')


for i=1:length(imtl)
   labelCluster(imtl{i},Cd,Cp); 
end
