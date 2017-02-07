function [x_inter] = elec459_lab1_inter( xd, k )
%   Takes a sample of values(xd) and a k value (k) and returns
%   an interpolated value (x_inter)
Xd = fft(xd);       %Perform DFT of xd and store as Xd
Nd = length(Xd);    %Save Length of Xd as Nd
%Nd is of odd length
if mod(Nd,2) ~= 0
    %Nd fitted to even length, halved, and stored as N1
    N1 = (Nd+1)/2;
    %Xd is padded with k*Nd zeros inserted in the middle and stored as Xe
    Xe = [Xd(1:N1); zeros(k*Nd,1); Xd((N1+1):Nd)];
%Nd is of even length   
else
    %Nd is havled then stored as N2.
    N2 = Nd/2;
    %Xd is padded with k*Nd zeros inserted in the middle and stored as Xe
    Xe = [Xd(1:N2); Xd(N2+1)/2; zeros(k*Nd-1,1); Xd(N2+1)/2; Xd((N2+2):Nd)];
end
%Inverse DFT of Xe stored as Xe_td
Xe_td = ifft(Xe);
%Time domain samples are multiplied by k+1 and stored as x_inter
x_inter = Xe_td(1:20000)*(k+1);
end

