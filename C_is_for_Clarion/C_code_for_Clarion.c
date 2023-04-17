// C_code_for_Clarion.c

#if defined(__cplusplus)
extern "C"
{
#endif
    int myFunc(int myInput);
#if defined(__cplusplus)
};
#endif

int myFunc(int myInput)
{
    int myOutput = 0;
    myOutput = (2 * myInput);
    return myOutput;
}