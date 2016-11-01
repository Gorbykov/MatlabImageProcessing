function I=normalizeImg(I)
I = im2double(I);
Min = min(min(I));
Max = max(max(I));
I = (I-Min)/(Max-Min);
