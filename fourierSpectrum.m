function Img=fourierSpectrum()
global I;
r=fft2(I);
r=fftshift(r);
s=log(1+abs(r));
Img=s;