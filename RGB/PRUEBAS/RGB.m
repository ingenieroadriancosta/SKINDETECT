% function pruebasmatematicas
clear all;clc;pause(.01);%warning off %#ok<WNOFF>
evaluar=1;%%%%%%%%%%%%%%%%%%%%

restriccionb=255;
direcction='E:\_FILESMATLAB\FOTOS\MYCAM';
% direcction='E:\__ARCHIVOS MATLAB\FOTOS\WEBCAM';

[a b]=uigetfile({'*.jpg;'},'Image file',direcction);
if b==0
    clear all
    return
else

    filename=strcat(b,a);
end

im=double(imread(filename));
image(uint8(im))
axis off
pause(1)
tic
if evaluar==1

imp=double(imcrop);
tic
% imp=im(141:170,261:380,:);
% imp=cat(1,imp,im(231:260,241:360,:));
% imp=cat(1,imp,im(431:460,331:450,:));
sz=size(imp);
% cla;subplot(121)
image(uint8(im))
axis off
pause(1)
a=zeros(sz(1),sz(2),3);
for row=1:sz(1)
    for col=1:sz(2)
        a(row,col,1)=imp(row,col,1)/imp(row,col,2);
        a(row,col,2)=imp(row,col,2)/imp(row,col,3);
        a(row,col,3)=imp(row,col,3)/imp(row,col,1);
    end
end
xtoy=sz(1)*sz(2);
% 
% 
xtoy1=sz(1)*sz(2);
% 
rgbpromedio={sum(a(1:xtoy))/(xtoy1);...
    sum(a(xtoy+1:2*xtoy))/(xtoy1);...
    sum(a(2*xtoy+1:3*xtoy))/(xtoy1)};

rangosdecolor=[max(max(a(:,:,1))) min(min(a(:,:,1)));...
    max(max(a(:,:,2))) min(min(a(:,:,2)));...
    max(max(a(:,:,3))) min(min(a(:,:,3)))];

rangosdecolorcat={max(max(a(:,:,1))) min(min(a(:,:,1)));...
    max(max(a(:,:,2))) min(min(a(:,:,2)));...
    max(max(a(:,:,3))) min(min(a(:,:,3)))};

range=cat(2,rangosdecolorcat,rgbpromedio,{'R';'G';'B'});
range=cat(1,{'Max','Min','Promedio','Data'},range);
range %#ok<NOPTS>
end


% & im(:,:,1)<p

tic
imskin=((im(:,:,1)./im(:,:,2))>rangosdecolor(1,2) &...
    (im(:,:,1)./im(:,:,2))<rangosdecolor(1,1) & im(:,:,3)<restriccionb ).*...
    ((im(:,:,2)./im(:,:,3))>rangosdecolor(2,2) &...
    (im(:,:,2)./im(:,:,3))<rangosdecolor(2,1) & im(:,:,3)<restriccionb  ).*...
    ((im(:,:,3)./im(:,:,1))>rangosdecolor(3,2) &...
    (im(:,:,3)./im(:,:,1))<rangosdecolor(3,1) & im(:,:,3)<restriccionb );

% imrgb=( (im(:,:,1)>180) .* (im(:,:,2)>180) .* (im(:,:,3)>180));
% if sum(sum(imrgb))>300000             %921600
% imskin=imskin.*(im(:,:,1)>170);
% end
imskin=cat(3,imskin,imskin,imskin);
im=im.*imskin;

% subplot(122)
% imshow(uint8(im))
% figure
image(uint8(im))
axis off
toc







%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% rgbpromedio={sum(a(1:sz(1)*sz(2)))/sz(1)*sz(2);...
%     sum(a(sz(1)*sz(2)+1:2*sz(1)*sz(2)))/sz(1)*sz(2);...
%     sum(a(2*sz(1)*sz(2)+1:3*sz(1)*sz(2)))/sz(1)*sz(2)};
% 
% rangosdecolor=[max(max(a(:,:,1))) min(min(a(:,:,1)));...
%     max(max(a(:,:,2))) min(min(a(:,:,2)));...
%     max(max(a(:,:,3))) min(min(a(:,:,3)))];
% save rangosdecolor
% rangosdecolorcat={max(max(a(:,:,1))) min(min(a(:,:,1)));...
%     max(max(a(:,:,2))) min(min(a(:,:,2)));...
%     max(max(a(:,:,3))) min(min(a(:,:,3)))};
% 
% range=cat(2,rangosdecolorcat,rgbpromedio,{'R';'G';'B'});
% range=cat(1,{'Max','Min','Promedio','Data'},range);
% range %#ok<NOPTS>





% imskin=((im(:,:,1)./im(:,:,2))>rangosdecolor(1,2) &...
%     (im(:,:,1)./im(:,:,2))<rangosdecolor(1,1)).*...
%     ((im(:,:,1)./im(:,:,3))>rangosdecolor(2,2) &...
%     (im(:,:,1)./im(:,:,3))<rangosdecolor(2,1)).*...
%     ((im(:,:,2)./im(:,:,3))>rangosdecolor(3,2) &...
%     (im(:,:,1)./im(:,:,3))<rangosdecolor(3,1));
% 
% 
% 
% imskin=cat(3,imskin,imskin,imskin);
% im=im.*imskin;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




























































%%%%%%%%%%%MI PIEL%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    max       min     campo
% 1.8312    1.4167         R
% 4.5333    2.1702         G
% 2.5161    1.4778         B












% imtool(im)






% WWWWWWWAAAAAAAARRRRRRPPPP
% [x,y,z] = cylinder;
% I = imread('testpat1.png');
% warp(x,y,z,I);
% WWWWWWWAAAAAAAARRRRRRPPPP







%image(im(100:130,260:300,:))
















%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%CIRCULOS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%



% im2=double(imread('ARCHIVOS\p.jpg'));
% hImage=imshow(im2);axis off
% rt=[319,200,150,100,70,50,40,30,5];
% rt=rt(end:-1:1);
% centro=320;a=1;
% for times=0:10:400
%     r=rt(1:a);
%   r=r+times;
% %   im=255*ones(480,640,3);
% im=double(imread('ARCHIVOS\5.jpg'));
% im2=double(imread('ARCHIVOS\p.jpg'));
% 
%   circulo=zeros(480,640);
%   tic
% for i=240:-1:1%240-r(1)
%     sindvalue=abs(sind(90));
%     c=round(sqrt(r.^2-(240-i).^2));
%     for p=1:length(c)
%         try %#ok<TRYNC>
% 
%             circulo(i:i+10,centro-c(p))=sindvalue;
%             circulo(i:i+10,centro+c(p))=sindvalue;
%             circulo(480-i-10:480-i,centro-c(p))=sindvalue;
%             circulo(480-i-10:480-i,centro+c(p))=sindvalue;
%         end
%     end
% end
% a=a+1;
% if a>=9
%     a=9;
% end
% % toc
% 
% im(:,:,1)=im(:,:,1).*(circulo);
% im(:,:,2)=im(:,:,2).*(circulo);
% im(:,:,3)=im(:,:,3).*(circulo);
% im=(im/3+im2)/2;
% 
% set(hImage,'Cdata',uint8(im))
% drawnow
% pause(.1)
% end


% c=round(sqrt(r^2-(240-i)^2));
% %%
% clc
% a=1:5;
% b=1:5;
% c=ones(5);
% c(1,b)=a


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%CIRCULOS%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%














