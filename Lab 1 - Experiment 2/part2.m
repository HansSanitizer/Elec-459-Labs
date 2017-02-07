%Loads handel sample
load handel;
%Set sample length of 20000 samples and save as N
N = 20000;
%Create a vector x with 20000 samples of handel
x = y(1:N);
%Downsample x vector to create vectors x2, x3, x4
x2 = x(1:2:N);
x3 = x(1:3:N);
x4 = x(1:4:N);

%Call interpolate function to create td samples
%x_inter2 xd=x2, k=1
x_inter2 = elec459_lab1_inter (x2, 1);
%x_inter3 xd=x3, k=2
x_inter3 = elec459_lab1_inter (x3, 2);
%x_inter4 xd=x4, k=3
x_inter4 = elec459_lab1_inter (x4, 3);

%Create figure comparing x and interpolated versions
figure;

%create subplots for x2, x3, x4
%x2 Plot
%Display x samples as blue circles
subplot(3,1,1), plot(x(1:50),'bo');
%Hold current plot
hold on;
%Display x_inter2 samples as red crosses
subplot(3,1,1), plot(x_inter2(1:50),'rx');
%Insert Legend
legend('Original','Interpolated');
%Insert Title
title('x2');
hold off;

%x3 Plot
%Display x samples as blue circles
subplot(3,1,2), plot(x(1:50),'bo');
%Hold current plot
hold on;
%Display x_inter3 samples as red crosses
subplot(3,1,2), plot(x_inter3(1:50),'rx');
%Insert Legend
legend('Original','Interpolated');
%Insert Title
title('x3');
hold off;

%x4 Plot
%Display x samples as blue circles
subplot(3,1,3), plot(x(1:50),'bo');
%Hold current plot
hold on;
%Display x_inter4 samples as red crosses
subplot(3,1,3), plot(x_inter4(1:50),'rx');
%Insert Legend
legend('Original','Interpolated');
%Insert Title
title('x4');
hold off;

%Calculate norm of the difference between x and x_inter
norm_x2 = norm(x-x_inter2);
norm_x3 = norm(x-x_inter3);
norm_x4 = norm(x-x_inter4);
