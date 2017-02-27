% Kourosh Khademi Saysan 
% ELEC 459, Experiment 4, main code
% Explanation:
% file_number: 1 for lena256, 2 for peppers512, 3 for lena256n, 4 for
% peppers512n
% N: size of LoG mask, sig: parameter sigma in Gaussian function
% th: threshold for zero-crossing for edge_log, thresh: threshold for
% edge_sobel
% Example: edge_detect(1,0,0,0,148)

function h = edge_detect(file_number,N,sig,th,thresh)

load lena256.mat;
load peppers512.mat;

randn('state',5)
lena256n = lena256 + 15*randn(256);
peppers512n = peppers512 + 15*randn(512);

if file_number == 1 && th == 0,
    x = lena256;
    e = edge_sobel(x,thresh);

elseif file_number == 2 && th == 0,
    x = peppers512;
    e = edge_sobel(x,thresh);

elseif file_number == 3 && th == 0,
    x = lena256n;
    e = edge_sobel(x,thresh);

elseif file_number == 4 && th == 0,
    x = peppers512n;
    e = edge_sobel(x,thresh);
end

if file_number == 1 && th ~= 0,
    x = lena256;
    e = edge_log(x,N,sig,th);

elseif file_number == 2 && th ~= 0,
    x = peppers512;
    e = edge_log(x,N,sig,th);

elseif file_number == 3 && th ~= 0,
    x = lena256n;
    e = edge_log(x,N,sig,th);

elseif file_number == 4 && th ~= 0,
    x = peppers512n;
    e = edge_log(x,N,sig,th);
end
