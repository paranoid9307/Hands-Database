function red= colorMomentsSvd(k,imInfo)
    len= length(imInfo);
    D = [];
    for i=1:len
        im=(imInfo(arrayfun(@(s) ismember(i, s.id), imInfo)));
        row = [reshape(im.cm{1},1,[]),reshape(im.cm{2},1,[]),reshape(im.cm{3},1,[]),reshape(im.cm{4},1,[]),reshape(im.cm{5},1,[]),reshape(im.cm{6},1,[]),reshape(im.cm{7},1,[]),reshape(im.cm{8},1,[]),reshape(im.cm{9},1,[])];
        D = [D;row];
    end
    D(isnan(D))= 0;
    [U,S,V] = svd(D);
    for j=1:k
        fprintf("peso: %d\n", S(j,j));
        disp("termine: " + U(:,j));
    end
    
    s= size(S,1);
    for i=s:-1:k
        S(i,i)=0;
    end
    
    red= U*S*V';
    
end
