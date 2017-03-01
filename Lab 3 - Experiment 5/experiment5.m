load homework_if;
testrow = homework_if(1,:);
Fs = 2*pi;
Ts = 1/Fs;
L = 760;
%t = (0:L-1)*Ts;

ffttestrow = fft(testrow);
P2 = abs(ffttestrow);
P1 = P2(1:L/2+1);
P1(2:end-1) = P1(2:end-1);
fn1 = Fs*(0:(L/2))/L;
figure(2);
plot(fn1/pi,P1);
xlabel('Normalized frequency (rad/s)');
ylabel('Magnitude');
h = win_fourier(51,4,[0.1 0.3], 2);
% 
% h1 = h(1:L);
% h1(2:end-1) = h1(2:end-1);
% h1fft = fft(h1);
% filtresult = P1.*h1fft;
% figure(3);
% plot(fn1/pi, abs(fft(h)));
% figure(4);
% plot(fn1/pi, P1);
% figure(5);
% plot(fn1/pi, abs(filtresult));
result = zeros(size(homework_if));
for n=1:size(homework_if,1)
homeworkifdenoise = conv(homework_if(n,1:end),h,'same');
result(n,:)= homeworkifdenoise;
end
figure(7);
imshow(result,[]);
%filtresult2 = abs(filtresult);
%filtresult1 = filtresult2(1:L/2+1);
%filtresult1(2:end-1)=2*filtresult1(2:end-1);
%plot(fn1/pi,filtresult1);

%homeworkfixed = conv(homework_if(h,'same');