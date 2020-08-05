function varargout = DETECT_WEBCAM(varargin)
% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DETECT_WEBCAM_OpeningFcn, ...
                   'gui_OutputFcn',  @DETECT_WEBCAM_OutputFcn, ...
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
% End initialization code - DO NOT EDIT
return
% --- Executes just before DETECT_WEBCAM is made visible.
function DETECT_WEBCAM_OpeningFcn(hObject, eventdata, handles, varargin) %#ok<INUSL>
handles.output = hObject;
global cerrar
warning off %#ok<WNOFF>
cerrar=1;
set(handles.selection,'Enable','On')
pause(0.01)
% Update handles structure
guidata(hObject, handles);
return
% --- Outputs from this function are returned to the command line.
function varargout = DETECT_WEBCAM_OutputFcn(hObject, eventdata, handles)  %#ok<INUSL>
clc
varargout{1} = handles.output;
return


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles) %#ok<DEFNU>
% Hint: get(hObject,'Value') returns toggle state of start
global cerrar minorlevel mayorlevel height width
if get(hObject,'Value')
    cerrar=0;
    height=480;
    width=640;
    
    %height=720;width=1280;
%     selection_Callback(hObject, eventdata, handles);
    
    
    
    levelcolor=[2.9268,1.1233;...
            35.0000,1.2750;16.0000,1.1010];
        minorlevel=cat(3,levelcolor(1,2)*ones(height,width),...
    levelcolor(2,2)*ones(height,width),levelcolor(3,2)*ones(height,width));

mayorlevel=cat(3,levelcolor(1,1)*ones(height,width),...
    levelcolor(2,1)*ones(height,width),levelcolor(3,1)*ones(height,width));



    set(hObject,'String','Stop')
    resolucion=strcat('RGB24_',num2str(width),'x',num2str(height));
%     vid=videoinput('winvideo',1,resolucion,'Tag','Integrated Webcam');    
    vid=videoinput('winvideo',1);
% vid=videoinput('winvideo',1,'YUY2_640x480');

    
    set(vid,'ReturnedColorSpace','rgb');
    axes(handles.previewaxes)
    hImage = image(zeros(height,width,3));
    axis image off
    preview(vid,hImage);
    axes(handles.outvideo)
    tf=0;
    counter=0;
    axes(handles.outvideo)
    clc
size(mayorlevel)
im=double(getsnapshot(vid));
size(im)
    while get(hObject,'Value') && cerrar==0
        tic
%         im=(getsnapshot(vid));
        im=double(getsnapshot(vid));
        imskin=(im);
        imskin=( imskin(:,:,[1,1,2])./imskin(:,:,[2,3,3]) );
        imskin=((imskin>minorlevel) & (imskin<mayorlevel));

        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        imskin=imskin(:,:,[1,2,3]).*imskin(:,:,[2,3,1]).*imskin(:,:,[3,1,2]);   %
        %                                                                        %
%         imskinp=imskin(:,:,1) .* imskin(:,:,2) .* imskin(:,:,3);                 %
%         imskin=cat(3,imskinp,imskinp,imskinp);                                   %
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

        im=(uint8(im).*uint8(imskin));
%         axes(handles.outvideo)
        image( (im) )
        axis off
        pause(0.01)
        tf=tf+toc;
        counter=counter+1;
        disp(tf/counter)
        
    end
    
    
    
    
    while get(hObject,'Value') && cerrar==0
        tic
        im=(getsnapshot(vid));
        image( (im) )
        axis off
    end
    
    closepreview(vid)
    set(handles.selection,'Enable','Off')
    
    if cerrar
        figure1_CloseRequestFcn(hObject, eventdata, handles) %#ok<UNRCH>
    else
        cerrar=1;
    end
    
else
    set(hObject,'String','Start')
end
return
% --- Executes on selection change in selection.
function selection_Callback(hObject, eventdata, handles) %#ok<INUSL,DEFNU>
global minorlevel mayorlevel height width
contents = get(handles.selection,'String');
selecction=contents{get(handles.selection,'Value')};
switch selecction
    case 'white'
        levelcolor=[2.9268,1.1233;...
            35.0000,1.2750;16.0000,1.1010];
    case 'excellent'
        levelcolor=[2.5294,1.2115;...
            9.9231,1.4540;3.9231,1.1645];
    case 'quality'
        levelcolor=[5.6000,1.1357;...
           Inf,1.2479;Inf,1.0769];
    case 'deep'
        levelcolor=[2.0435,1.1415;...
           23.6667,1.3444;14.3333,1.1582];
    case 'webcam1'
        levelcolor=[1.5556,1.0635;...
            2.6667,1.1835;1.7381,1.0150];
    case 'webcam2'
        levelcolor=[1.5870,1.0273;...
            2.0645,1.2151;1.7500,1.0189];
end
                
 
minorlevel=cat(3,levelcolor(1,2)*ones(height,width),...
    levelcolor(2,2)*ones(height,width),levelcolor(3,2)*ones(height,width));

mayorlevel=cat(3,levelcolor(1,1)*ones(height,width),...
    levelcolor(2,1)*ones(height,width),levelcolor(3,1)*ones(height,width));
return
% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles) %#ok<INUSD>
global cerrar
if cerrar==0
    cerrar=1;
else
    delete(hObject);
    close all
    clear all
end

return
