function I = medianFilter(I)
N=7;
type='symmetric';
I = medfilt2(I,[N N],type);