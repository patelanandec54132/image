clc
clear all
close all
masksize=input('Enter Mask Value: ');
x=imread('cameraman.tif');
x=imnoise(x,'salt & pepper');
figure(1);imshow(x)
[m,n,c]=size(x);
if c==3% if colour image convert to grayscale
    x=rgb2gray(x);
end
y=zeros(m+(masksize-1),n+(masksize-1));% m+size(mask11,1)-1
y((masksize+1)/2:m+((masksize-1)/2),(masksize+1)/2:n+((masksize-1)/2))=x(:,:);
z=zeros(m,n);
% mask5=[1 1 1 1 1;1 1 1 1 1 ;1 1 1 1 1;1 1 1 1 1;1 1 1 1 1];
% mask3=[1 1 1;1 1 1;1 1 1];
maskvalue=ones(masksize,masksize);
weightmask=sum(sum(maskvalue));
for i=(masksize+1)/2:m+(masksize-1)/2% (size(mask,1)-1)/2:(m+(size(mask,1)+1)/2)
    for j=(masksize+1)/2:n+(masksize-1)/2
        z(i-2,j-2)=sum(sum((y(i-(masksize-1)/2:i+(masksize-1)/2,j-(masksize-1)/2:j+(masksize-1)/2).*maskvalue)))/weightmask;
    end
end
figure(2);imshow(uint8(z));