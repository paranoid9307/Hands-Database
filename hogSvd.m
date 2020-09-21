function red= hogSvd(k, imInfo)
    len= length(imInfo);
    C = [];
    for i=1:len
        im=(imInfo(arrayfun(@(s) ismember(i, s.id), imInfo)));
        row = im.hog{1};
        C = [C;row];
    end
    C(isnan(C))= 0;
    [U,S,V] = svd(C);
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
