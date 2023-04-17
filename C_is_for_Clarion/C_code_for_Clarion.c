// C_code_for_Clarion.c

#if defined(__cplusplus)
extern "C"
{
#endif
    int largest(int a, int b);
    int myFunc(int myInput);
#if defined(__cplusplus)
};
#endif

int largest(int a, int b)
{
    if(a > b)
        return a;
    else
        return b;
}

int myFunc(int myInput)
{
    int myOutput = 0;
    myOutput = (2 * myInput);
    return myOutput;
}
