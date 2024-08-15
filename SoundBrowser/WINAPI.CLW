  SECTION('Equates')
DWORD                   EQUATE(ULONG)
HANDLE                  EQUATE(UNSIGNED)
HWND                    EQUATE(HANDLE)
LPCSTR                  EQUATE(CSTRING)    !Usage:Pass the Label of the LPCSTR
LPSTR                   EQUATE(CSTRING)    !Usage:Pass the Label of the LPSTR

  SECTION('Prototypes')
  MODULE('Windows.DLL')
    mciSendString(*LPCSTR,*LPSTR,UNSIGNED,hwnd),DWORD,PASCAL,RAW,NAME('mciSendStringA')
    GetActiveWindow(),HWND,PASCAL
  END
