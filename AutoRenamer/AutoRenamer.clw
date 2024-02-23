
    PROGRAM

OMIT('***')
 * Created with Clarion 11.1
 * User: Steven
 * Date: 02/23/24
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 ***

    MAP
    END

    INCLUDE('equates.clw'),ONCE
    INCLUDE('Utilities.inc'),ONCE

MyUtil             Utilities
TargetDirectory    CSTRING(FILE:MaxFilePath+1)
OriginalName       CSTRING(FILE:MaxFileName+1)
NewName            CSTRING(FILE:MaxFileName+1)
RenameCounter      LONG(1)
RenameCounterStep  LONG(1)
UseRenameCounter   BYTE
MyWindow WINDOW('Auto Renamer'),AT(,,318,118),CENTER,GRAY,SYSTEM,FONT('Segoe UI',11), |
            TIMER(500)
        PROMPT('Target Directory:'),AT(5,9),USE(?TargetDirectoryPrompt)
        ENTRY(@s255),AT(62,8,209),USE(TargetDirectory)
        BUTTON('Browse'),AT(274,7),USE(?TargetDirectoryBrowseButton),DEFAULT
        PROMPT('Original Name:'),AT(5,29),USE(?OriginalNamePrompt)
        ENTRY(@s255),AT(62,28,209),USE(OriginalName)
        BUTTON('Browse'),AT(274,27),USE(?OriginalNameBrowseButton)
        PROMPT('New Name:'),AT(5,50),USE(?NewNamePrompt)
        ENTRY(@s255),AT(62,49,209),USE(NewName)
        BUTTON('Browse'),AT(274,48),USE(?NewNameBrowseButton)
        CHECK('Use Rename Counter'),AT(5,70),USE(UseRenameCounter)
        SPIN(@N6),AT(92,69,40,12),USE(RenameCounter),RIGHT(2)
        PROMPT('Step:'),AT(140,70),USE(?RenameCounterStepSpinPrompt)
        SPIN(@N6),AT(162,69,40,12),USE(RenameCounterStep),RIGHT(2)
        BUTTON('&Start'),AT(217,97,40,16),USE(?StartButton)
        BUTTON('&Close'),AT(272,97,40,16),USE(?CloseButton)
    END

    CODE
    OPEN(MyWindow)
    DISPLAY()
    ACCEPT
        CASE FIELD()
        OF 0
            CASE EVENT()
            OF EVENT:OpenWindow
                MyWindow{PROP:Timer} = 0
            OF EVENT:Timer ! Timer Loop
                IF EXISTS(TargetDirectory & OriginalName)
                    IF UseRenameCounter
                        RENAME(TargetDirectory & OriginalName, TargetDirectory & NewName & RenameCounter)
                        RenameCounter += RenameCounterStep
                        DISPLAY()
                    ELSIF NewName
                        RENAME(TargetDirectory & OriginalName, TargetDirectory & NewName)
                    END
                END
            END
        OF ?TargetDirectoryBrowseButton
            CASE EVENT()
            OF EVENT:Accepted
                FILEDIALOGA('Select Target Directory',TargetDirectory,,FILE:LongName+FILE:Directory)
                TargetDirectory = MyUtil.TrailingBackslash(TargetDirectory)
                DISPLAY()
            OF EVENT:Rejected
                CYCLE
            END
        OF ?OriginalNameBrowseButton
            CASE EVENT()
            OF EVENT:Accepted
                FILEDIALOGA('Select Original Name',OriginalName,,FILE:LongName)
                OriginalName = MyUtil.GetFileName(OriginalName)
                DISPLAY()
            OF EVENT:Rejected
                CYCLE
            END
        OF ?NewNameBrowseButton
            CASE EVENT()
            OF EVENT:Accepted
                FILEDIALOGA('Select New Name',NewName,,FILE:LongName)
                NewName = MyUtil.GetFileName(NewName)
                DISPLAY()
            OF EVENT:Rejected
                CYCLE
            END
        OF ?StartButton
            CASE EVENT()
            OF EVENT:Accepted
                IF ?StartButton{PROP:Text} = 'Stop'
                    MyWindow{PROP:Timer} = 0
                    ?StartButton{PROP:Text} = 'Go'
                ELSIF TargetDirectory
                    TargetDirectory = MyUtil.TrailingBackslash(TargetDirectory)
                    IF NOT OriginalName
                        MESSAGE('Please enter or select the original name of the file.', |
                        '',ICON:Exclamation,'OK',1)
                    END
                    IF (NewName OR UseRenameCounter)
                        MyWindow{PROP:Timer} = 500
                        ?StartButton{PROP:Text} = 'Stop'
                    ELSE
                        MESSAGE('Please enter a new name or activate the rename counter.', |
                        '',ICON:Exclamation,'OK',1)
                    END
                ELSE
                    POST(EVENT:Accepted,?TargetDirectoryBrowseButton)
                END
            END
        OF ?CloseButton
            CASE EVENT()
            OF EVENT:Accepted
                POST(EVENT:CloseWindow)
            END
        END
    END
