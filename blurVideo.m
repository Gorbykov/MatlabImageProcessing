clear
[FileName,PathName] = uigetfile();
v = VideoReader(fullfile(PathName, FileName));
frameN = 10000;
v.CurrentTime = 60;
i=1;
Img=uint64(zeros(size(readFrame(v))));
for i=1:frameN
    B=uint64(readFrame(v));
	Img=Img+B;
    disp(i);
end
Img=uint8(Img./(frameN+1));
imshow(Img);
imsave(Img);