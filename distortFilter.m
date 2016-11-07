function I = distortFilter(I)
type = 'motion';
PSF = fspecial(type, 100 ,30 );
I = imfilter(I, PSF, 'circular');
