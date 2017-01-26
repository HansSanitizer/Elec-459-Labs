load('xn.mat');
fs = 128;
t = 0:0.01:14;
fmax = 64;
f = 0:fmax;
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