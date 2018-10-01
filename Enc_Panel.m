function varargout = Enc_Panel(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Enc_Panel_OpeningFcn, ...
                   'gui_OutputFcn',  @Enc_Panel_OutputFcn, ...
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
function Enc_Panel_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = Enc_Panel_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;

function pushbutton1_Callback(hObject, eventdata, handles)
[filename pathname]=uigetfile('File Selector');
fullpathname=strcat(pathname,filename);
global c;
c=imread(fullpathname);
axes(handles.axes1);
imshow(c);
fid = fopen('in.txt');
msg= fgetl(fid);
enc(msg,c);
x
function edit1_Callback(hObject, eventdata, handles)
    global message;
    message=get(hObject,'String');    
    fileID = fopen('in.txt','w');
    fwrite(fileID,message);
    fclose(fileID);

function edit1_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end