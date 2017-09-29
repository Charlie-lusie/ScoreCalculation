function varargout = XJTUScore(varargin)
% XJTUSCORE MATLAB code for XJTUScore.fig
%      XJTUSCORE, by itself, creates a new XJTUSCORE or raises the existing
%      singleton*.
%
%      H = XJTUSCORE returns the handle to a new XJTUSCORE or the handle to
%      the existing singleton*.
%
%      XJTUSCORE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in XJTUSCORE.M with the given input arguments.
%
%      XJTUSCORE('Property','Value',...) creates a new XJTUSCORE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before XJTUScore_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to XJTUScore_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help XJTUScore

% Last Modified by GUIDE v2.5 29-Sep-2017 11:03:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @XJTUScore_OpeningFcn, ...
                   'gui_OutputFcn',  @XJTUScore_OutputFcn, ...
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


% --- Executes just before XJTUScore is made visible.
function XJTUScore_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to XJTUScore (see VARARGIN)

% Choose default command line output for XJTUScore
handles.output = hObject;
global Filename;
global Path;
Filename = [];
Path = [];
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes XJTUScore wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = XJTUScore_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Filename;
global Path;
[Filename,Path]=uigetfile({'*.xls;*.xlsx;','Excel文件(*.xls,*.xlsx)';...
    '*,*','所有文件(*.*)'}, ...
    '请选择一个Excel文件');
if isequal(Filename,0)||isequal(Path,0)
    set(handles.text3,'string',' ');
    set(handles.text3,'string','文件错误！','FontSize', 14);
    Filename = []; Path = [];
    return;
else
    set(handles.text3,'string',' ');
    set(handles.text3,'string','读取成功！','FontSize', 14);
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global Filename;
global Path;
if isequal(Filename,0)||isequal(Path,0)
    set(handles.text3,'string',' ');
    set(handles.text3,'string','文件错误！','FontSize', 14);
    Filename = []; Path = [];
   return;
end
set(handles.text3,'string',' ');
set(handles.text3,'string','正在计算...','FontSize', 14);
CalSco(Path, Filename);
set(handles.text3,'string',' ');
set(handles.text3,'string','计算完成！','FontSize', 14);


% --- Executes during object creation, after setting all properties.
function text3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
