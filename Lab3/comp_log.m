function z = comp_log(N,sig)
N1 = (N-1)/2;
[x,y]=meshgrid(-N1:N1,-N1:N1);
ew = exp(-(x.*x+y.*y)/(2*sig^2));
y=(x.*x+y.*y-2*sig^2)/(2*pi*sig^6);
z=y.^ew;
z=z-sum(z(:))/N^2;
end
