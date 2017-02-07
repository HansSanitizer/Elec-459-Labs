function [ S10, S40, S90 ] = compress_459 ( image )
%compress_459 Returns compressed versions of image with q 10, 40, and 90
%respectively.
%
%   Detailed explanation goes here.

Q50 = [ 16 11 10 16 24 40 51 61;
        12 12 14 19 26 58 60 55;
        14 13 16 24 40 57 69 56;
        14 17 22 29 51 87 80 62; 
        18 22 37 56 68 109 103 77;
        24 35 55 64 81 104 113 92;
        49 64 78 87 103 121 120 101;
        72 92 95 98 112 100 103 99];
    
% quality mats for q levels of 10, 40, 90

Q10 = (50/10)*Q50;
Q40 = (50/40)*Q50;
Q90 = ((100-90)/50)*Q50;

% Get dimensions of image.
[m, n] = size(image); 

% Level-Off and 2D DCT
for i = 1:n/8
    x = 1+i*8-8:i*8;
    for j = 1:m/8        
        y = 1+j*8-8:j*8;
        C = dct2(image(y,x)-128); 
        
        % quantizied C mats
        S10(y,x) = round(C./Q10);
        S40(y,x) = round(C./Q40);
        S90(y,x) = round(C./Q90);
    end    
end


end

