% function command_window
clc,clear all
w=640;
h=480;
resolucion=strcat('RGB24_',num2str(w),'x',num2str(h));
vid=videoinput('winvideo',1,resolucion,'Tag','Webcam');

himage=image(zeros(h,w,3));
axis image off
start(vid)
preview(vid,himage)


% pause(5)
% stoppreview(vid)


% data = getdata(vid,1,'uint8')


for i=1:1000
    frame = getsnapshot(vid);
    h=figure;
    image(frame);
end
pause(5)
close all