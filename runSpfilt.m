function I = runSpfilt(I)
I = spfilt(I,'chmean',3,3,1.5);