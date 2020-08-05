clc;clear all;warning off %#ok<WNOFF>
circulo=(zeros(480,640));
hImage=imshow(ones(480,640,3));axis off


direcction='X:\SegAll\IMAGENES\IMAGENES DE PRUEBAS\VGA_IMAGENES';
[a b]=uigetfile({'*.jpg;'},'Image file',direcction);
if b==0
    clear all
    return
else
    filename = strcat(b,a);
end
tic
im=double(imread(filename));
toc

% [y Fs]=wavread('ARCHIVOS\1.wav');
% player = audioplayer(y, Fs);
for act=1:1

    
for t=300:act*60:640
    circulo=circulo*0;
    circulo=circulo+1;
    im=double(imread(filename));
    r=t;
    try
    circulo(240,320-r:320+r)=1;
    end
    % circulo(240,320-r)=1;
    % circulo(240,320+r)=1;
    % sindvalue=sind(r*10);
    centro=640;
    
    
    
    
    
    
    
for i=240:-1:240-r
    
    c=round(sqrt(r^2-(240-i)^2));
    
    a=length(centro-c:centro+c);
    
    sindvalue=sind((1:a/2));
    
    % r*200/i
    try
    circulo(i,centro-c+1:centro)=sindvalue;
    circulo(480-i,centro-c+1:centro)=sindvalue;
    end

    
    
    
%     circulo(i,321:320+c)=sindvalue(end:-1:1);
%     circulo(480-i,321:320+c)=sindvalue(end:-1:1);


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
    
%     c=round(sqrt(r^2-(240-i)^2));
%     
%     sindvalue=sind(r*200/i);
% 
% %     circulo(i,320-c:320+c)=sindvalue;
% 
% 
%     circulo(i,320-c)=sindvalue;
%     circulo(i,320+c)=sindvalue;
% 
% %     circulo(480-i,320-c:320+c)=sindvalue;
% 
% 
%     circulo(480-i,320-c)=sindvalue;
%     circulo(480-i,320+c)=sindvalue;
% 


end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

im(:,:,1)=im(:,:,1).*abs(circulo);
im(:,:,2)=im(:,:,2).*abs(circulo);
im(:,:,3)=im(:,:,3).*abs(circulo);



% im(:,:,1)=im(:,:,1)-abs(50*circulo);
% im(:,:,2)=im(:,:,2)-abs(50*circulo);
% im(:,:,3)=im(:,:,3)-abs(50*circulo);




% imshow(uint8(im))
% axis off
set(hImage,'Cdata',uint8(im))
drawnow



% pause(0.01)

end
% imshowtime------->  0.1191
% sindrawnow------->  0.0889
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5%%%
% condrawnow------->  0.0840-----
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% c=sqrt(r^2-(240-r-i)^2);

% format short g

% long g



% clc;clear all;warning off %#ok<WNOFF>
circulo=(zeros(480,640));
% hImage=imshow(ones(480,640,3));axis off
% im=double(imread('ARCHIVOS\im.jpg'));
for t=640:-40:300
    circulo=circulo*0;
    circulo=circulo+1;
    im=double(imread('ARCHIVOS\im.jpg'));
    r=t;
    try
    circulo(240,320-r:320+r)=1;
    end
    % circulo(240,320-r)=1;
    % circulo(240,320+r)=1;
    % sindvalue=sind(r*10);
    centro=640;
    
    
    
    
    
    
    
for i=240:-1:240-r
    
    c=round(sqrt(r^2-(240-i)^2));
    
    a=length(centro-c:centro+c);
    
    sindvalue=sind((1:a/2));
    
    % r*200/i
    try
    circulo(i,centro-c+1:centro)=sindvalue;
    circulo(480-i,centro-c+1:centro)=sindvalue;
    end

    
    
    
%     circulo(i,321:320+c)=sindvalue(end:-1:1);
%     circulo(480-i,321:320+c)=sindvalue(end:-1:1);


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%   
    
%     c=round(sqrt(r^2-(240-i)^2));
%     
%     sindvalue=sind(r*200/i);
% 
% %     circulo(i,320-c:320+c)=sindvalue;
% 
% 
%     circulo(i,320-c)=sindvalue;
%     circulo(i,320+c)=sindvalue;
% 
% %     circulo(480-i,320-c:320+c)=sindvalue;
% 
% 
%     circulo(480-i,320-c)=sindvalue;
%     circulo(480-i,320+c)=sindvalue;
% 


end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

im(:,:,1)=im(:,:,1).*abs(circulo);
im(:,:,2)=im(:,:,2).*abs(circulo);
im(:,:,3)=im(:,:,3).*abs(circulo);



% im(:,:,1)=im(:,:,1)-abs(50*circulo);
% im(:,:,2)=im(:,:,2)-abs(50*circulo);
% im(:,:,3)=im(:,:,3)-abs(50*circulo);




% imshow(uint8(im))
% axis off
set(hImage,'Cdata',uint8(im))
drawnow



% pause(0.01)

end
% set(hImage,'Cdata',uint8(255*ones(480,640,3)))
% drawnow
end



























































