MEMBER

INCLUDE('Utilities.inc'),ONCE

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