prompt = {'Enter id of the image you want to confront:', 'Enter wanted number of images:','Enter feature (1= color moments, 2 = LBP, 3 = Hog, 4 = Sift):'};
dlgtitle = 'Show similar images';
%definput = {'20','hsv'};
answer = inputdlg(prompt,dlgtitle);
id= str2num(answer{1});
k= str2num(answer{2});
model= str2num(answer{3});
im=(imInfo(arrayfun(@(s) ismember(id, s.id), imInfo)));
indexes= showkSimilarities(model, im, imInfo);
if (model==4)
    [val,idx]=maxk(indexes, k+1); 
    %mont= {};
    for i= 1: length(idx)
        ind=idx(i);
        sim=(imInfo(arrayfun(@(s) ismember(ind, s.id), imInfo)));
        mont{i}=sim.img;
    end

    %montage(mont);
    for i=1:k+1
        disp("Valore di somiglianza con immagine num. "+ idx(i)+ " : "+ val(i));
    end
else
    [val,idx]=mink(indexes, k+1); 
    mont= {};
    for i= 1: length(idx)
        ind=idx(i);
        sim=(imInfo(arrayfun(@(s) ismember(ind, s.id), imInfo)));
        mont{i}=sim.img;
    end

    montage(mont);
    for i=1:k+1
        disp("Valore di somiglianza con immagine num. "+ idx(i)+ " : "+ val(i));
    end
end




