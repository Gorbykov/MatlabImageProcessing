function varargout = imnoiseControl(varargin)
% IMNOISECONTROL MATLAB code for imnoiseControl.fig
%      IMNOISECONTROL, by itself, creates a new IMNOISECONTROL or raises the existing
%      singleton*.
%
%      H = IMNOISECONTROL returns the handle to a new IMNOISECONTROL or the handle to
%      the existing singleton*.
%
%      IMNOISECONTROL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in IMNOISECONTROL.M with the given input arguments.
%
%      IMNOISECONTROL('Property','Value',...) creates a new IMNOISECONTROL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before imnoiseControl_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to imnoiseControl_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help imnoiseControl

% Last Modified by GUIDE v2.5 12-Oct-2016 22:06:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @imnoiseControl_OpeningFcn, ...
                   'gui_OutputFcn',  @imnoiseControl_OutputFcn, ...
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


% --- Executes just before imnoiseControl is made visible.
function imnoiseControl_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to imnoiseControl (see VARARGIN)

% Choose default command line output for imnoiseControl
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes imnoiseControl wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = imnoiseControl_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function vEdit_Callback(hObject, eventdata, handles)
% hObject    handle to vEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of vEdit as text
%        str2double(get(hObject,'String')) returns contents of vEdit as a double


% --- Executes during object creation, after setting all properties.
function vEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mEdit_Callback(hObject, eventdata, handles)
% hObject    handle to mEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mEdit as text
%        str2double(get(hObject,'String')) returns contents of mEdit as a double


% --- Executes during object creation, after setting all properties.
function mEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function dEdit_Callback(hObject, eventdata, handles)
% hObject    handle to dEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of dEdit as text
%        str2double(get(hObject,'String')) returns contents of dEdit as a double


% --- Executes during object creation, after setting all properties.
function dEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to dEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in okButton.
function okButton_Callback(hObject, eventdata, handles)
% hObject    handle to okButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global mainHendles
global I

type = get(get(handles.typeGroup,'SelectedObject'),'String')
switch type
    case 'gaussian'
        bufI=imnoise(I,type,str2double(get(handles.mEdit,'String')),str2double(get(handles.vEdit,'String')));
    case 'salt & pepper'
        bufI=imnoise(I,type,str2double(get(handles.dEdit,'String')));
    case 'speckle'
        bufI=imnoise(I,type,str2double(get(handles.vEdit,'String')));
    otherwise        
        bufI=imnoise(I,type);
end
imshow(bufI,'Parent', mainHendles.showWindow); 


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global I
global mainHendles
I=getimage(mainHendles.showWindow);
