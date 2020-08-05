function varargout = ESPEJO(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ESPEJO_OpeningFcn, ...
                   'gui_OutputFcn',  @ESPEJO_OutputFcn, ...
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
% --- Executes just before ESPEJO is made visible.
function ESPEJO_OpeningFcn(hObject, eventdata, handles, varargin) %#ok<INUSL>
handles.output = hObject;
clc
axis off
axes(handles.axes1)
axis off
% Update handles structure
guidata(hObject, handles);
return
% --- Outputs from this function are returned to the command line.
function varargout = ESPEJO_OutputFcn(hObject, eventdata, handles)
global activated
activated=1;
vid=videoinput('winvideo',1);
axes(handles.axes1);
set(vid,'ReturnedColorSpace','rgb');
hImage1 = image(zeros(480,640,3));
axes(handles.axes2);
% hImage2 = image(zeros(480,640,3));
im=zeros(480,640,3);
axis off
preview(vid,hImage1);
a=1;

video = aviread('ARCHIVOS\AVI\example.avi');
video = {video.cdata};



while activated==1
    im(:,end:-1:1,:)=double(getsnapshot(vid));
%     nombre=strcat('ARCHIVOS\JPG\pez',...
%         num2str(a),'.jpg');
%     imframe=double(imread(nombre));
    imframe=double(video{a});
    imframe=(imframe+im)/2;
    imagesc(uint8(imframe))
    axis off


% axis image 


    pause(0.01)
    a=a+4;
    if a>=123
        a=1;
    end
end
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










