
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
            END
        END
    END

CreateSquares           PROCEDURE()
    CODE
    
RecolorRandomSquares    PROCEDURE()
    CODE
    