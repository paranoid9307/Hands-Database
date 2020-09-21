function red= colorMomentsPca(k, imInfo)
    len= length(imInfo);
    C = [];
    for i=1:len
        im=(imInfo(arrayfun(@(s) ismember(i, s.id), imInfo)));
        row = [reshape(im.cm{1},1,[]),reshape(im.cm{2},1,[]),reshape(im.cm{3},1,[]),reshape(im.cm{4},1,[]),reshape(im.cm{5},1,[]),reshape(im.cm{6},1,[]),reshape(im.cm{7},1,[]),reshape(im.cm{8},1,[]),reshape(im.cm{9},1,[])];
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