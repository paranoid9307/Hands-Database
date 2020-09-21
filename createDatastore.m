imds= imageDatastore("Hands/","FileExtensions",".jpg");
len= length(imds.Files);
imgs=readall(imds);