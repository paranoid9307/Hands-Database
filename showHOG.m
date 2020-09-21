function showHOG(img, hog)
    %subplot(1,2,1)
    
    imshow(img);
    hold on;
    plot(hog{2});
    
    figure;
    subplot(1,2,1)
    histogram(hog{3});
    ylabel("Magnitude of oriented gradients")
    subplot(1,2,2)
    histogram(hog{4});
    xlabel("Orientation of gradient (degree)")
    
    suptitle("Histogram of oriented gradients")
end