function varargout = DETECT_PICTURE(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DETECT_PICTURE_OpeningFcn, ...
                   'gui_OutputFcn',  @DETECT_PICTURE_OutputFcn, ...
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
% --- Executes just before DETECT_PICTURE is made visible.
function DETECT_PICTURE_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;

warning('off','MATLAB:HandleGraphics:ObsoletedProperty:JavaFrame');
jFrame=get(gcf,'javaframe');
jIcon=javax.swing.ImageIcon('skd.png');
jFrame.setFigureIcon(jIcon);

global selecction startonly
startonly=0;
selecction='white';
% Update handles structure
guidata(hObject, handles);
return
% --- Outputs from this function are returned to the command line.
function varargout = DETECT_PICTURE_OutputFcn(hObject, eventdata, handles) 
clc
varargout{1} = handles.output;
return
% --- Executes on button press in load.
function load_Callback(hObject, eventdata, handles)
global selecction im startonly
if startonly==0
    direcction='E:\_FILESMATLAB\IMAGEN\FOTOS\MYCAM';
    % direcction='E:\__ARCHIVOS MATLAB\FOTOS\WEBCAM';

    [a b]=uigetfile({'*.jpg;'},'Image file',direcction);
    if b==0
        clear all
        return
    else

        filename=strcat(b,a);
    end
    im=(imread(filename));
    im=im/4;
    im=uint8(im);
    im=im*4;
    set(handles.selection,'Enable','On')
end
warning off %#ok<WNOFF>
tic
[mayorlevel,minorlevel,im2]=skindetect(size(im,1),size(im,2),selecction,im);
toc
% imwrite( im2, 'C:\Users\AdrianJCosta\Desktop\TIM.jpg' );
imt=cat(2,im,im2);
axes('Units','normalized','Position',[0 0 1 1]);
image(uint8(imt))
axis image off
% axis off

pause(1)
startonly=0;
return
% --- Executes on button press in save.
function save_Callback(hObject, eventdata, handles)
imsave
return
% --- Executes on selection change in selection.
function selection_Callback(hObject, eventdata, handles)
global selecction startonly
contents = get(hObject,'String');
selecction=contents{get(hObject,'Value')};
startonly=1;
load_Callback();
return















function [mayorlevel,minorlevel,im]=skindetect(height,width,selecction,im)
% Esta funci?n retorna 2 matrices logicas debidas a los estudios de valores
% de deteccion de piel, la primera es 

switch nargin
    case {3,4}
        if nargin==4
            if (size(im,1)~=height || size(im,2)~=width)
                msg=strcat('Wrong size image and function input,',...
                    num2str(size(im,1)),'*',num2str(size(im,2)),...
                    '_and_',num2str(height),'*',num2str(width));
                warning('WarnTests:convertTest',msg)
                [mayorlevel,minorlevel,im]=skindetect(size(im,1),...
                    size(im,2),selecction,im);
            end
        else
            im=0;
        end
        switch selecction
            case 'quality'
                levelcolor=[5.6000,1.1357;...
                               Inf,1.2479;...
                               Inf,1.0769];
            case 'white'
                levelcolor=[2.9268,1.1233;...
                           35.0000,1.2750;...
                           16.0000,1.1010];
            case 'excellent'
                levelcolor=[2.5294,1.2115;...
                            9.9231,1.4540;...
                            3.9231,1.1645];
            case 'deep'
                levelcolor=[2.0435,1.1415;...
                           23.6667,1.3444;...
                           14.3333,1.1582];
            case 'webcam1'
                levelcolor=[1.5556,1.0635;...
                            2.6667,1.1835;...
                            1.7381,1.0150];
            case 'webcam2'
                levelcolor=[1.5870,1.0273;...
                            2.0645,1.2151;...
                            1.7500,1.0189];
                
            otherwise
                   error('myApp:argChk', 'Wrong selecction of color level')
        end
    case {2,1}
        if nargin==1
            width=height;
        end
        im=0;
        levelcolor=[2.9268,1.1233;...
                    35.0000,1.2750;...
                    16.0000,1.1010];
    otherwise
        error('myApp:argChk', 'Wrong number of input arguments')
end
minorlevel=cat(3,levelcolor(1,2)*ones(height,width),...
    levelcolor(2,2)*ones(height,width),levelcolor(3,2)*ones(height,width));

mayorlevel=cat(3,levelcolor(1,1)*ones(height,width),...
    levelcolor(2,1)*ones(height,width),levelcolor(3,1)*ones(height,width));


% Imprimir la imagen filtrada

if (nargin==4) && (size(im,1)==height && size(im,2)==width)
    if ~(strcmp(class(im),'double'))
    im=double(im);
    end
    imskin=( im(:,:,[1,1,2])./im(:,:,[2,3,3]) );
    imskin=((imskin>minorlevel) &...
        (imskin<mayorlevel));

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    imskin=imskin(:,:,[1,2,3]).*imskin(:,:,[2,3,1]).*imskin(:,:,[3,1,2]);%
%     imskinp=imskin(:,:,1) .* imskin(:,:,2) .* imskin(:,:,3);           %
%     imskin=cat(3,imskinp,imskinp,imskinp);                             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    im=im.*(imskin);
    im=uint8(im);
end
return