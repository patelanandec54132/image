clc
clear all
close all

x=imread('cameraman.tif');
x=imnoise(x,'salt & pepper');
figure(1);imshow(x)
[m,n,c]=size(x);
if c==3% if colour image convert to grayscale
    x=rgb2gray(x);
end
y=zeros(m+4,n+4);% m+size(mask,1)-1
y(3:m+2,3:n+2)=x(:,:);
z=zeros(m,n);
mask5=[1 1 1 1 1;1 1 1 1 1 ;1 1 1 1 1;1 1 1 1 1;1 1 1 1 1];
mask3=[1 1 1;1 1 1;1 1 1];
weightmask=sum(sum(mask5));
for i=3:m+2% (size(mask,1)-1)/2:(m+(size(mask,1)+1)/2)
    for j=3:n+2
        z(i-2,j-2)=sum(sum((y(i-2:i+2,j-2:j+2).*mask5)))/sum(sum(mask5));
    end
end
figure(2);imshow(uint8(z));