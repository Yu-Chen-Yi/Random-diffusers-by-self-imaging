%% Narror Red spectrum
clear;
lambda = linspace(400,700,151);
I0 = 0.3;
L0 = 630;
FWHM = 500;
I1 = I0 * exp(-(lambda-L0).^2/FWHM);
I0 = 0.4;
L0 = 650;
FWHM = 3000;
I2 = I0 * exp(-(lambda-L0).^2/FWHM);
I = (I1+I2)/2;
figure(2)
plot(lambda,I);ylim([0 1])