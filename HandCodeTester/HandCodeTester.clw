
  PROGRAM

OMIT('***')
 * Created with Clarion 11.1
 * User: Steven
 * Date: 8/15/2022
 * Time: 12:54
 * 
 * To change this template use Tools | Options | Coding | Edit Standard Headers.
 ***

  MAP
  END
  
  INCLUDE('Utilities.inc'),ONCE
  
Util    Utilities

  CODE
  MESSAGE('Hello World')
  MESSAGE(Util.MaxVal(6,3))