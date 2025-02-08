
   PROGRAM

OMIT('***')
 * Created with Clarion 11.1
 * User: Steven
 * Date: 12/24/2024
 * Time: 13:45
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 ***

    MAP
        MODULE('Windows.dll')
            PlaySoundA(*CSTRING pszSound, UNSIGNED hmod, ULONG fdwSound),SIGNED,PROC,PASCAL,RAW,NAME('PlaySoundA')
            ShellExecuteA(UNSIGNED HWND,*CSTRING lpOperation,*CSTRING lpFile,*CSTRING lpParameters,*CSTRING lpDirectory,SIGNED nShowCmd),UNSIGNED,PROC,PASCAL,RAW,NAME('ShellExecuteA') ! https://learn.microsoft.com/en-us/windows/win32/api/shellapi/nf-shellapi-shellexecutea
        END
    END

    INCLUDE('KEYCODES.CLW'),ONCE
    INCLUDE('StringTheory.inc'),ONCE
    INCLUDE('Utilities.inc'),ONCE
! Interfaces
Mesg    INTERFACE ! MESSAGE() function wrapper interface
ShowAlert    PROCEDURE(STRING MyAlertMsg) ! Wrapper for MESSAGE() function
        END
Calc    INTERFACE(Mesg) ! Calculation interface; child of Mesg
Calculate    PROCEDURE(LONG N1,LONG N2),LONG ! Two-number calculation method
        END
! Classes
IntTest     CLASS,IMPLEMENTS(Calc) ! One interface per class
CalcMesg        PROCEDURE ! Tests methods from both interfaces
            END
! Local Data
St           StringTheory
TestSound    CSTRING(255)
CheckQ       QUEUE,PRE(CQ)
CkMk             BYTE
SomeText         STRING(20)
             END
ListSelection    LONG
ShellExGrp   GROUP,PRE(SHX)
Operation        CSTRING(16)
File             CSTRING(255)
Params           CSTRING(255)
WorkingDir       CSTRING(255)
             END
! Window Definition
ListWindow WINDOW('Hand Code Tests'),AT(,,162,216),GRAY,SYSTEM,ICON(ICON:Application), |
            FONT('Segoe UI',9)
        STRING('Checkbox Queue'),AT(4,3,154),USE(?CqTitleString),CENTER, |
                FONT(,,,FONT:bold)
        LIST,AT(5,15,153,153),USE(?CheckList),VSCROLL,ALRT(MouseLeft2),FROM(CheckQ), |
                FORMAT('20L(2)|M~Ck~@n1@80L(2)|M~Some Text~@s20@')
        BUTTON('Play Sound'),AT(4,170,72,18),USE(?PlayButton),ICON(ICON:VCRplay),LEFT
        BUTTON('Test Interfaces'),AT(86,170,72,18),USE(?TestInterfacesButton),LEFT
        BUTTON('Test ShellExecute'),AT(4,194,72,18),USE(?TestRunCmdButton),LEFT
        BUTTON('UPPER Clipboard'),AT(86,194,72,18),USE(?UpperClipboardButton),LEFT
    END
! Code
    CODE
    TestSound = 'C:\\Windows\\Media\\tada.wav'
    LOOP 300 TIMES
        CLEAR(CheckQ)
        CQ:SomeText = St.Random(16,st:Hex)
        ADD(CheckQ)
    END
    OPEN(ListWindow)
    ACCEPT
        CASE ACCEPTED()
        OF ?PlayButton
            PlaySoundA(TestSound,0,20000h)
        OF ?TestInterfacesButton
            IntTest.CalcMesg()
        OF ?TestRunCmdButton
            SHX:Operation = 'open'
            SHX:File = '"C:\Windows"'
            ShellExecuteA(0,SHX:Operation,SHX:File,SHX:Params,SHX:WorkingDir,1)
        OF ?UpperClipboardButton
            !MESSAGE(CLIPBOARD())
            SETCLIPBOARD(UPPER(CLIPBOARD()))
            !MESSAGE(CLIPBOARD())
        END
        CASE FIELD()
        OF ?CheckList
            CASE EVENT()
            OF EVENT:MouseDown
                IF ?CheckList{PROPLIST:MouseDownField} = 1
                    DO ToggleCkMk
                END
            OF EVENT:AlertKey
                IF KEYCODE() = MouseLeft2
                    ListSelection = CHOICE(?CheckList)  ! Get current selection in list box
                    GET(CheckQ, ListSelection)          ! Get corresponding data from queue
                    SETCLIPBOARD(CQ:SomeText)
                END
            END
        END
    END
! Routines
ToggleCkMk    ROUTINE
    GET(CheckQ,CHOICE(?CheckList))
    IF CQ:CkMk = 0
        CQ:CkMk = 1
    ELSIF CQ:CkMk = 1
        CQ:CkMk = 0
    END
    PUT(CheckQ)
! Procedures
IntTest.Calc.Calculate    PROCEDURE(LONG N1,LONG N2)!,LONG
    CODE
    RETURN N1 + N2

IntTest.Calc.ShowAlert    PROCEDURE(STRING MyAlertMsg)
    CODE
    MESSAGE(MyAlertMsg)

IntTest.CalcMesg          PROCEDURE
    CODE
    SELF.Calc.ShowAlert(SELF.Calc.Calculate(2,2))
