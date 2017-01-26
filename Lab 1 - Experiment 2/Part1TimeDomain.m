load('xn.mat');
Fs = 128;   %Sampling Frequency
T = 1/Fs;   %Sampling Period

s1 = xn(1:129);
s2 = xn(1:257);
s3 = xn(1:513);
s4 = xn(1:1025);
s5 = xn(1:1793);

ls1 = length(s1);
ls2 = length(s2);
ls3 = length(s3);
ls4 = length(s4);
ls5 = length(s5);

ts1 = (0:ls1-1)*T;
ts2 = (0:ls2-1)*T;
ts3 = (0:ls3-1)*T;
ts4 = (0:ls4-1)*T;
ts5 = (0:ls5-1)*T;

plot(ts5,s5,ts4,s4,ts3,s3,ts2,s2,ts1,s1);

title('x[n] Subsets Time Domain Plot');
xlabel('t (seconds)');
ylabel('x(nTs)');
legend('s5','s4','s3','s2','s1');
