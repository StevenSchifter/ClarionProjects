LIST,AT(8,30,232,124),USE(?Browse:1),HVSCROLL,FORMAT('180L(2)|M~Installer Nam' & |
            'e~@s64@36R(2)|M~In Batch?~@n3b@'),FROM(Queue:Browse:1),IMM,MSG('Browsing t' & |
            'he CapeSoftAccessories file'),#FIELDS(CSA:InstallerName,CSA:IncludeInGeneratedBatchFile), |
            #ORIG(?List)


DateTimeGroupTest    PROCEDURE()
InputGrp     GROUP,PRE(InG)
DateField       DATE
TimeField       TIME
             END

OutputGrp    GROUP,PRE(OutG)
DTString        STRING(8)
DTGroup         GROUP,OVER(DTString)
DateField2           DATE
TimeField2           TIME
                END
            END
    CODE
    InG:DateField = TODAY()
    InG:TimeField = CLOCK()
    OutputGrp :=: InputGrp
    MESSAGE(FORMAT(OutputGrp.DTGroup.DateField2,@d17))
    MESSAGE(FORMAT(OutputGrp.DTGroup.TimeField2,@t7))
    MESSAGE(OutG:DTString)
    OutG:DTString = OutG:DTGroup
    MESSAGE(OutG:DTString)