CRLF    EQUATE('<13,10>')

Utilities           CLASS,TYPE,MODULE('Utilities.clw'),LINK('Utilities.clw')
GetFileFolder           PROCEDURE(STRING MyPath),STRING
GetFileName             PROCEDURE(STRING MyPath),STRING
MaxVal                  PROCEDURE(LONG X,LONG Y),LONG
MinVal                  PROCEDURE(LONG X,LONG Y),LONG
ShowErrorDetails        PROCEDURE(<STRING MoreDetails>,<STRING ErrTitle>),LONG,PROC
TrailingBackslash       PROCEDURE(STRING MyPath),STRING
                    END