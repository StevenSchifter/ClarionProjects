#include <Windows.h>
#include <mmsystem.h>

#pragma comment(lib, "Winmm.lib") // https://stackoverflow.com/questions/47616043/c-playsound-returning-undefined-reference-to-playsoundw12

extern "C" int Waver()
{
    PlaySoundW(TEXT("C:\\Windows\\Media\\recycle.wav"), NULL, SND_FILENAME);
    return 0;
}