# MzcyCMake

# project初始输出信息
message(STATUS ">> [Project] ${PROJECT_NAME} version ${PROJECT_VERSION}")
message(STATUS ">> include MzcyInit.cmake")

# 自定义的模块
list(APPEND CMAKE_MODULE_PATH "${PROJECT_SOURCE_DIR}/cmake")
include(${CMAKE_CURRENT_LIST_DIR}/MzcySubDir.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/MzcyFile.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/MzcyTarget.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/MzcyFetchContent.cmake)


macro(Mzcy_InitProject)
    message(STATUS ">> [Mzcy_InitProject]")

    # CXX-20 stand
    set(CMAKE_CXX_STANDARD 20)
    set(CMAKE_CXX_STANDARD_REQUIRED True)

    # project root dir
    if(NOT Mzcy_RootPath)
        set(Mzcy_RootPath ${PROJECT_SOURCE_DIR})
    endif()
    # common include dir
    if(NOT Mzcy_RootInclude)
        set(Mzcy_RootInclude ${PROJECT_SOURCE_DIR}/include)
    endif()

    # default build type cache
    if(NOT CMAKE_BUILD_TYPE)
        set(CMAKE_BUILD_TYPE Debug CACHE STRING "Build type" FORCE)
    endif()

    # bin/lib/bin
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${Mzcy_RootPath}/bin")
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_DEBUG ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELEASE ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_RUNTIME_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${Mzcy_RootPath}/lib")
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_DEBUG ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELEASE ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_ARCHIVE_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${Mzcy_RootPath}/bin")
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_DEBUG ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELEASE ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_MINSIZEREL ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_RELWITHDEBINFO ${CMAKE_LIBRARY_OUTPUT_DIRECTORY})

    set_property(GLOBAL PROPERTY USE_FOLDERS ON)

    # enable_testing()

    # mkdir
    file(MAKE_DIRECTORY source docs .ignore include)

endmacro() # Mzcy_InitProject


macro(Mzcy_InitCheck)
    message(STATUS ">> [Mzcy_InitCheck]")
    message(STATUS ">> ${CMAKE_GENERATOR} ${CMAKE_BUILD_TYPE}")
    message(STATUS ">> C = ${CMAKE_C_COMPILER}")
    message(STATUS ">> CXX = ${CMAKE_CXX_COMPILER}")
    message(STATUS ">> LINKER = ${CMAKE_LINKER}")
    set(Mzcy_SHOW_DETAILS True)
endmacro() # Mzcy_InitCheck
