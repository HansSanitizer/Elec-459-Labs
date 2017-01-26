load('xn.mat');
fs = 128;
t = 0:0.01:14;
fmax = 64;

s1 = xn(1:129);
s2 = xn(1:257);
s3 = xn(1:513);
s4 = xn(1:1025);
s5 = xn(1:1793);

figure;

fft_s1 = abs(fft(s1));
f = 0:fmax;
subplot(6,1,1), plot(f,fft_s1);
title('FFT with 128 Samples');
xlabel('f (Hz)');
ylabel('Magnitude');
axis([min(f),max(f),min(fft_s1),max(fft_s1)]);
grid on;

fft_s2 = abs(fft(s2));
f = 0:fmax/(length(s2)-1):fmax;
subplot(6,1,2), plot(f,fft_s2);
title('FFT with 256 Samples');
xlabel('f (Hz)');
ylabel('Magnitude');
axis([min(f),max(f),min(fft_s2),max(fft_s2)]);
grid on;

fft_s3 = abs(fft(s3));
f = 0:fmax/(length(s3)-1):fmax;
subplot(6,1,3), plot(f,fft_s3);
title('FFT with 512 Samples');
xlabel('f (Hz)');
ylabel('Magnitude');
axis([min(f),max(f),min(fft_s3),max(fft_s3)]);
grid on;

fft_s4 = abs(fft(s4));
f = 0:fmax/(length(s4)-1):fmax;
subplot(6,1,4), plot(f,fft_s4);
title('FFT with 1025 Samples');
xlabel('f (Hz)');
ylabel('Magnitude');
axis([min(f),max(f),min(fft_s4),max(fft_s4)]);
grid on;

fft_s5 = abs(fft(s5));
f = 0:fmax/(length(s5)-1):fmax;
subplot(6,1,5), plot(f,fft_s5);
title('FFT with 1793 Samples');
xlabel('f (Hz)');
ylabel('Magnitude');
axis([min(f),max(f),min(fft_s5),max(fft_s5)]);
grid on;

% averaging
k = 128;
l = (length(xn)-1)/128;
dft = zeros(k,l);
offset = 0; 

for i=1:l
    for j=1:k+1
    dft(j,i) = xn(j+offset);    
    end
    offset = offset + k;
end

dft = fft(dft);
avg = sum(dft,2)/l;
avg = abs(avg);

plot(0:128/k:128, avg);
title('DFT Averaging');
xlabel('f (Hz)');
ylabel('Magnitude');
axis([min(f),max(f),min(avg),max(avg)]);
grid on;



