function varargout = pruebasmatematicasGUI(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @pruebasmatematicasGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @pruebasmatematicasGUI_OutputFcn, ...
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
% --- Executes just before pruebasmatematicasGUI is made visible.
function pruebasmatematicasGUI_OpeningFcn(hObject, eventdata, handles, varargin) %#ok<INUSL>
handles.output = hObject;
clc
axis off
axes(handles.axes1)
axis off
% Update handles structure
guidata(hObject, handles);
return
% --- Outputs from this function are returned to the command line.
function varargout = pruebasmatematicasGUI_OutputFcn(hObject, eventdata, handles)
global activated
activated=1;
w=640/1;
h=480/1;
resolucion=strcat('RGB24_',num2str(w),'x',num2str(h));
vid=videoinput('winvideo',1,resolucion,'Tag','Webcam');

axes(handles.axes1);
set(vid,'ReturnedColorSpace','rgb');
hImage1 = image(zeros(h,w,3));
axes(handles.axes2);
% hImage2 = image(zeros(480,640,3));
axis off
preview(vid,hImage1);
im=zeros(h,w,3);
t=1;
time=0;
load ARCHIVOS\MAT\excelente
% load ARCHIVOS\MAT\excelente
a=size(im);
% imskin=zeros(a(1),a(2),3);

[mayorlevel,minorlevel]=skindetect(a(1),a(2),'white');




video = aviread('ARCHIVOS\AVI\example.avi');
video = {video.cdata};
video1=video;
if h~=480
for i=1:122
    a=video{i};
    video1{i}=a(1:2:end,1:2:end,:);
end
video=video1;
end
clear video1 a

tiempo=0;
a=1;
pause(1)
while activated==1
    tic
    im(:,end:-1:1,:)=(getsnapshot(vid));
    imframe=double(video{a});
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                                                         %
imskin=( im(:,:,[1,1,2])./im(:,:,[2,3,3]) );
imskin=((imskin>minorlevel) &...                                         %
    (imskin<mayorlevel));                                                %
                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
imskin=imskin(:,:,[1,2,3]).*imskin(:,:,[2,3,1]).*...                     %
    imskin(:,:,[3,1,2]);                                                 %
%     imskinp=imskin(:,:,1) .* imskin(:,:,2) .* imskin(:,:,3);           %
%     imskin=cat(3,imskinp,imskinp,imskinp);                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                                                         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    im=im.*imskin;
    im=im+imframe;
    image((uint8(im)))
    axis image off
    pause(0.01)
    tiempo=tiempo+toc;
    t=t+1;
    a=a+4;
    if a>=123
        a=1;
    end
end
tiempo=tiempo/t;
disp(tiempo)
activated=0;
figure1_CloseRequestFcn(hObject, eventdata, handles)
varargout{1} = handles.output;
return
% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles) %#ok<INUSD>
global activated
if activated==1
    activated=0;
else
delete(hObject);
end
return










