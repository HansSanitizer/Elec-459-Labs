% MATLAB Code for Experimet 4: Two-Dimensional Digital Filtering for Edge Detection 
%Inpust: x - gray-scale image
%           N - size of the LoG mask
%           sig - parameter sigma in the Gaussian function
%           th - threshold for zero-crossing
%   Output: e - binary (0 or 255) edge map of the input signal
%   Note: the function recalls function comp_log.m
%   Example: e = edge_log(camera256,3,0.9)

function e = edge_log(x,N,sig,th)
[m,n] = size(x);
r = 2:(m-1);
c = 2:(n-1);
% Prepare a LoG mask and compute LoG of the image
H = comp_log(N,sig);
w = imfilter(x,H);
e = zeros(m,n);
% Arbitrarily choose the edge to be the negative point
% Look for zero crossings: + - , - +, and their transposes
[rx,cx] = find(w(r,c)<0 & w(r,c+1)>0 & abs(w(r,c)-w(r,c+1))>th);    %[- +]
e((rx+1)+cx*m) = 1;
[rx,cx] = find(w(r,c-1)>0 & w(r,c)<0 & abs(w(r,c-1)-w(r,c))>th);    %[+ -]
e((rx+1)+cx*m) = 1;
[rx,cx] = find(w(r,c)<0 & w(r+1,c)>0 & abs(w(r,c)-w(r+1,c))>th);    %[- +]'
e((rx+1)+cx*m) = 1;
[rx,cx] = find(w(r-1,c)>0 & w(r,c)<0 & abs(w(r-1,c)-w(r,c))>th);    %[+ -]'
e((rx+1)+cx*m) = 1;
% Check to see if there are any points where LoG is exactly zero
[rz,cz] = find(w(r,c) == 0);
% Look for zero crossings: +0-,-0+ and their transposes
% edge lies on the zero points
if~isempty(rz)
    zr = (rz+1)+cz*m;  %Linear index for zero points
    zz = find(w(zr-1)<0 & w(zr+1)>0 & abs(w(zr-1)-w(zr+1))>2*th);  %[- 0 +]'
    e(zr(zz)) = 1;
    zz = find(w(zr-1)>0 & w(zr+1)<0 & abs(w(zr-1)-w(zr+1))>2*th);  %[+ 0 -]'
    e(zr(zz)) = 1;
    zz = find(w(zr-m)<0 & w(zr+m)>0 & abs(w(zr-m)-w(zr+m))>2*th);  %[- 0 +]
    e(zr(zz)) = 1;
    zz = find(w(zr-m)>0 & w(zr+m)<0 & abs(w(zr-m)-w(zr+m))>2*th);  %[+ 0 -]
    e(zr(zz)) = 1;
end
e = 255*e;