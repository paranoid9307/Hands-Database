function showLBPHistogram(lbp, img)
    
    subplot(1,2,1)
    imshow(img);
    subplot(1,2,2)
    histogram(lbp)
    xlabel("Normalized values");
    ylabel("Frequencies");
    suptitle('Local Binary Pattern');
end