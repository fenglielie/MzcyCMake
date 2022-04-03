# MzcyCMake

message(STATUS ">> include MzcyFetchContent.cmake")

# 原本的过程
# FetchContent_Declare(hello
#         GIT_REPOSITORY https://gitee.com/fenglielie_ee/test_cmake.git
#         GIT_TAG main
#         SOURCE_DIR ${PROJECT_SOURCE_DIR}/remote/hello
#         )
# FetchContent_MakeAvailable(hello)
#
# 现在cmake函数简单封装一下
# Mzcy_FetchContent(
#         FC_NAME hello
#         FC_LINK https://gitee.com/fenglielie_ee/test_cmake.git
#       # FC_GIT_TAG main
#       # FC_SOURCE_DIR remote
#       )
include(FetchContent)


function(Mzcy_FetchContent)
    set(options)
    set(oneValueArgs FC_NAME FC_LINK FC_GIT_TAG FC_SOURCE_DIR)
    set(multiValueArgs)
    set(Mzcy_FC_PRE)
    cmake_parse_arguments(Mzcy_FC_PRE # none
        "${options}"
        "${oneValueArgs}"
        "${multiValueArgs}"
        ${ARGN}
        )

    # 补全缺省参数
    if(NOT Mzcy_FC_PRE_FC_GIT_TAG)
        set(Mzcy_FC_PRE_FC_GIT_TAG main)
    endif()
    if(NOT Mzcy_FC_PRE_FC_SOURCE_DIR)
        set(Mzcy_FC_PRE_FC_SOURCE_DIR remote)
    endif()

    # 确认这个目标存在依赖
    if(NOT Mzcy_${projectName}_have_dependencies)
        set(Mzcy_${Mzcy_FC_PRE_FC_NAME}_have_dependencies TRUEPARENT_SCOPE)
    endif()

    set(Mzcy_FC_PRE_FC_SOURCE_DIR ${PROJECT_SOURCE_DIR}/${Mzcy_FC_PRE_FC_SOURCE_DIR}/${Mzcy_FC_PRE_FC_NAME})

    message(STATUS ">> trying FetchContent: ${Mzcy_FC_PRE_FC_NAME}")
    message(STATUS ">> link: ${Mzcy_FC_PRE_FC_LINK}")
    message(STATUS ">> git_tag: ${Mzcy_FC_PRE_FC_GIT_TAG}")
    message(STATUS ">> source_dir: ${Mzcy_FC_PRE_FC_SOURCE_DIR}")

    FetchContent_Declare(${Mzcy_FC_PRE_FC_NAME}
        GIT_REPOSITORY ${Mzcy_FC_PRE_FC_LINK}
        GIT_TAG ${Mzcy_FC_PRE_FC_GIT_TAG}
        SOURCE_DIR ${Mzcy_FC_PRE_FC_SOURCE_DIR}
        )

    FetchContent_MakeAvailable(${Mzcy_FC_PRE_FC_NAME})

    message(STATUS ">> successfully FetchContent: ${Mzcy_FC_PRE_FC_NAME}")

endfunction()