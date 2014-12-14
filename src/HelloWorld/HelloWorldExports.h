#pragma once

#ifdef WIN32

#ifdef HELLOWORLD_EXPORTS
    #ifndef HELLOWORLD_DLL_EXP
        #define HELLOWORLD_DLL_EXP   __declspec( dllexport )
    #endif
#else
    #ifndef HELLOWORLD_DLL_EXP
        #define HELLOWORLD_DLL_EXP   __declspec( dllimport )
    #endif
#endif

#endif