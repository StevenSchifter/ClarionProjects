
  PROGRAM

OMIT('***')
 * Created with Clarion 11.1
 * User: Steven
 * Date: 03/27/2023
 * Time: 4:18 PM
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 ***

    MAP
        MODULE('Windows.dll')
            PlaySoundA(*CSTRING pszSound, UNSIGNED hmod, ULONG fdwSound),SIGNED,PROC,PASCAL,RAW,NAME('PlaySoundA')
        END
    END

    INCLUDE('equates.clw'),ONCE 

FartSound    CSTRING(255)

FartWindow WINDOW('Fart'),AT(,,150,48),GRAY,SYSTEM,FONT('MS Sans Serif',8,, |
            FONT:regular)
        BUTTON('&Fart'),AT(10,12,59,25),USE(?FartButton),ICON(ICON:Exclamation), |
                DEFAULT,LEFT
        BUTTON('&Close'),AT(80,12,59,25),USE(?CloseButton),ICON(ICON:Hand),LEFT
    END

    CODE
    FartSound = 'fart.wav' ! I made this sound effect by moving my lips in a peculiar way, then editing the results in Audacity.
    OPEN(FartWindow)
    ACCEPT
        CASE FIELD()
        OF 0
            CASE EVENT()
            OF EVENT:OpenWindow
            END
        OF ?FartButton
            CASE EVENT()
            OF EVENT:Accepted
                PlaySoundA(FartSound,0,20000h)
            END
        OF ?CloseButton
            CASE EVENT()
            OF EVENT:Accepted
                POST(EVENT:CloseWindow)
            END
        END
    END
 