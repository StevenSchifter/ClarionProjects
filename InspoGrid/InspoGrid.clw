
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
CreateBoxes           PROCEDURE()
RecolorRandomBoxes    PROCEDURE()
    END

    INCLUDE('equates.clw'),ONCE

BOX_SIZE            EQUATE(9)
BOX_SPACE           EQUATE(10)
GRID_SIZE           EQUATE(48)
DEFAULT_COLOR       EQUATE(COLOR:Blue)
ALTERNATE_COLOR     EQUATE(COLOR:White)
BOXES_TO_RECOLOR    EQUATE(18)

MyWindow WINDOW('InspoGrid'),AT(,,500,500),GRAY,FONT('Consolas',10,,FONT:regular),SYSTEM
    END

    CODE
    OPEN(MyWindow)
    ACCEPT
        CASE FIELD()
        OF 0
            CASE EVENT()
            OF EVENT:OpenWindow
                CreateBoxes()
                RecolorRandomBoxes()
                UNHIDE(FIRSTFIELD(),LASTFIELD())
            END
        END
    END

CreateBoxes           PROCEDURE()
CurrentBox    SIGNED
LoopX         LONG
LoopY         LONG
    CODE
    LOOP LoopY = 1 TO GRID_SIZE
        LOOP LoopX = 1 TO GRID_SIZE
            CurrentBox = CREATE(0,CREATE:box)
            SETPOSITION(CurrentBox,BOX_SPACE*LoopX,BOX_SPACE*LoopY,BOX_SIZE,BOX_SIZE)
            CurrentBox{PROP:Fill} = DEFAULT_COLOR
        END
    END

RecolorRandomBoxes    PROCEDURE()
RandomBox    LONG
    CODE
    LOOP BOXES_TO_RECOLOR TIMES
        LOOP CLOCK() / 3600 TIMES
            RandomBox = RANDOM(FIRSTFIELD(),LASTFIELD())
        END
        RandomBox{PROP:Fill} = ALTERNATE_COLOR
    END