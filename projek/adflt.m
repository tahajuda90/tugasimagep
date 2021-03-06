function [ gmbrbru ] = adflt( b )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

uk=size(b,1)*size(b,2);

b1=imnoise(b,'gaussian',0,0.015);
%figure,imshow(b1);

b1= double(b1);

%membuat jarak matriks 0 terhadap matriks gambar
M=6;
N=6;

%menempatkan matriks 0 diluar matriks gambar
C=padarray(b1,[round(M/2),round(N/2)]);

%membuat matriks variance
lvar=zeros([size(b1,1) size(b1,2)]);
%membuat matriks mean
lmean=zeros([size(b1,1) size(b1,2)]);
%membuat matriks untuk angka sementara
temp=zeros([size(b1,1) size(b1,2)]);
%membuat matriks untuk hasil dari adaptive filtering
gmbrbru=zeros([size(b1,1) size(b1,2)]);

for i=1:size(C,1)-M-1
    for j=1:size(C,2)-N-1
        
        
        temp=C(i:i+(M-1),j:j+(N-1));
        tmp=reshape(temp,[1,(M*N)]);
             %mencari nilai mean lokal dan variance lokal        
        lmean(i,j)=mean(tmp);
        lvar(i,j)=mean(tmp.^2)-mean(tmp).^2;
        
    end
end

%Noise variance dan rata2 local variance
nvar=sum(lvar(:))/uk;

%mencari nilai max antara lokal variance dan noise variance nilai max akan
%menjadi nilai lokal variance
 lvar=max(lvar,nvar);     

 %rumus adaptive filtering = gambar - (noise variance/local variance)*(gambar-local_mean);
 gmbrbru=nvar./lvar;
 gmbrbru=gmbrbru.*(b1-lmean);
 gmbrbru=b1-gmbrbru;

 
 %Convert the image to uint8 format.
 gmbrbru=uint8(gmbrbru);
 

end

