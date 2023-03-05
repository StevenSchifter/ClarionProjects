
   PROGRAM

OMIT('***')
 * Created with Clarion 11.1
 * User: Steven
 * Date: 8/15/2022
 * Time: 12:54
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 ***

    MAP
        MODULE('WinMM.lib')
            PlaySound(*CSTRING pszSound, UNSIGNED hmod, ULONG fdwSound),SIGNED,RAW,NAME('_playsound')
        END
    END

    INCLUDE('StringTheory.inc'),ONCE
    INCLUDE('Utilities.inc'),ONCE

St      StringTheory
Util    Utilities

CheckQ    QUEUE,PRE(CQ)
CkMk          BYTE
SomeText      STRING(20)
          END

ListWindow WINDOW('Checkbox Queue'),AT(,,162,181),GRAY,SYSTEM,ICON(ICON:Application), |
            FONT('Segoe UI',9)
        LIST,AT(5,5,153,153),USE(?CheckList),VSCROLL,FROM(CheckQ),FORMAT('20L(2)' & |
                '|M~Ck~@n1@80L(2)|M~Some Text~@s20@')
        BUTTON('Play!'),AT(62,162),USE(?PlayButton),ICON(ICON:VCRplay),LEFT
    END

    CODE
    LOOP 300 TIMES
        CLEAR(CheckQ)
        CQ:SomeText = St.Random(20)
        ADD(CheckQ)
    END
    OPEN(ListWindow)
    ACCEPT
        CASE ACCEPTED()
        OF ?PlayButton
            MESSAGE('Not yet implemented')
        END
        CASE FIELD()
        OF ?CheckList
            CASE EVENT()
            OF EVENT:MouseDown
                IF ?CheckList{PROPLIST:MouseDownField} = 1
                    DO ToggleCkMk
                END
            END
        END
    END

ToggleCkMk    ROUTINE
    GET(CheckQ,CHOICE(?CheckList))
    IF CQ:CkMk = 0
        CQ:CkMk = 1
    ELSIF CQ:CkMk = 1
        CQ:CkMk = 0
    END
    PUT(CheckQ)
!  MESSAGE('Hello World')
!  MESSAGE(Util.MaxVal(6,3))