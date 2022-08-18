        MEMBER

        INCLUDE('Utilities.inc'),ONCE

        MAP
        END

Utilities.MaxVal                PROCEDURE(LONG X,LONG Y)!,LONG
    CODE
    IF X > Y
        RETURN X
    ELSE
        RETURN Y
    END

Utilities.MinVal                PROCEDURE(LONG X,LONG Y)!,LONG
    CODE
    IF X < Y
        RETURN X
    ELSE
        RETURN Y
    END

Utilities.ShowErrorDetails        PROCEDURE(<STRING MoreDetails>,<STRING ErrTitle>)!,LONG,PROC
MsgStr          STRING(2048)
    CODE
    IF ERRORCODE()
        MsgStr = ERROR() & '|Error Code: ' & ERRORCODE()
        IF OMITTED(ErrTitle)
            ErrTitle = 'Error'
        END
        IF NOT OMITTED(MoreDetails)
            MsgStr = CLIP(MsgStr) & '|More Details: ' & CLIP(MoreDetails)
        END
        RETURN MESSAGE(CLIP(MsgStr), |
        ErrTitle, |
        ICON:Hand,|
        BUTTON:ABORT + BUTTON:IGNORE,|
        BUTTON:IGNORE,|
        MSGMODE:CANCOPY)
    ELSE
        RETURN 0
    END

Utilities.TrailingBackslash     PROCEDURE(STRING MyPath)!,STRING
IncomingPath    STRING(FILE:MaxFilePath)
    CODE
    IncomingPath = CLIP(MyPath)
    IF IncomingPath[LEN(CLIP(IncomingPath))] <> '\'
        IncomingPath = CLIP(IncomingPath) & '\'
    END
    RETURN CLIP(IncomingPath)
