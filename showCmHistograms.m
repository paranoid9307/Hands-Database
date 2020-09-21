%map = brewermap(3,'Set1'); 
function showCmHistograms(C,img)
        subplot(4,1,1)
        imshow(img);
        subplot(4,1,2)
        histogram(C{1}, 24);
        hold on
        histogram(C{4}, 24);
        histogram(C{7}, 24);
        legend("Mean(Y)", "Mean(U)","Mean(V)", 'Location','northwestoutside','Fontsize', 5)
        hold off
        subplot(4,1,3)
        histogram(C{2}, 24);
        hold on
        histogram(C{5}, 24);
        histogram(C{8}, 24);
        legend("Std(Y)", "Std(U)","Std(V)", 'Location','northwestoutside','Fontsize', 5)
        hold off
        subplot(4,1,4)
        histogram(C{3}, 24);
        hold on
        histogram(C{6}, 24);
        histogram(C{9}, 24);
        legend("Skw(Y)", "Skw(U)","Skw(V)", 'Location','northwestoutside','Fontsize', 5)
        hold off      
        suptitle('Color Moments');
              
end
