function ls = singleSvd(row,k)
  [U,S,V] = svd(row);
  s= size(S,1);
    for i=s:-1:k
        S(i,i)=0;
    end
    
    ls= U*S*V';  
end