clear all;clc;
warning('off') %#ok<WNOFF>
disp('input video');
avi = aviread('Holmes.avi',1:600);
return
video = {avi.cdata};
selecction='quality';
for a = 1:length(video)
    video{a}=skindetect(selecction,video{a});
    imagesc(video{a});
    axis image off
    drawnow;
    title(strcat('Cuadros procesados',...
        num2str(a)))
    pause(0.01)
end


for a = 1:length(video)
    imagesc(video{a});
    axis image off
    drawnow;
end