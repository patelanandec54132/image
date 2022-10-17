c = imread('cameraman.tif');
msg='helloworld';
c(1:1:1)= length(msg) ; %to count massage Char to easly retrive all the massage 
c=imresize(c,[size(c,1) size(c,2)],'nearest');
message = msg ; %add ' .' to prevint lossing one char  
message = strtrim(message);
m = length(message) * 8;
AsciiCode = uint8(message);
binaryString = transpose(dec2bin(AsciiCode,8));
binaryString = binaryString(:);
N = length(binaryString);
b = zeros(N,1);
for k = 1:N
  if(binaryString(k) == '1')
      b(k) = 1;
  else
      b(k) = 0;
  end
end
s = c;
  height = size(c,1);
  width = size(c,2);
k = 1;
for i = 1 : height
  for j = 1 : width
      LSB = mod(double(c(i,j)), 2);
      if (k>m || LSB == b(k))
          s(i,j) = c(i,j);
      elseif(LSB == 1)
          s(i,j) = (c(i,j) - 1);
      elseif(LSB == 0)
          s(i,j) = (c(i,j) + 1);
      end
  k = k + 1;
  end
end
imgWTxt = 'msgimage.png';
imwrite(s,imgWTxt);
% RECOBVERY
s = imread('msgimage.png');
height = size(s,1);
width = size(s,2);
m =  double( s(1:1:1) ) * 8  ;
k = 1;
for i = 1 : height
  for j = 1 : width
      if (k <= m)
          b(k) = mod(double(s(i,j)),2);
          k = k + 1;
      end
  end
end
binaryVector = b;
binValues = [ 128 64 32 16 8 4 2 1 ];
binaryVector = binaryVector(:);
if mod(length(binaryVector),8) ~= 0
error('Length of binary vector must be a multiple of 8.');
end
binMatrix = reshape(binaryVector,8,[]);
textString = char(binValues*binMatrix);
disp(textString);