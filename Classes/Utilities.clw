        MEMBER

        INCLUDE('Utilities.inc'),ONCE

        MAP
        END

Utilities.GetFileFolder   PROCEDURE(STRING MyPath)!,STRING
IncomingPath    STRING(FILE:MaxFilePath)
LastSlashPos    LONG
    CODE
    IncomingPath = CLIP(MyPath)
    LastSlashPos = INSTRING('\',IncomingPath,-1,LEN(CLIP(IncomingPath)))
    RETURN SUB(CLIP(IncomingPath),1,LastSlashPos - 1)

Utilities.GetFileName     PROCEDURE(STRING MyPath)!,STRING
IncomingPath    STRING(FILE:MaxFilePath)
LastSlashPos    LONG
    CODE
    IncomingPath = CLIP(MyPath)
    LastSlashPos = INSTRING('\',IncomingPath,-1,LEN(CLIP(IncomingPath)))
    RETURN SUB(CLIP(IncomingPath),LastSlashPos + 1,FILE:MaxFileName)

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
BtnRslt         LONG
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
        BtnRslt = MESSAGE(CLIP(MsgStr), |
        ErrTitle, |
        ICON:Hand,|
        BUTTON:ABORT + BUTTON:IGNORE,|
        BUTTON:IGNORE,|
        MSGMODE:CANCOPY)
    END
    RETURN BtnRslt

Utilities.TrailingBackslash     PROCEDURE(STRING MyPath)!,STRING
IncomingPath    STRING(FILE:MaxFilePath)
    CODE
    IncomingPath = CLIP(MyPath)
    IF IncomingPath[LEN(CLIP(IncomingPath))] <> '\'
        IncomingPath = CLIP(IncomingPath) & '\'
    END
    RETURN CLIP(IncomingPath)
