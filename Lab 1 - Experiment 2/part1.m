%Load the provided sample
load('xn.mat');
%Sampling frequency is 128Hz
fs = 128;
%Runtime of sample is 14 seconds
%Create vector from 0 to 14 seconds with 0.01s increments
t = 0:0.01:14;
%Maximum sampled frequency is 64Hz
fmax = 64;

%Subset 1 takes the first 128 samples
s1 = xn(1:129);
%Subset 2 takes the first 256 samples
s2 = xn(1:257);
%Subset 3 takes the first 512 samples
s3 = xn(1:513);
%Subset 4 takes the first 1025 samples
s4 = xn(1:1025);
%Subset 5 takes the first 1792 samples
s5 = xn(1:1793);

%Create a figure which shows the fft magnitude of each
%set of samples
figure;

%Create magnitude spectrum of subset 1
fft_s1 = abs(fft(s1));
%The frequency range is 0 to 64Hz
f = 0:fmax;
%Plot the fft values against frequency
subplot(6,1,1), plot(f,fft_s1(1:(128/2)+1));
%Add title and label each axis
title('FFT with 128 Samples');
xlabel('f (Hz)');
ylabel('Magnitude');
%Fit axis to information
axis([min(f),max(f),min(fft_s1),max(fft_s1)]);
%Apply a grid to the plot
grid on;

%Remaining plots follow the same procedure as subset 1
fft_s2 = abs(fft(s2));
f = 0:fmax/(256/2):fmax;
subplot(6,1,2), plot(f,fft_s2(1:(256/2)+1));
title('FFT with 256 Samples');
xlabel('f (Hz)');
ylabel('Magnitude');
axis([min(f),max(f),min(fft_s2),max(fft_s2)]);
grid on;

fft_s3 = abs(fft(s3));
f = 0:fmax/(512/2):fmax;
subplot(6,1,3), plot(f,fft_s3(1:(512/2)+1));
title('FFT with 512 Samples');
xlabel('f (Hz)');
ylabel('Magnitude');
axis([min(f),max(f),min(fft_s3),max(fft_s3)]);
grid on;

fft_s4 = abs(fft(s4));
f = 0:fmax/(1024/2):fmax;
subplot(6,1,4), plot(f,fft_s4(1:(1024/2)+1));
title('FFT with 1025 Samples');
xlabel('f (Hz)');
ylabel('Magnitude');
axis([min(f),max(f),min(fft_s4),max(fft_s4(1:(1792/2)+1))]);
grid on;

fft_s5 = abs(fft(s5));
f = 0:fmax/(1792/2):fmax;
subplot(6,1,5), plot(f,fft_s5(1:(1792/2)+1));
title('FFT with 1793 Samples');
xlabel('f (Hz)');
ylabel('Magnitude');
axis([min(f),max(f),min(fft_s5),max(fft_s5)]);
grid on;

%   DFT Averaging Implementation
%   l=14
k = 128;
l = 14;
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

subplot(6,1,6), plot(0:128/k:128, avg);
title('DFT Averaging');
xlabel('f (Hz)');
ylabel('Magnitude');
axis([min(f),max(f),min(avg),max(avg)]);
grid on;

% averaging with different values of l
figure
for l=1:14
    k = 128;
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

    subplot(2,7,l),plot(0:128/k:128, avg);
    title(strcat('DFT Averaging with l=', int2str(l)));
    xlabel('f (Hz)');
    ylabel('Magnitude');
    axis([min(f),max(f),min(avg),max(avg)]);
    grid on;
end

% averaging- l=14, k = 100
k = 100;
l = 14;
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

figure
plot(0:128/k:128, avg);
title('DFT Averaging with k=100');
xlabel('f (Hz)');
ylabel('Magnitude');
axis([min(f),max(f),min(avg),max(avg)]);
grid on;

% averaging- l=14, k = 135
% For this to work, we need more data, or to guess the data.
k = 135;
l = 14;
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

figure
plot(0:128/k:128, avg);
title('DFT Averaging with k=135');
xlabel('f (Hz)');
ylabel('Magnitude');
axis([min(f),max(f),min(avg),max(avg)]);
grid on;





