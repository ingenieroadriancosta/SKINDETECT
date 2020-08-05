% function functiontest
clc,clear all
a=zeros(480,640,3);
b=ones(480,640,3);
c=zeros(480,640,3);
timefor=2000;
timeand=1:timefor;
for i=1:timefor
tic
c=(a & b);
timeand(i)=toc;
end
disp((sum(timeand))/length(timeand))

for i=1:timefor
tic
c=(a.*b);
timeand(i)=toc;
end
disp((sum(timeand))/length(timeand))