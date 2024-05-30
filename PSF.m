clear;
show_figure = true;
lambda = 0.632;
n = 1;
N = 1024*6;
M = 4;
pixel_size = 2;%micro-meter
particle = M*pixel_size;
Lx = pixel_size*N;
Ly = pixel_size*N;
x = (-(N/2-1):N/2)*pixel_size;
y = x;
[X,Y] = meshgrid(x,y);
count = 0;
%% object amplitude
Object = 1;
%% aperture diameter = R;
R = 2*1e3;
aperture = (X.^2 + Y.^2) < R^2;
U0 = Object.*double(aperture);
count = count + 1;
%% propagate to aperture : z0
z0 = 100*1e3;
U1 = ASBPM(U0,Lx,Ly,z0,lambda,n);
count = count + 1;
%% aperture diameter = R;
E0 = rand(N/M,N/M,1);
phase = rand(N/M,N/M,1)*2*pi;
E = E0.*exp(1i*phase);
Diffuser = imresize(E,M);
U2 = U1.*Diffuser;
count = count + 1;
%% propagate to aperture : z1
z1 = 100*1e3; %mm
U3 = ASBPM(U2,Lx,Ly,z1,lambda,n);
count = count + 1;
%% aperture diameter = R;
U4 = U3.*aperture;
count = count + 1;
%% aperture to cmos image sensor : z2
z2 = 100*1e3; %mm
U5 = ASBPM(U4,Lx,Ly,z2,lambda,n);
count = count + 1;
%% sensor size : 13.2*8.8 mm crpo to 8.8*8.8 mm
sensor_h = 8.8;
sensor_w = sensor_h;
xspan = round(sensor_w*1000/2/pixel_size);
U6 = U5(N/2-xspan:N/2+xspan,N/2-xspan:N/2+xspan);
xcp = x(N/2-xspan:N/2+xspan);
ycp = y(N/2-xspan:N/2+xspan);
count = count + 1;
%%
% Data.Diffuser = CYDiffuser;
% Data.PSF = PSF;
% Data.lambda = 
%%
if show_figure == true
goodfigure('PSF','w',[1 0 0.7 1]);
for i = 1:count-1
subplot(3,4,i+2*floor((i-0.5)/2));
eval("imagesc(x/1000,y/1000,abs(U"+(i-1)+").^2);");
axis square;colormap gray;
goodplot2('\itx (mm)','\ity (mm)',"U"+(i-1),14)
end
subplot(1,2,2);imagesc(xcp/1000,ycp/1000,abs(U6).^2);axis square;colormap gray;colorbar;
goodplot2('\itx (mm)','\ity (mm)',"PSF @\lambda = "+lambda+" \mum",14)
plot_darkmode
end