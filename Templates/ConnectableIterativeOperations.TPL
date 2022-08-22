#TEMPLATE(ConnectableIterativeOperationsTemplate,'Connectable Iterative Operations Template'),FAMILY('ABC')
#PROCEDURE(ConnectableIterativeOperationsProcedure,'Connectable Iterative Operations Procedure'),WINDOW,PARENT(Window(ABC))
    #DISPLAY('List of Connectable Iterative Operations')
    #BUTTON('Connectable Iterative Operations'),MULTI(%Operations,%CioClassName),INLINE
        #PROMPT('Operation Class Name (up to 64 chars)',@s64),%CioClassName,REQ,DEFAULT('Op' & %Operations)
        #PROMPT('Interval Duration (x 1/100 sec.)',@n14),%IntervalDuration,REQ,DEFAULT(100)
        #PROMPT('Loops Per Interval',@n14),%IntervalLoops,REQ,DEFAULT(10)
    #ENDBUTTON
    #PROMPT('Automatically start operations?',CHECK),%AutoStartOperations,DEFAULT(1)
    #PROMPT('Automatically cycle through operations?',CHECK),%AutoCycleOperations,DEFAULT(1)
    #PROMPT('Close window after all operations have completed?',CHECK),%AutoCloseOpWindow,DEFAULT(1)
    #LOCALDATA
CurrentOperation    LONG
CurrentOpInfo       STRING(64)
CurrentOpProgress   LONG
CurrentOpProgText   STRING(64)
    #ENDLOCALDATA
#WINDOWS
OperationsWindow WINDOW('Operations In Progress'),AT(,,144,61),FONT('Segoe UI',9),DOUBLE,CENTER,GRAY,TIMER(1)
          STRING(''),AT(0,3,141,10),USE(CurrentOpInfo),CENTER
          PROGRESS,AT(15,15,111,12),USE(CurrentOpProgress),RANGE(0,100)
          STRING(''),AT(0,30,141,10),USE(CurrentOpProgText),CENTER
          BUTTON('Cancel Operation'),AT(38,42,,15),USE(?CancelOperation)
        END
#ENDWINDOWS
#AT(%DataSection)
    #COMMENT(50)
    MAP
ChooseOperation     #< PROCEDURE(LONG OperationNumber)
StopOperation       #< PROCEDURE()
    #EMBED(%WindowWideProcedures,'Window-Wide Procedures'),NOINDENT
    END
Operation           #< ITEMIZE,PRE
    #FOR(%Operations)
%CioClassName       #< EQUATE
    #ENDFOR
                    #< END
    #FOR(%Operations)
%CioClassName       #< CLASS
CurrentItems        #<     LONG
IntervalDuration    #<     LONG(%IntervalDuration)
IntervalLoops       #<     LONG(%IntervalLoops)
OperationInfo       #<     STRING(64)
OperationProgress   #<     PDECIMAL(6)
TotalItems          #<     LONG
    #EMBED(%OperationProperties,'Operation Properties'),%Operations,NOINDENT,TREE(%CioClassName & '|Properties')
SetWindowTimerInterval #<     PROCEDURE()
RunOperation           #<     PROCEDURE()
    #EMBED(%OperationMethods,'Operation Methods'),%Operations,NOINDENT,TREE(%CioClassName & '|Methods')
                    #< END
    #ENDFOR
#ENDAT
#AT(%WindowEventHandling,'Open'),PRIORITY(4590)
    #IF(%AutoStartOperations)
        ChooseOperation(1)
    #ENDIF
#ENDAT
#AT(%WindowEventHandling,'Timer'),PRIORITY(4590)
    EXECUTE CurrentOperation
    #FOR(%Operations)
        %CioClassName.RunOperation()
    #ENDFOR
    END
#ENDAT
#AT(%LocalProcedures),PRIORITY(4590)
    #COMMENT(50)
ChooseOperation #< PROCEDURE(LONG OperationNumber)
    CODE
    CurrentOperation = OperationNumber
    
    EXECUTE CurrentOperation
    #FOR(%Operations)
        %CioClassName.SetWindowTimerInterval()
    #ENDFOR
    END

StopOperation #< PROCEDURE()
    CODE
    %Window{PROP:TIMER} = 0
    #IF(%AutoCycleOperations)
    ChooseOperation(CurrentOperation + 1)
    #ENDIF
    #IF(%AutoCloseOpWindow)
    IF CurrentOperation >= %(ITEMS(%Operations))
        POST(EVENT:CloseWindow)
    END
    #ENDIF

    #FOR(%Operations)
%CioClassName.SetWindowTimerInterval #< PROCEDURE()
    CODE
    %Window{PROP:TIMER} = SELF.IntervalDuration

%CioClassName.RunOperation #< PROCEDURE()
    #EMBED(%OperationRunningData,'Operation Running Data'),%Operations,NOINDENT,TREE(%CioClassName & '|Running Data')
    CODE
    #EMBED(%OperationRunningCode,'Operation Running Code'),%Operations,TREE(%CioClassName & '|Running Code')
    
    #ENDFOR
#ENDAT