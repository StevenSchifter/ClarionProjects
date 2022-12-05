
    PROGRAM

OMIT('***')
 * Created with Clarion 11.1
 * User: Steven
 * Date: 12/05/22
 * Time: 14:59
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 ***

    MAP
CreateSquares           PROCEDURE()
RecolorRandomSquares    PROCEDURE()
    END

    INCLUDE('equates.clw'),ONCE 

GRID_SIZE          EQUATE(48)
DEFAULT_COLOR      EQUATE(COLOR:Blue)
ALTERNATE_COLOR    EQUATE(COLOR:White)
MyWindow WINDOW('Caption'),AT(,,500,500),GRAY,FONT('Consolas',10,,FONT:regular),SYSTEM
    END

    CODE
    OPEN(MyWindow)
    ACCEPT
        CASE FIELD()
        OF 0
            CASE EVENT()
            OF EVENT:OpenWindow
                CreateSquares()
            END
        END
    END

CreateSquares           PROCEDURE()
CurrentBox    SIGNED
LoopX         LONG
LoopY         LONG
    CODE
    LOOP LoopY = 1 TO GRID_SIZE
        LOOP LoopX = 1 TO GRID_SIZE
            CurrentBox = CREATE(0,CREATE:box)
            SETPOSITION(CurrentBox,10*LoopX,10*LoopY,10,10)
            CurrentBox{PROP:Fill} = DEFAULT_COLOR
            CurrentBox{PROP:Hide} = FALSE
        END
    END
RecolorRandomSquares    PROCEDURE()
    CODE
    