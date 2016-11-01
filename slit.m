clear
[FileName,PathName] = uigetfile();
v = VideoReader(fullfile(PathName, FileName));
col = fix(v.Width/2);
frameN = 1000;
v.CurrentTime = 0;
i=1;
while hasFrame(v);
    i = i+1;
    B=readFrame(v);
	Img(:,i,:)=B(:,col,:);
    clc;
    i
end
imshow(Img);