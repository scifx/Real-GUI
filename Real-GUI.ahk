; 作者：scifx
; 网站：https://scifx.github.io
; 社交媒体：https://space.bilibili.com/232679770
#SingleInstance Force
#NoEnv

SetWorkingDir %A_ScriptDir%
SetBatchLines -1

Settings:= "Settings.ini"

scale:=4
fmt:="png"
mode:="realesrgan-x4plus"
appendText:="_x4"
bg:=True

if not FileExist(Settings)
{
    IniWrite, 倍数=%scale%`n格式=%fmt%`n算法=%mode%`n后缀=%appendText%`n后台=%bg%, %Settings%, Section
}else
{
    if (%0% != 0)
    {
        IniRead, scale ,%Settings%,Section,倍数
        IniRead, fmt ,%Settings%,Section,格式
        IniRead, mode ,%Settings%,Section,算法
        IniRead, appendText ,%Settings%,Section,后缀
        IniRead, bg ,%Settings%,Section,后台
    }

}

Runner(Parm)
{
    FileGetAttrib, Attributes, %Parm%
    IfInString, Attributes, D
    {
        global mode
        if (mode=="realesr-animevideov3")
        {
            Go(Parm,False)
        }else{
            Loop,Files,%Parm%\*,R
            {
                Go(A_LoopFileFullPath)
            }
        }
    }Else{
        Go(Parm)

    }
        
}

Go(Item,isFile=True)
{
    global scale
    global fmt
    global mode
    global appendText
    global bg
    
    if (isFile){
        SplitPath, Item , OutFileName, OutDir, OutExtension, OutNameNoExt, OutDrive
        file:= OutDir . "\" . OutNameNoExt . appendText . "." . fmt
    }else{
        file:= Item . appendText
        if not FileExist(file)
        {
            FileCreateDir, %file%
        }
    }
    
    real:= A_ScriptDir . "\realesrgan-ncnn-vulkan.exe"
    if(bg){
        Run %ComSpec% /c %real% -n %mode% -s %scale% -f %fmt% -i %Item% -o %file%,,Hide
    }else{
        Run %ComSpec% /c %real% -n %mode% -s %scale% -f %fmt% -i %Item% -o %file%
    }
}


if (%0% != 0)
{
    Loop,%0%
    {
        Parm:= %A_Index%
        Runner(Parm)
    }
    ExitApp
}


Menu,tray,icon,logo.ico,,1

Gui Add, Tab3, x8 y8 w230 h194, 基础|高级


Gui Tab, 基础
Gui Add, GroupBox, x16 y40 w211 h68, 放大倍数
Gui Add, Radio,v2x g2x x40 y60 w50 h30, 2
Gui Add, Radio,v3x g3x x102 y60 w50 h30, 3
Gui Add, Radio,v4x g4x x164 y60 w50 h30 +Checked , 4

GuiControl,Disable,2x
GuiControl,Disable,3x

Gui Add, GroupBox, x16 y110 w213 h80, 格式
Gui Add, Radio, gjpg x40 y140 w50 h30, jpg
Gui Add, Radio, gwebp x102 y140 w50 h30, webp
Gui Add, Radio, gpng x164 y140 w50 h30 +Checked , png


Gui Tab,高级
Gui Font, s9, Segoe UI
Gui Add, GroupBox, x16 y40 w211 h68, 算法
Gui Add, DropDownList,vmode gchoice x50 y60 w155,realesrgan-x4plus||realesr-animevideov3|realesrgan-x4plus-anime|realesrnet-x4plus
Gui Add, GroupBox, x16 y110 w213 h80, 后缀名
Gui Add, Edit, vappendText x50 y144 w155 h23 +Left , _x4


Gui Tab
Gui Add, CheckBox, vbg x16 y216 w120 h23 +Checked , 后台运行
Gui Add, Button, gpress x158 y216 w80 h23,&保存

Gui Show, w246 h256, Real-GUI
Return

2x:
scale:= 2
GuiControl, text, appendText,_x2
Return

3x:
scale:= 3
GuiControl, text, appendText,_x3
Return

4x:
scale:= 4
GuiControl, text, appendText,_x4
Return

jpg:
fmt:= "jpg"
Return

webp:
fmt:= "webp"
Return

png:
fmt:= "png"
Return

choice:
Gui, Submit,NoHide
if ( mode != "realesr-animevideov3" ){
    GuiControl,Disable,2x
    GuiControl,Disable,3x
    GuiControl,,4x,1
    scale:=4
    GuiControl, text, appendText,_x4
}else{
    GuiControl,Enable,2x
    GuiControl,Enable,3x
}
Gui, Submit,NoHide
Return

press:
Gui, Submit,NoHide
IniWrite, 倍数=%scale%`n格式=%fmt%`n算法=%mode%`n后缀=%appendText%`n后台=%bg%, %Settings%, Section
ExitApp

GuiDropFiles(GuiHwnd, FileArray, CtrlHwnd, X, Y) {
    global Settings
    global scale
    global fmt
    global mode
    global appendText
    global bg
    Gui, Submit,NoHide
    IniWrite, 倍数=%scale%`n格式=%fmt%`n算法=%mode%`n后缀=%appendText%`n后台=%bg%, %Settings%, Section
    for i, Parm in FileArray
        Runner(Parm)
}


GuiEscape:
GuiClose:
    ExitApp