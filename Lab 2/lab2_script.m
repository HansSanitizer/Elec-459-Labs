% Boat
[boat512_S10, boat512_S40, boat512_S90] = compress_459(boat512);
boat512_E10 = decompress_459(boat512_S10,10);
boat512_E40 = decompress_459(boat512_S40,40);
boat512_E90 = decompress_459(boat512_S90,90);

figure;
subplot(2,2,1), image(boat512);
title('Boat512');

subplot(2,2,2), image(boat512_E10);
title('Boat512 Q10');

subplot(2,2,3), image(boat512_E40);
title('Boat512 Q40');

subplot(2,2,4), image(boat512_E90);
title('Boat512 Q90');

% Camera
[camera256_S10, camera256_S40, camera256_S90] = compress_459(camera256);
camera256_E10 = decompress_459(camera256_S10,10);
camera256_E40 = decompress_459(camera256_S40,40);
camera256_E90 = decompress_459(camera256_S90,90);

figure;
subplot(2,2,1), image(camera256);
title('Camera256');

subplot(2,2,2), image(camera256_E10);
title('Camera256 Q10');

subplot(2,2,3), image(camera256_E40);
title('Camera256 Q40');

subplot(2,2,4), image(camera256_E90);
title('Camera256 Q90');

% Gold Hill
[goldhill512_S10, goldhill512_S40, goldhill512_S90] = compress_459(goldhill512);
goldhill512_E10 = decompress_459(goldhill512_S10,10);
goldhill512_E40 = decompress_459(goldhill512_S40,40);
goldhill512_E90 = decompress_459(goldhill512_S90,90);

figure;
subplot(2,2,1), image(goldhill512);
title('Goldhill512');

subplot(2,2,2), image(goldhill512_E10);
title('Goldhill512 Q10');

subplot(2,2,3), image(goldhill512_E40);
title('Goldhill512 Q40');

subplot(2,2,4), image(goldhill512_E90);
title('Goldhill512 Q90');

% Peppers
[peppers512_S10, peppers512_S40, peppers512_S90] = compress_459(peppers512);
peppers512_E10 = decompress_459(peppers512_S10,10);
peppers512_E40 = decompress_459(peppers512_S40,40);
peppers512_E90 = decompress_459(peppers512_S90,90);

figure;
subplot(2,2,1), image(peppers512);
title('peppers512');

subplot(2,2,2), image(peppers512_E10);
title('peppers512 Q10');

subplot(2,2,3), image(peppers512_E40);
title('peppers512 Q40');

subplot(2,2,4), image(peppers512_E90);
title('peppers512 Q90');
