
    PROGRAM

OMIT('***')
 * Created with Clarion 11.1
 * User: Steven
 * Date: 04/17/2023
 * Time: 10:33 AM
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 ***
    
    MAP
        MODULE('C_code_for_Clarion.c')
            myFunc(SIGNED myInput),SIGNED,RAW,NAME('_myFunc')
        END
    END
    
FuncRet    SIGNED
    
    CODE
    FuncRet = myFunc(2)
    MESSAGE(FuncRet)