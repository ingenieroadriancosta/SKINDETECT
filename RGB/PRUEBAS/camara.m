% Es mejor crear las ventanas de axes y colocar las imagenes con
% set(ventana,'Cdata',imagen);drawnow, es mas rápido, tres veces mas rapido
% que si se ejecuta image(imagen);axis image off;pause(0.01)es necesario
% ejecutar el pause o drawnow para mostrar la imagen. De igual forma es
% preferible pedir la informacion Cdata de la ventana en donde está el
% preview que ejecutar la funcion getsnapshot.
function varargout = camara(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @camara_OpeningFcn, ...
                   'gui_OutputFcn',  @camara_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
return
% --- Executes just before camara is made visible.
function camara_OpeningFcn(hObject, eventdata, handles, varargin) %#ok<INUSL>
handles.output = hObject;
global busy activated close
activated=0;
busy=1;
close=0;
axes(handles.axes2);
axis off
axes(handles.axes1);
axis off
set(handles.slider1,'Max',2)
set(handles.slider1,'Value',1)
% Update handles structure
guidata(hObject, handles);
return
% --- Outputs from this function are returned to the command line.
function varargout = camara_OutputFcn(hObject, eventdata, handles) %#ok<INUSL>
global busy
busy=0;
clc
varargout{1} = handles.output;
return
% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles) %#ok<DEFNU>
global activated vid busy %#ok<NUSED>

if strcmp(get(hObject,'String'),'Start.')
    set(handles.resolution,'Enable','off')
    set(hObject,'String','Stop.')
    activated=1;
    w=640/(2^(get(handles.resolution,'Value')-1));
    h=480/(2^(get(handles.resolution,'Value')-1));
    resolucion=strcat('RGB24_',num2str(w),'x',num2str(h));
    vid=videoinput('winvideo',1,resolucion,'Tag','Webcam');
    set(vid,'ReturnedColorSpace','rgb');
    vid.FrameGrabInterval =30; 
    vid.FramesPerTrigger=30;

    axes(handles.axes2);
    hImage2 = image(uint8(zeros(h,w,3)));
    axis image off
    preview(vid,hImage2)
    set(hImage2,'Visible','off')

    axes(handles.axes1);
    hImage1 = image(uint8(zeros(h,w,3)));
    axis off
    imf=(zeros(h,w,3));
    im=(zeros(h,w,3));
    [mayorlevel,minorlevel]=skindetect(h/2,w/2,'webcam1');
    time=0;
    a=0;
    while activated==1 && strcmp(get(hObject,'String'),'Stop.')
        tic
        im(:,end:-1:1,:)=(get(hImage2,'Cdata'));%0.014484 seg
%         im=im*get(handles.slider1,'Value');


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%///////2
% 0.147823853646063
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        im2=im(1:2:end,1:2:end,:);        
        imskin=( im2(:,:,[1,1,2])./im2(:,:,[2,3,3]) );
        imskin=((imskin>minorlevel) &...
            (imskin<mayorlevel));

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        imskin=imskin(:,:,[1,2,3]).*imskin(:,:,[2,3,1]).*...
            imskin(:,:,[3,1,2]);
        %     imskinp=imskin(:,:,1) .* imskin(:,:,2) .* imskin(:,:,3);
        %     imskin=cat(3,imskinp,imskinp,imskinp);
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                                                          %
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        imf(1:2:end,1:2:end,:)=imskin;
        imf(2:2:end,1:2:end,:)=imskin;
        imf(:,2:2:end,:)=imf(:,1:2:end,:);
        imf(:,1:2:end,:)=imf(:,2:2:end,:);
        im=im.*(imf);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%///////2
        
        





% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%///////4
% % 0.088013228028305
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% im4=im(1:4:end,1:4:end,:);
% imskin=( im4(:,:,[1,1,2])./im4(:,:,[2,3,3]) );
% imskin=((imskin>minorlevel) &...
%     (imskin<mayorlevel));
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% imskin=imskin(:,:,[1,2,3]).*imskin(:,:,[2,3,1]).*...
%     imskin(:,:,[3,1,2]);
% %     imskinp=imskin(:,:,1) .* imskin(:,:,2) .* imskin(:,:,3);
% %     imskin=cat(3,imskinp,imskinp,imskinp);
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                                                   %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% imf(1:4:end,1:4:end,:)=imskin;
% imf(2:4:end,1:4:end,:)=imskin;
% imf(3:4:end,1:4:end,:)=imskin;
% imf(4:4:end,1:4:end,:)=imskin;
% imf(:,2:4:end,:)=imf(:,1:4:end,:);
% imf(:,3:4:end,:)=imf(:,1:4:end,:);
% imf(:,4:4:end,:)=imf(:,1:4:end,:);
% im=im.*(imf);
% 
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%///////4


        set(hImage1,'Cdata',uint8(im))
        drawnow
        time=time+toc;
        a=a+1;
%        if toc>3 && toc<4                 %&& close==0
%            set(handles.start,'Visible','off')
%            set(handles.resolution,'Visible','off')
%            set(handles.slider1,'Visible','off')
%            busy=0;
%        end
    end
    disp(time/a)
    set(handles.resolution,'Enable','on')
    closepreview(vid)
    clear vid
%     set(hObject,'String','Start.')
    if activated==0
        camara_CloseRequestFcn(hObject, eventdata, handles)
    end
    activated=0;
else
    set(hObject,'String','Start.')
    pause(0.01)
end
return
% --- Executes on mouse motion over figure - except title and menu.
function camara_WindowButtonMotionFcn(hObject,eventdata,handles) %#ok<DEFNU>
global activated busy close
% tic
if activated==1 && busy==0
    busy=1;
    set(handles.start,'Visible','on')
    set(handles.resolution,'Visible','on')
    set(handles.slider1,'Visible','on')
else
    if busy==0
        axes(handles.axes2);
        axis off
        axes(handles.axes1);
        axis off
        busy=1; %#ok<NASGU>
        set(handles.start,'Visible','on')
        set(handles.resolution,'Visible','on')
        set(handles.slider1,'Visible','on')
        tic
        while toc<3 && close==0
            pause(0.01)
        end
        set(handles.start,'Visible','off')
        set(handles.resolution,'Visible','off')
        set(handles.slider1,'Visible','off')
        busy=0;
    end
end
if close==1
    camara_CloseRequestFcn(hObject, eventdata, handles)
end
return
% --- Executes when camara is resized.
function camara_ResizeFcn(hObject, eventdata, handles) %#ok<INUSL,DEFNU>
% 160.2         35                  w=0.086             h=0.04867256637
% a=get(gcf,'Position');
% if (a(3)<160.2) || (a(4)<34.7692)
%     set(gcf,'Position',[111.0000 20.0769 160.2000 34.7692])
% end
a=get(gcf,'Position');

set(handles.start,'Position',[0,0,(0.086*160.2/a(3)),...
    (0.0487*35/a(4))])
set(handles.resolution,'Position',[0,0.041,(0.086*160.2/a(3)),...
    (0.0487*35/a(4))])
return
%%%%%%%%%%%%%%%%%%%%%%%%%CLOSE%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function camara_CloseRequestFcn(hObject, eventdata, handles) %#ok<INUSL>
global activated close
if activated==1
    activated=0;
else
    if close==1
        delete(handles.camara)
    else
        close=1;
    end
end
return