% clc;clear all;warning off %#ok<WNOFF>
% load circles
% load rango
% circles=uint8(circles);
% tic
% im=imread('ARCHIVOS\5.jpg');
% r=200;
% rango=rango-156;
% % rango(
% 
% for i=1:480
% circles(i,320-rango(i)/2:320+rango(i)/2)=1;%10*im(240:2:240+40,320:2:320+40);
% end
% toc
% im(:,:,1)=im(:,:,1).*(circles);
% im(:,:,2)=im(:,:,2).*(circles);
% im(:,:,3)=im(:,:,3).*(circles);
% imshow(im)
% axis off


















































% return
% clc;clear all;warning off %#ok<WNOFF>
% load circles
% a=zeros(480,3);
% view=0;
% for r=1:480
%     for c=1:640
%         if circles(r,c)==1
%             if circles(r,c-1)==0
%             a(r,1)=r;
%             a(r,2)=c;
%             if view==1
%                 a(r,:)
%                 pause()
%                 clc
%             end
%             end
%             if circles(r,c+1)==0
%                 a(r,1)=r;
%                 a(r,3)=c;
%                 if view==1
%                     disp('Fin de linea')
%                     a(r,:)
%                     pause()
%                     clc
%                 end
%             end
%         end
%     end
% end
% b=[a(:,1) (a(:,3)-a(:,2))];
% c=[a b];
% imshow(50*circles)
% axis off
% colormap bone









% return
% for r=1:480
%     imcir=100*circles(r,:);
%     for circat=1:200
%         imcir=cat(1,100*circles(r,:),imcir);
%     end
%     
%     imshow(imcir)
%         
% %     imshow(cat(1,100*circles(r,:),100*circles(r,:),...
% %         100*circles(r,:),100*circles(r,:),...
% %         100*circles(r,:),100*circles(r,:),...
% %         100*circles(r,:),100*circles(r,:)))
%     pause(0.01)
%     
% end
% 
% 
% 
% 
% % 
% % 
% % image(50*circles)
% % axis off
% % 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 



















% 
% 
% 
% 
% 
% return
% load circles
% a=floor(2.6667*180)+10;
% a=round(320*(sind(90)));
% circles(1:480,1:a)=0;
% for x=1:180;
%     if sind(x)~=0
%             circles(floor(2.6667*x):floor(2.6667*x)+10,...
%                 round(320*(sind(x))))=100;
%             
%             
% %             circles(floor(2.6667*x)+10,1:round(100*(sind(x)))-1)=00;
%     end
% %     100*ceil((sind(x)))
% end
% % circles=50*circles(1:20:end,1:20:end);
% image(50*circles)
% axis off
% % colormap bone
% 
% 
% 












% 
% 
% return
% imp(1:end)=fibo(h*w);
% image(uint8(imp))
% % colormap bone
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% tic
% for i=1:h
% % if h/2-i>1 && h/2+i<h
% try
% imp(h/2-round(i*sind(i)),w/2+i)=100;
% imp(h/2+round(i*sind(i)),w-i)=100;
% % imp(h/2-round(i*cosd(i)),i)=i/5;
% % imp(h/2+round(i*cosd(i)),i)=i/5;
% image(uint8(imp))
% colormap bone
% axis off
% pause(.01)
% 
% % else
% %     break
% end
% % if w/2-i>1 && w/2+i<h
% % imp(h/2-i,w/2:w/2+100)=i/5;
% % imp(h/2+i,w/2:w/2+100)=i/5;
% % end
% 
% end
% toc
% max(imp(h/2,w/2:w/2+150))
% 
% 


























%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% return
% pause(.01)
% im=(imread('ARCHIVOS\3.jpg'));
% ima=uint8(zeros(480,640,3));
% for c=1:360
% a=1:240;
% a=a';
% 
% a=cat(1,a,a(end:-1:1));p=-1*c;
% tic
% for i=1:9
% a=cat(2,a+i*p,a-i*p);
% end
% a=cat(2,a,a(:,1:128));
% a(:,321:end)=a(:,640:-1:321);
% a=50*(sin(a));
% % a=(sin(a));
% % image(uint8(a*100))
% % return
% % a(241:end,
% % im(:,:,1)=im(:,:,1)+a;
% % im(:,:,2)=im(:,:,2)+a;
% % im(:,:,3)=im(:,:,3)+a;
% % size(a)
% 
% ima(:,:,1)=uint8(a*70);
% ima(:,:,2)=uint8(a*100);
% ima(:,:,3)=uint8(a*120);
% ima=(ima+im)/2;
% % toc
% image((ima))
% % plot(a)
% % image(uint8(a*100))
% axis off
% pause(.01)
% end
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% % 
% % 
% % a=[1 2 3 2 1;2 3 4 3 2;3 4 5 4 3;2 3 4 3 2;1 2 3 2 1]
% % for i=1:50
% % r=i;
% % % plot(a)
% % pause(.01)
% % a=[sind(r:r+359);sind(0:359)];
% % plot(a)
% % % size(a)
% % end
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
% % 
% % return
% % imseno=zeros(480,640,3);
% % 
% % 
% % imseno(480,:,1)=[sind(1:480); sind(1:640)];
% % 
% % 
% % 
% % 
% % 
% % 
% % 
% % size(imseno)
% % plot(imseno)
% 
% 
% 
% 
% 
% cat(dim,a,b)