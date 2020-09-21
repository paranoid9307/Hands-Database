function red= hogPcaLabel(k, imInfo, newimInfoind)
    l= length(newimInfoind);
    C = [];
    for i=1:l
        ind= newimInfoind(i);
        im=(imInfo(arrayfun(@(s) ismember(ind, s.id), imInfo)));
        row = im.hog{1};
        C = [C;row];
    end
   C(isnan(C))=0;
    
    [coeff,score,latent] = pca(C);
    red=score(:,1:k);
    
    % Ciniziale = score * coeff'
    for j=1:5
        fprintf("peso: %d\n", latent(j));
        disp("termine: " + score(:,j));
    end
    
    %red= pca(C,'NumComponents',k);
    
end