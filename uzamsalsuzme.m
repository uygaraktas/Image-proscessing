% %  UZAMSAL SÜZME UYGULAMASI % %

% Orjinal görüntü
I=rgb2gray(imread('petra2.jpg'));
imshow(I);

% Gauss Görüntü 
In=imnoise(I,'gaussian',0.02); 
imshow(I1);

% Ortalama Filtre eklenmiş hali
h_ort=[1 1 1;1 1 1;1 1 1]*1/9;J=filtre(I,h_ort);
imshow(J);

% Gauss Filtre 
sigma=1.76; sz=2;
h=gaussfiltre(sigma,sz); 
J=filtre(I,h);
imshow(J);

% Ortanca Filtre 
I_med=sirafiltre(In,5,'median');

% Laplace Filtre Eklenmiş hali
h_lap=[0 1 0;1 -4 1;0 1 0];
I_lap=filtre(I,h_lap);

% Sobel Filtre 
h_sob_x=[-1 -2 -1;0 0 0;1 2 1];
h_sob_y=[-1 0 1;-2 0 2;-1 0 1];
I_sob=filtre(I,h_sob_x)+filtre(I,h_sob_y); 

% Perwitt Filtre 
h_pw_y=[-1 0 1;-2 0 2;-1 0 1];
h_pw_x=[-1 -2 -1;0 0 0;1 2 1];
I_pw=filtre(I,h_pw_x)+filtre(I,h_pw_y);

