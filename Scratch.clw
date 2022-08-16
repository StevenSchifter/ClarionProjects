LIST,AT(8,30,232,124),USE(?Browse:1),HVSCROLL,FORMAT('180L(2)|M~Installer Nam' & |
            'e~@s64@36R(2)|M~In Batch?~@n3b@'),FROM(Queue:Browse:1),IMM,MSG('Browsing t' & |
            'he CapeSoftAccessories file'),#FIELDS(CSA:InstallerName,CSA:IncludeInGeneratedBatchFile), |
            #ORIG(?List)