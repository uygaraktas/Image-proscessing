% % % % % % % % % % % % % % % % % 
% yeğinlik dilimleme

I=imread('bahce.JPG');

a=bitand(I,128);b=bitand(I,64);c=bitand(I,32);
d=bitand(I,16);e=bitand(I,8);f=bitand(I,4);
g=bitand(I,2);h=bitand(I,1);

subplot(3,3,1);imshow(a);subplot(3,3,2);imshow(b);
subplot(3,3,3);imshow(c);subplot(3,3,4);imshow(d);
subplot(3,3,5);imshow(e);subplot(3,3,6);imshow(f);
subplot(3,3,7);imshow(g);subplot(3,3,8);imshow(h);

imshowpair(I,a,'montage');
title('normal                             ilk katman');



% % % % % % % % % % 
% Histogram denkleştirme fonksion ile 

function J=histdenk(I)
numofpixels=size(I,1)*size(I,2);

J=uint8(zeros(size(I,1),size(I,2)));
freq=zeros(256,1);probf=zeros(256,1);
probc=zeros(256,1);cum=zeros(256,1);
output=zeros(256,1);
for i=1:size(I,1)
for j=1:size(I,2)
value=I(i,j);
freq(value+1)=freq(value+1)+1;
probf(value+1)=freq(value+1)/numofpixels;
end
end
no_bins=255; %(L-1)
sum=0;
for i=1:size(probf)
sum=sum+freq(i);
cum(i)=sum;
probc(i)=cum(i)/numofpixels;
output(i)=round(probc(i)*no_bins);
end
for i=1:size(I,1)
for j=1:size(I,2)
J(i,j)=output(I(i,j)+1);
end
end
subplot(2,2,1);imshow(I);subplot(2,2,2);imshow(J);
subplot(2,2,3);imhist(I);subplot(2,2,4);imhist(J);
end


I=imread("cameraman.tif");
L=8;
J=histdenk(I);







% % % % % % % % % % % % % % % % % % % % 
% Histogram denkleştirme Built-in

I = imread('kamera1.png');
J = histeq(I);
imshow(I);
imshow(J);
imhist(I);
imhist(J);

