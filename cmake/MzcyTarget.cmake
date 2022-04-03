# MzcyCMake

message(STATUS ">> include MzcyTarget.cmake")

# 包含两个cmake函数
# Mzcy_SimpleExe(target_name)
# Mzcy_SimpleLib(target_name)
# 依赖MzcyFile.cmake

# 简单的可执行文件/简单的静态库
# private包含当前文件夹的所有源代码, 非递归
# private使用根目录下的include文件夹

function(Mzcy_SimpleExe target_name)
    add_executable(${target_name})
    Mzcy_AddFiles(${target_name})
endfunction()

function(Mzcy_SimpleLib target_name)
    add_library(${target_name} STATIC)
    Mzcy_AddFiles(${target_name})
endfunction()