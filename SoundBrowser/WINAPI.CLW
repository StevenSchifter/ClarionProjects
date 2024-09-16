  SECTION('Equates')
BOOL                    EQUATE(SIGNED)
DWORD                   EQUATE(ULONG)
HANDLE                  EQUATE(UNSIGNED)
HWND                    EQUATE(HANDLE)
LPCSTR                  EQUATE(CSTRING)    !Usage:Pass the Label of the LPCSTR
LPSTR                   EQUATE(CSTRING)    !Usage:Pass the Label of the LPSTR

  SECTION('Prototypes')
  MODULE('Windows.DLL')
    GetActiveWindow(),HWND,PASCAL
    mciGetErrorString(DWORD ErrorCode,*LPSTR ErrorText,UNSIGNED ErrorTextBuffer),BOOL,PASCAL,RAW,NAME('mciGetErrorStringA') ! https://learn.microsoft.com/en-us/previous-versions/dd757158(v=vs.85)
    mciSendString(*LPCSTR CommandString,*LPSTR ReturnString,UNSIGNED ReturnStringBuffer,hwnd WindowHandle),DWORD,PASCAL,RAW,NAME('mciSendStringA') ! https://learn.microsoft.com/en-us/previous-versions/dd757161(v=vs.85)
    OutputDebugString(*LPCSTR DebugMessage),PASCAL,RAW,NAME('OutputDebugStringA')
  END
