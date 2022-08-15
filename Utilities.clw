Utilities.MaxVal    PROCEDURE(LONG X,LONG Y)
    CODE
    IF X > Y
        RETURN X
    ELSE
        RETURN Y
    END

Utilities.MinVal    PROCEDURE(LONG X,LONG Y)
    CODE
    IF X < Y
        RETURN X
    ELSE
        RETURN Y
    END