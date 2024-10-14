! References:
! Pausing/stopping music: https://cplusplus.com/forum/beginner/77256/#msg415697
! mciSendString function: https://learn.microsoft.com/en-us/previous-versions/dd757161(v=vs.85)
! Null return string fix: https://stackoverflow.com/questions/29480647/mcisendstring-returning-null-string
! Getting sound length: https://www.vbforums.com/showthread.php?450236-RESOLVED-How-to-get-Audio-Duration&p=2766002&viewfull=1#post2766002

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
    mciGetErrorString(DWORD MciErrorCode,*LPSTR MciErrorText,UNSIGNED MciErrorTextBuffer),BOOL,PASCAL,RAW,NAME('mciGetErrorStringA') ! https://learn.microsoft.com/en-us/previous-versions/dd757158(v=vs.85)
    mciSendString(*LPCSTR MciCommandString,*LPSTR MciReturnString,UNSIGNED MciReturnStringBuffer,hwnd WindowHandle),DWORD,PASCAL,RAW,NAME('mciSendStringA') ! https://learn.microsoft.com/en-us/previous-versions/dd757161(v=vs.85)
    OutputDebugString(*LPCSTR DebugMessage),PASCAL,RAW,NAME('OutputDebugStringA')
  END
