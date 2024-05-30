%% Narror Blue spectrum
clear;
lambda = linspace(400,700,151);
I0 = 1;
L0 = 450;
FWHM = 100;
I = I0 * exp(-(lambda-L0).^2/FWHM);
figure(2)
plot(lambda,I)