% % 
webcamlist;
cam=webcam("HD Webcam");
ilk=snapshot(cam);
imshow(ilk);

ilk=imread('ilk.jpg');
ilk(300:305,180:300,1:3)=0;
ilk(300:450,180:185,1:3)=0;
ilk(300:450,295:300,1:3)=0;
ilk(450:455,180:300,1:3)=0;
imshow(ilk);
ilk1=ilk(300:455,180:300,1:3);
imshow(ilk1);



% % 
direnc=imread("direnc.jpg");
% imshow(direnc);

direnc(300:305,180:300,1:3)=0;
direnc(300:450,180:185,1:3)=0;
direnc(300:450,295:300,1:3)=0;
direnc(450:455,180:300,1:3)=0;
imshow(direnc);
% sınırları belirliyorum

% % 
direnc1=direnc(300:455,180:300,1:3);
imshow(direnc1);

% % 
hsv=rgb2hsv(direnc1);
imshow(hsv);
datacursormode;
% 0,45-0,50 hsv matrisinin 1. bileşeni olan
% renk parametresi değişmekte

% % 
a=hsv(:,:,1);
% renk katmanını ayırıyorum.
% imshow(a);
b=inRange(a,0.45,0.50);
% binarize fonksyonunu kullanarak renk katmanını binarize ediyorum.
imshow(b);

% % 
while 1

feat_k=(mean(b(:)));
disp(feat_k);
% binarize fotoğraftaki bitlerin ortalamasını aldık ve bu 0.01686 bulduk 
imshow(direnc1);
% imshow(ilk1);
if feat_k>0.1
    text(10,50,'Yesil','Color','g','fontsize',15);
else
    text(10,50,'Renk yok','Color','white','fontsize',15);
end
pause(0.001);
end
% 0.01686 if döngüsündeki koşulun 0.01686 değerinin üstüne veya altına göre
% sonuç, yani yazan yazı değişiyor.

% % 
while 1
    feat_k=mean(b(:));
    [m,n]=find(b==1);
    m1=round(mean(m));
    n1=round(mean(n));

    imshow(direnc1);
    if feat_k>0.01
        text(10,30,'Yesil','Color','g','fontsize',15);
        hold on;
        t= 0:0.001:1;
        plot(cos(2*pi*t)*25+n1,sin(2*pi*t)*25+m1,'g');
        hold off;
    end
    pause(0.001);
end