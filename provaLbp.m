   I=imgs{1};
   figure,imshow(I)   
   %%Crop    
   I2 = imcrop(I);   
   figure, imshow(I2) 
   w=size(I2,1);     
   h=size(I2,2);  
   %%LBP    
   scale = 2.^[7 6 5; 0 -inf 4; 1 2 3];  
    for i=2:w-1   
      for j=2:h-1    
         J0=I2(i,j);   
          I3(i-1,j-1)=I2(i-1,j-1)>J0;  
           I3(i-1,j)=I2(i-1,j)>J0;   
          I3(i-1,j+1)=I2(i-1,j+1)>J0;  
            I3(i,j+1)=I2(i,j+1)>J0;     
        I3(i+1,j+1)=I2(i+1,j+1)>J0;    
          I3(i+1,j)=I2(i+1,j)>J0;      
        I3(i+1,j-1)=I2(i+1,j-1)>J0;     
         I3(i,j-1)=I2(i,j-1)>J0; 
         I2(i-1,j-1)=I3(i-1,j-1)*2^7+I3(i-1,j)*2^6+I3(i-1,j+1)*2^5+I3(i,j+1)*2^4+I3(i+1,j+1)*2^3+I3(i+1,j)*2^2+I3(i+1,j-1)*2^1+I3(i,j-1)*2^0;
      end
    end