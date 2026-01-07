%Amir_Eqtedaei
clc;clear all;

I= imread('3.jpg');
subplot(231);imshow(I),title('Original Image');
[m n] = size(I);
%% HE
Pr = imhist(I)/(m*n) ;
s=cumsum(Pr);
 Hu=s(I+1); %%HE
 %% UH
%  Pr = (1/256)*ones(256,1) ;
% s=cumsum(Pr);
%  Hu=s(I+1); %%UH
 %% CLAHE
 im2 = adapthisteq(I);
subplot(234); imshow(im2), title(' CLAHE')

 %% Modfied Histogram
 a=.55;
 H=im2double(I);
 Hp=a*H+(1-a)*Hu; %Modfied Histogram
 %% US
 w=[0 -1  0;   -1  5 -1;    0 -1  0];
L=imfilter(I,w);
%%
subplot(232); imshow(Hu), title('HE')
subplot(233); imshow(uint8(L)),title('US');
subplot(235); imshow(Hp), title('Modfied Histogram')
% figure , imhist(I), title('Main Image Histogram')
% figure , imhist(Hu), title('output histogram equlzation')
% figure , imhist(Hp), title('output Modfied Histogram')

