cmake_minimum_required(VERSION 3.15 FATAL_ERROR)
project(MzcyCMake VERSION 0.1)

# GetMzcyCMake
include(cmake/GetMzcyCMake.cmake)

# MzcyInit
include(cmake/MzcyInit.cmake)

# init check (optional)
# Mzcy_InitCheck()

# init
Mzcy_InitProject()

# subdirs
Mzcy_AddSubDirsRec(source)

include(cmake/InstallMzcyCMake.cmake)