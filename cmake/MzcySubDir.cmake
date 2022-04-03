# MzcyCMake

message(STATUS ">> include MzcySubDir.cmake")

# 提供了递归和非递归的查找所有含有CMakeLists.txt的子目录的cmake函数，并且依次访问子目录
# Mzcy_AddSubDirsRec(source) 递归
# Mzcy_AddSubDirs(source) 非递归

function(Mzcy_AddSubDirsRec path)
    # find dirs recurse
    file(GLOB_RECURSE children LIST_DIRECTORIES true ${CMAKE_CURRENT_SOURCE_DIR}/${path}/*)
    list(APPEND children "${CMAKE_CURRENT_SOURCE_DIR}/${path}")

    set(dirs "")
    # add sub-dir to dirs if CMakeLists.txt exist
    foreach(item ${children})
        if(IS_DIRECTORY ${item} AND EXISTS "${item}/CMakeLists.txt")
            list(APPEND dirs ${item})
        endif()
    endforeach()

    if(Mzcy_SHOW_DETAILS)
        message(STATUS ">> dirs: ${dirs}")
    endif()

    # goto sub-dir in dirs
    foreach(dir ${dirs})
        if(Mzcy_SHOW_DETAILS)
            message(STATUS ">> go to subdirectory: ${dir}")
        endif()
        add_subdirectory(${dir})
    endforeach()

endfunction() # Mzcy_AddSubDirsRec


function(Mzcy_AddSubDirs path)
    # find dirs recurse
    file(GLOB children LIST_DIRECTORIES true ${CMAKE_CURRENT_SOURCE_DIR}/${path}/*)
    list(APPEND children "${CMAKE_CURRENT_SOURCE_DIR}/${path}")

    set(dirs "")
    # add sub-dir to dirs if CMakeLists.txt exist
    foreach(item ${children})
        if(IS_DIRECTORY ${item} AND EXISTS "${item}/CMakeLists.txt")
            list(APPEND dirs ${item})
        endif()
    endforeach()

    if(Mzcy_SHOW_DETAILS)
        message(STATUS ">> dirs: ${dirs}")
    endif()

    # goto sub-dir in dirs
    foreach(dir ${dirs})
        if(Mzcy_SHOW_DETAILS)
            message(STATUS ">> go to subdirectory: ${dir}")
        endif()
        add_subdirectory(${dir})
    endforeach()

endfunction() # Mzcy_AddSubDirsRec