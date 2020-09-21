function red= lbpPca(k, imInfo)
    len= length(imInfo);
    C = [];
    for i=1:len
        im=(imInfo(arrayfun(@(s) ismember(i, s.id), imInfo)));
        row = im.lbp;
        C = [C;row];
    end
    C(isnan(C))= 0;
    
    [coeff,score,latent] = pca(C);
    red=score(:,1:k);
    
    % Ciniziale = score * coeff'
    for j=1:5
        fprintf("peso: %d\n", latent(j));
        disp("termine: " + score(:,j));
    end
    
    %red= pca(C,'NumComponents',k);
    
end