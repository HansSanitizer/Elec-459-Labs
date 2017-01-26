function [x_inter] = elec459_lab1_inter( xd, k )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

Xd = fft(xd);
Nd = length(Xd);

if mod(Nd,2) ~= 0
    N1 = (Nd+1)/2;
    Xe = [Xd(1:N1); zeros(k*Nd,1); Xd((N1+1):Nd)];
else
    N2 = Nd/2;
    Xe = [Xd(1:N2); Xd(N2+1)/2; zeros(k*Nd-1,1); Xd(N2+1)/2; Xd((N2+2):Nd)];
end

Xe_td = ifft(Xe);
x_inter = Xe_td*(k+1);

end

