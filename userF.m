function resI=userF
    global I
    a=1;
    b=0.5;
    R=a*exp(b*randn(size(I)));
    resI=I.*R;
end