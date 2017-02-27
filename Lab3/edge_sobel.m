% MATLAB Code for Experimet 4: Two-Dimensional Digital Filtering for Edge
% Detection
% Example : e = edge_sobel(building256,160)
function e = edge_sobel(x,thresh)
[m,n] = size(x);
H1 = [-1 0 1; -2 0 2; -1 0 1];
H2 = H1';
z1 = imfilter(x,H1);
z2 = imfilter(x,H2);
map = gray(256);
subplot(221)
imshow(x,map);
title('Test Image')
xlabel('(a)')
subplot(222)
imshow(z1,map);
title('Result of Convolving H1 with the Image')
xlabel('(b)')
subplot(223)
imshow(z2,map);
title('Result of Convolving H2 with the Image')
xlabel('(c)')
subplot(224)
z = sqrt(z1.^2 + z2.^2);
e = zeros(m,n);
ind = find(z >= thresh);
e(ind) = 255;
imshow(e,map)
title(['Result of Sobel Edge Detection with Treshold = ', num2str(thresh)])
xlabel('(d)')
end
