load('lena256.mat');
load('peppers512.mat');
randn('state',5);
lena256n = lena256 + 15*randn(256);
peppers512n = peppers512 + 15*randn(512);
