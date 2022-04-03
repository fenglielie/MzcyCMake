#pragma once

// always Mzcy_DLL_FLAG means null
// but if on Win32, and if you want to build or use shared library,
// you can use same head file when build and use:
// 1. you should define Mzcy_SHARED on head file
// 2. you should use Mzcy_DLL_FLAG before symbols like function, class defination and so on.
// 3. you should define Mzcy_DLL_EXPORT on source files for building the shared library.
// 4. both Mzcy_SHARED and Mzcy_DLL_EXPORT should be defined before include this head file.

#if defined(_WIN32) && defined(Mzcy_SHARED)
#   ifdef  Mzcy_DLL_EXPORT
#      define Mzcy_DLL_FLAG __declspec(dllexport)
#   else
#      define Mzcy_DLL_FLAG __declspec(dllimport)
#   endif
#else
#   define Mzcy_DLL_FLAG
#endif