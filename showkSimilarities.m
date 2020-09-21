function indexes = showkSimilarities(model, im, imInfo)
    len= length(imInfo);
    indexes= [];   
    switch model        
        case 1        
            cm=im.cm;
            for i= 1:len
              im1=(imInfo(arrayfun(@(s) ismember(i, s.id), imInfo)));
              cm1= im1.cm;
              indexes(i) = colorMomentSimilarity(cm,cm1);
              
            end
            
         
        case 2        
            lbp= im.lbp;
            for i= 1:len
              im1=(imInfo(arrayfun(@(s) ismember(i, s.id), imInfo)));
              lbp1= im1.lbp;
              indexes(i) = lbpSimilarity(lbp,lbp1);
            end
            
        
        case 3
            hog= im.hog{1};
            for i= 1:len
              im1=(imInfo(arrayfun(@(s) ismember(i, s.id), imInfo)));
              hog1= im1.hog{1};
              indexes(i) = hogSimilarity(hog,hog1);
            end
            
        case 4
            sift= im.sift;
            
    end   
  
    
        
        
    
end