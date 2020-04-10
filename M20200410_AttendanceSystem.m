function varargout = M20200410_AttendanceSystem(varargin)
% M20200410_ATTENDANCESYSTEM MATLAB code for M20200410_AttendanceSystem.fig
%      M20200410_ATTENDANCESYSTEM, by itself, creates a new M20200410_ATTENDANCESYSTEM or raises the existing
%      singleton*.
%
%      H = M20200410_ATTENDANCESYSTEM returns the handle to a new M20200410_ATTENDANCESYSTEM or the handle to
%      the existing singleton*.
%
%      M20200410_ATTENDANCESYSTEM('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in M20200410_ATTENDANCESYSTEM.M with the given input arguments.
%
%      M20200410_ATTENDANCESYSTEM('Property','Value',...) creates a new M20200410_ATTENDANCESYSTEM or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before M20200410_AttendanceSystem_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to M20200410_AttendanceSystem_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help M20200410_AttendanceSystem

% Last Modified by GUIDE v2.5 10-Apr-2020 23:11:54

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @M20200410_AttendanceSystem_OpeningFcn, ...
                   'gui_OutputFcn',  @M20200410_AttendanceSystem_OutputFcn, ...
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

% --- Executes just before M20200410_AttendanceSystem is made visible.
function M20200410_AttendanceSystem_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to M20200410_AttendanceSystem (see VARARGIN)
global i n r;
i = 0;
global students;
global status; 
global rollchy; 
global data;
[~, ~, data] = xlsread('input.csv');
% Choose default command line output for M20200410_AttendanceSystem
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes M20200410_AttendanceSystem wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = M20200410_AttendanceSystem_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function name_Callback(hObject, eventdata, handles)
% hObject    handle to name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of name as text
%        str2double(get(hObject,'String')) returns contents of name as a double


% --- Executes during object creation, after setting all properties.
function name_CreateFcn(hObject, eventdata, handles)
% hObject    handle to name (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in startmarking.
function startmarking_Callback(hObject, eventdata, handles)
% hObject    handle to startmarking (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global i data n students status r rollchy;
students = []; 
status = [];
rollchy = [];
i= 0;
i = i+1;
n = string(data(i,1));
r = string(data(i,2));
set(handles.name, 'String', n);
 


% --- Executes on button press in absent.
function absent_Callback(hObject, eventdata, handles)
% hObject    handle to absent (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global i data students status n r rollchy;
if i< length(data)
    students = [students; n];
    status = [status; 'A'];
    rollchy = [rollchy; r];
    i = i+1;
    n = string(data(i,1));
    r = string(data(i,2));
    set(handles.name, 'String', n);
else
    set(handles.name, 'String', 'Press Export');
end



% --- Executes on button press in present.
function present_Callback(hObject, eventdata, handles)
% hObject    handle to present (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global i data n students status rollchy r;
if i< length(data)
    students = [students; n];
    rollchy = [rollchy; r];
    status = [status; 'P'];
    i = i+1;
    r = string(data(i,2));
    n = string(data(i,1));
    set(handles.name, 'String', n);
else
    set(handles.name, 'String', 'Press Export');
end


% --- Executes on button press in export.
function export_Callback(hObject, eventdata, handles)
% hObject    handle to export (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global students status rollchy;
parser = [students rollchy status];
date =  string(datetime('now'));
date = strrep(date,' ','-')
date = strrep(date,':','-')
fname = append(date,'.csv');
writematrix(parser,fname); 


