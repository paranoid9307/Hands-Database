prompt = {'Enter image id:','Enter feature (1= color moments, 2 = LBP, 3 = Hog, 4 = Sift):'};
dlgtitle = 'Show Feature';
%definput = {'20','hsv'};
answer = inputdlg(prompt,dlgtitle);
id= str2num(answer{1});
model= str2num(answer{2});
im=(imInfo(arrayfun(@(s) ismember(id, s.id), imInfo)));
img=im.img;
switch model
    case 1        
        cm=im.cm;
        showCmHistograms(cm, img); 
    case 2
        lbp= im.lbp;
        showLBPHistogram(lbp,img);
    case 3
        hog= im.hog;
        showHOG(img, hog);
   
        
end
