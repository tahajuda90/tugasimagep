clear all
I=imread('sampleprj15.jpg');
b=rgb2gray(I);


NewImg=histeq(b);
hasil1=adflt(NewImg);
level=graythresh(hasil1);
coba=im2bw(hasil1,level);

 
%  %thresholding
%  for bar=1:size(hasil,1)
%      for kol=1:size(hasil,2)
%          if hasil(bar,kol) >= mean(max(hasil))
%              coba(bar,kol)=255;
%          else
%              coba(bar,kol)=0;
%          end
%      end
%  end
 
 %opening&closing coba


subplot(2,1,1),imshow(coba);
subplot(2,1,2),imshow(hasil);

 
