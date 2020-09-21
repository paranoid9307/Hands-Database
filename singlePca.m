function ls = singlePca(row, k)
    
    [coeff,score,latent] = pca(row);
    ls=score(:,1:k)
    
end