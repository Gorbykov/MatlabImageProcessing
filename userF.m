function resI=userF
    global I
    
    a=10;
    b=10;
    c=1;
    s=size(I);
    [x,y]=meshgrid(1:s(2),1:s(1));
    p=sin(x/a+y/b)+c;
    resI=(I+p/2)/2;
end