function HOG = calculateHOG(img)
    %I = imread('peppers.jpg');
    %sampling= img(1:1:end, 1:10:end);
    [featureVector,hogVisualization] = extractHOGFeatures(img,'NumBins',1, 'CellSize',[20 20], 'BlockSize', [20 20]);
    [Gx,Gy] = imgradientxy(rgb2gray(img));
    [Gmag,Gdir] = imgradient(Gx,Gy);
    HOG={};
    HOG{1} = featureVector;
    HOG{2} = hogVisualization;
    HOG{3} = Gmag;
    HOG{4} = Gdir;
    
end