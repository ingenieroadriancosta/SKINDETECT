function varargout = pruebasgui(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @pruebasgui_OpeningFcn, ...
                   'gui_OutputFcn',  @pruebasgui_OutputFcn, ...
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
% --- Executes just before pruebasgui is made visible.
function pruebasgui_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
axis off
clc
% Update handles structure
guidata(hObject, handles);
return
% --- Outputs from this function are returned to the command line.
function varargout = pruebasgui_OutputFcn(hObject, eventdata, handles) 
global activated
warning off
% im=(imread('ARCHIVOS\5.jpg'));
activated=1;
% hImage1 = image(zeros(size(im)));
axis off
value=0;



h=360;
c=zeros(h,h,3);
while activated==1
a=0:h-1;
a=360*sind(a);
b=a';
a=a';
% a=cat(1,a,a(end:-1:1))
% tic
for i=1:359
a=cat(2,a,b+1);
end
% a;
a=sind(a);
c(:,:,1)=a;
c(:,:,2)=a;
c(:,:,3)=a;
% imshow(uint8(30*a))
image(uint8(255*get(handles.slider1,'Value')*a))
axis off
% size(a);

if get(handles.slider1,'Value')>=1
    sld=-1;
elseif get(handles.slider1,'Value')<=0
    sld=1;
end
value=value+0.02*sld;
set(handles.slider1,'Value',value)
pause(0.01)
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
%     set(hImage1,'Cdata',im)
    
    

end




figure1_CloseRequestFcn(hObject, eventdata, handles)
varargout{1} = handles.output;
return
% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)
global activated
if activated==1
    activated=0;
else
delete(hObject);
end
return


% mini
% gcf
% 100.6000   19.6154  164.8000   34.7692
% slider
% 0.9697    0.5022    0.0267    0.4956



% maxi
% gcf
% 12.4000         0  260.8000   57.3846
% slider
% 0.9697    0.5022    0.0267    0.4956






