function U1 = ASBPM(U0,Lx,Ly,z,lambda,n)
lambda = lambda/n;
k = 2*pi/lambda;
fx = linspace(-1,1,length(U0))*length(U0)/Lx/2;
fy = linspace(-1,1,length(U0))*length(U0)/Ly/2;
[Fx,Fy] = meshgrid(fx,fy);
FU0 = ifftshift(ifft2(fftshift(U0)));
alpha = lambda*Fx;
beta = lambda*Fy;
gamma = sqrt(1 - alpha.^2 - beta.^2);
FU1 = FU0.*exp(1i*k*z*gamma);
U1 = ifftshift(fft2(fftshift(FU1)));
end