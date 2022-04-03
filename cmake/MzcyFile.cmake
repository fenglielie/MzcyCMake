# MzcyCMake

message(STATUS ">> include MzcyFile.cmake")

# 提供了递归和非递归的查找子文件的cmake函数
# 自动获取所有的.cpp .c .f90源文件，存到变量中返回
# Mzcy_GetFilesRec(files) 递归
# Mzcy_GetFiles(files) 非递归

# 进一步，直接PRIVATE添加源文件到target中
# Mzcy_AddFilesRec(targetname) 递归
# Mzcy_AddFiles(targetname) 非递归
# 并且把根目录下的include目录${Mzcy_RootInclude}, 加入private_include目录

function(Mzcy_GetFilesRec rst)
    file(GLOB_RECURSE rst_cpp_local ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp)
    file(GLOB_RECURSE rst_c_local ${CMAKE_CURRENT_SOURCE_DIR}/*.c)
    file(GLOB_RECURSE rst_f_local ${CMAKE_CURRENT_SOURCE_DIR}/*.f90)
    set(rst_all_local "")
    list(APPEND rst_all_local ${rst_cpp_local} ${rst_c_local} ${rst_f_local})
    set(${rst} ${rst_all_local} PARENT_SCOPE)
endfunction()

function(Mzcy_GetFiles rst)
    file(GLOB rst_cpp_local ${CMAKE_CURRENT_SOURCE_DIR}/*.cpp)
    file(GLOB rst_c_local ${CMAKE_CURRENT_SOURCE_DIR}/*.c)
    file(GLOB rst_f_local ${CMAKE_CURRENT_SOURCE_DIR}/*.f90)
    set(rst_all_local "")
    list(APPEND rst_all_local ${rst_cpp_local} ${rst_c_local} ${rst_f_local})
    set(${rst} ${rst_all_local} PARENT_SCOPE)
endfunction()


function(Mzcy_AddFilesRec target_name)
    set(files)
    Mzcy_GetFilesRec(files)
    target_sources(${target_name} PRIVATE ${files})
    target_include_directories(${target_name} PRIVATE ${Mzcy_RootInclude})
endfunction()

function(Mzcy_AddFiles target_name)
    set(files)
    Mzcy_GetFiles(files)
    target_sources(${target_name} PRIVATE ${files})
    target_include_directories(${target_name} PRIVATE ${Mzcy_RootInclude})
endfunction()