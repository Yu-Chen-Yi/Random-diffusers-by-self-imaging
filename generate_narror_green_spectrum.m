%% Narror Green spectrum
clear;
% lambda = linspace(400,700,151);
% I0 = 0.6;
% L0 = 565;
% FWHM = 1000;
% I1 = I0 * exp(-(lambda-L0).^2/FWHM);
% I0 = 0.7;
% L0 = 520;
% FWHM = 1000;
% I2 = I0 * exp(-(lambda-L0).^2/FWHM);
% I = (I1+I2)/2
% figure(2)
% plot(lambda,I);ylim([0 1])
%% Narror Green spectrum
clear;
lambda = linspace(400,700,151);
I0 = 1;
L0 = 550;
FWHM = 100;
I = I0 * exp(-(lambda-L0).^2/FWHM);
figure(2)
plot(lambda,I)