        MEMBER

        INCLUDE('Utilities.inc'),ONCE

        MAP
        END

Utilities.MaxVal    PROCEDURE(LONG X,LONG Y)!,LONG
    CODE
    IF X > Y
        RETURN X
    ELSE
        RETURN Y
    END

Utilities.MinVal    PROCEDURE(LONG X,LONG Y)!,LONG
    CODE
    IF X < Y
        RETURN X
    ELSE
        RETURN Y
    END

Utilities.TrailingBackslash    PROCEDURE(STRING MyPath)!,STRING
IncomingPath    STRING(256)
    CODE
    IncomingPath = CLIP(MyPath)
    IF IncomingPath[LEN(CLIP(IncomingPath))] <> '\'
        IncomingPath = CLIP(IncomingPath) & '\'
    END
    RETURN CLIP(IncomingPath)
