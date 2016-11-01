function p = histroi(I)
B = roipoly();
p = imhist(I(B));