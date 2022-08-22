
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
    END

    INCLUDE('StringTheory.inc'),ONCE
    INCLUDE('Utilities.inc'),ONCE

St      StringTheory
Util    Utilities

CheckQ    QUEUE,PRE(CQ)
CkMk          BYTE
SomeText      STRING(20)
          END

ListWindow WINDOW('Checkbox Queue'),AT(,,162,162),GRAY,FONT('Segoe UI',9)
        LIST,AT(5,5,153,153),USE(?CheckList),VSCROLL,FROM(CheckQ),FORMAT('20L(2)' & |
                '|M~Ck~@n1b@80L(2)|M~Some Text~@s20@')
    END

    CODE
    STOP('Checkpoint')
    LOOP 300 TIMES
        CLEAR(CheckQ)
        CQ:SomeText = St.Random(20)
        ADD(CheckQ)
    END
    OPEN(ListWindow)
    ACCEPT
        CASE FIELD()
        OF ?CheckList
            CASE EVENT()
            OF EVENT:MouseDown
                IF ?CheckList{PROPLIST:MouseDownField} = 1
                    GET(CheckQ,CHOICE(?CheckList))
                    CQ:CkMk = 1
                    PUT(CheckQ)
                END
            END
        END
    END
!  MESSAGE('Hello World')
!  MESSAGE(Util.MaxVal(6,3))