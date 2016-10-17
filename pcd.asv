a=imread('IMG_20161012_184048.jpg');

r=a(:,:,1);
g=a(:,:,2);
b=a(:,:,3);

[p1 p2]=size(r);

%greyscale%
for i=1:p1;
    for j=1:p2;
    c(i,j)=mean([r(i,j),g(i,j),b(i,j)]);
    end;
end;
c=uint8(c);

%logaritmik%
lg=0.5*(log(double(c)+1));
lg=uint8(lg);
subplot (2,2,1);imhist(lg)
subplot (2,2,2);imshow(lg)

%pengurangan penambahan%
ac1=c+80;
subplot (2,2,1);imhist(ac1)
subplot (2,2,2);imshow(ac1)


%sobel filtering%
for i=1:(p1-2);
    for j=1:(p2-2);
        sbx=((2*ac1(i+2,j+1))+ac1(i+2,j)+ac1(i+2,j+2))-((2*ac1(i,j+1))+ac1(i,j)+ac1(i,j+2));
        sby=((2*ac1(i+1,j+2))+ac1(i,j+2)+ac1(i+2,j+2))-((2*ac1(i+1,j))+ac1(i,j)+ac1(i+2,j));
        sbf(i,j)=sqrt(double(sbx).^2+double(sby).^2);
    end
end

figure,imshow(sbf)
