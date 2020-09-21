%mean color moments
function colSim = colorMomentSimilarity(C,C1)
m1= C{1};
m2= C{4};
m3= C{7};
m11= C1{1};
m12= C1{4};
m13= C1{7};
std1= C{2};
std2= C{5};
std3= C{8};
std11 = C1{2};
std12 = C1{5};
std13 = C1{8};
skw1= C{2};
skw2= C{5};
skw3= C{8};
skw11 = C1{2};
skw12 = C1{5};
skw13 = C1{8};


D1 = pdist2(reshape(m11,1,[]),reshape(m1,1,[]));
D2 = pdist2(reshape(m12,1,[]),reshape(m2,1,[]));
D3 = pdist2(reshape(m13,1,[]),reshape(m3,1,[]));
D4=  pdist2(reshape(std1,1,[]),reshape(std11,1,[]));
D5=  pdist2(reshape(std2,1,[]),reshape(std12,1,[]));
D6=  pdist2(reshape(std3,1,[]),reshape(std13,1,[]));
D7=  pdist2(reshape(skw1,1,[]),reshape(skw11,1,[]));
D8=  pdist2(reshape(skw2,1,[]),reshape(skw12,1,[]));
D9=  pdist2(reshape(skw3,1,[]),reshape(skw13,1,[]));
colSim= D1+D2+D3+D4+D5+D6+D7+D8+D9;

end
%[val,idx]=mink(da,2)