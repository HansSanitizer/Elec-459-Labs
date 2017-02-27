%Load Images
load('boat512.mat');
load('camera256.mat');
load('goldhill512.mat');
load('peppers512.mat');

%Compress and Decompress images at different levels and plot them

%Boat
[boat512_S10, boat512_S40, boat512_S90] = compress_459(boat512);
boat512_E10 = decompress_459(boat512_S10,10);
boat512_E40 = decompress_459(boat512_S40,40);
boat512_E90 = decompress_459(boat512_S90,90);

figure;
subplot(2,2,1), imshow(uint8(boat512));
title('Boat512');

subplot(2,2,2), imshow(uint8(boat512_E10));
title('Boat512 Q10');

subplot(2,2,3), imshow(uint8(boat512_E40));
title('Boat512 Q40');

subplot(2,2,4), imshow(uint8(boat512_E90));
title('Boat512 Q90');

% Camera
[camera256_S10, camera256_S40, camera256_S90] = compress_459(camera256);
camera256_E10 = decompress_459(camera256_S10,10);
camera256_E40 = decompress_459(camera256_S40,40);
camera256_E90 = decompress_459(camera256_S90,90);

figure;
subplot(2,2,1), imshow(uint8(camera256));
title('Camera256');

subplot(2,2,2), imshow(uint8(camera256_E10));
title('Camera256 Q10');

subplot(2,2,3), imshow(uint8(camera256_E40));
title('Camera256 Q40');

subplot(2,2,4), imshow(uint8(camera256_E90));
title('Camera256 Q90');

% Gold Hill
[goldhill512_S10, goldhill512_S40, goldhill512_S90] = compress_459(goldhill512);
goldhill512_E10 = decompress_459(goldhill512_S10,10);
goldhill512_E40 = decompress_459(goldhill512_S40,40);
goldhill512_E90 = decompress_459(goldhill512_S90,90);

figure;
subplot(2,2,1), imshow(uint8(goldhill512));
title('Goldhill512');

subplot(2,2,2), imshow(uint8(goldhill512_E10));
title('Goldhill512 Q10');

subplot(2,2,3), imshow(uint8(goldhill512_E40));
title('Goldhill512 Q40');

subplot(2,2,4), imshow(uint8(goldhill512_E90));
title('Goldhill512 Q90');

% Peppers
[peppers512_S10, peppers512_S40, peppers512_S90] = compress_459(peppers512);
peppers512_E10 = decompress_459(peppers512_S10,10);
peppers512_E40 = decompress_459(peppers512_S40,40);
peppers512_E90 = decompress_459(peppers512_S90,90);

figure;
subplot(2,2,1), imshow(uint8(peppers512));
title('peppers512');

subplot(2,2,2), imshow(uint8(peppers512_E10));
title('peppers512 Q10');

subplot(2,2,3), imshow(uint8(peppers512_E40));
title('peppers512 Q40');

subplot(2,2,4), imshow(uint8(peppers512_E90));
title('peppers512 Q90');

%Calculate Mean Squared Error Used in the PSNR calulations
boat512_E10_ms = mean(mean((boat512_E10 - boat512).^2));
boat512_E40_ms = mean(mean((boat512_E40 - boat512).^2));
boat512_E90_ms = mean(mean((boat512_E90 - boat512).^2));

camera256_E10_ms = mean(mean((camera256_E10 - camera256).^2));
camera256_E40_ms = mean(mean((camera256_E40 - camera256).^2));
camera256_E90_ms = mean(mean((camera256_E90 - camera256).^2));

goldhill512_E10_ms = mean(mean((goldhill512_E10 - goldhill512).^2));
goldhill512_E40_ms = mean(mean((goldhill512_E40 - goldhill512).^2));
goldhill512_E90_ms = mean(mean((goldhill512_E90 - goldhill512).^2));

peppers512_E10_ms = mean(mean((peppers512_E10 - peppers512).^2));
peppers512_E40_ms = mean(mean((peppers512_E40 - peppers512).^2));
peppers512_E90_ms = mean(mean((peppers512_E90 - peppers512).^2));

%Calculate the PSNR for each image
boat512_E10_PSNR = 10*log10((((255)^2))/(boat512_E10_ms));
boat512_E40_PSNR = 10*log10((((255)^2))/(boat512_E40_ms));
boat512_E90_PSNR = 10*log10((((255)^2))/(boat512_E90_ms));

camera256_E10_PSNR = 10*log10((((255)^2))/(camera256_E10_ms));
camera256_E40_PSNR = 10*log10((((255)^2))/(camera256_E40_ms));
camera256_E90_PSNR = 10*log10((((255)^2))/(camera256_E90_ms));

goldhill512_E10_PSNR = 10*log10((((255)^2))/(goldhill512_E10_ms));
goldhill512_E40_PSNR = 10*log10((((255)^2))/(goldhill512_E40_ms));
goldhill512_E90_PSNR = 10*log10((((255)^2))/(goldhill512_E90_ms));

peppers512_E10_PSNR = 10*log10((((255)^2))/(peppers512_E10_ms));
peppers512_E40_PSNR = 10*log10((((255)^2))/(peppers512_E40_ms));
peppers512_E90_PSNR = 10*log10((((255)^2))/(peppers512_E90_ms));

%Calculate the percentage of zeros for each image
boat512_S10_zeros = 100*(1- nnz(boat512_S10)/(512^2));
boat512_S40_zeros = 100*(1- nnz(boat512_S40)/(512^2));
boat512_S90_zeros = 100*(1- nnz(boat512_S90)/(512^2));

camera256_S10_zeros = 100*(1- nnz(camera256_S10)/(256^2));
camera256_S40_zeros = 100*(1- nnz(camera256_S40)/(256^2));
camera256_S90_zeros = 100*(1- nnz(camera256_S90)/(252^2));

goldhill512_S10_zeros = 100*(1- nnz(goldhill512_S10)/(512^2));
goldhill512_S40_zeros = 100*(1- nnz(goldhill512_S40)/(512^2));
goldhill512_S90_zeros = 100*(1- nnz(goldhill512_S90)/(512^2));

peppers512_S10_zeros = 100*(1- nnz(peppers512_S10)/(512^2));
peppers512_S40_zeros = 100*(1- nnz(peppers512_S40)/(512^2));
peppers512_S90_zeros = 100*(1- nnz(peppers512_S90)/(512^2));
