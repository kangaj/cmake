#pragma once

#ifdef _LINUX
    #define HELLOWORLD_EXP
#else
    #ifdef HELLOWORLD_EXPORTS
        #ifndef HELLOWORLD_EXP
            #define HELLOWORLD_EXP   __declspec( dllexport )
        #endif
    #else
        #ifndef HELLOWORLD_EXP
            #define HELLOWORLD_EXP   __declspec( dllimport )
        #endif
    #endif
#endif
