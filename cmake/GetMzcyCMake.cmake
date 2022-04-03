# MzcyCMake

macro(GetMzcyCMake)
  include(FetchContent)
  message(STATUS "find package: MzcyCMake ")
  find_package(MzcyCMake)
  if(NOT MzcyCMake_FOUND)
    message(STATUS "MzcyCMake not found")
    set(_address "https://gitee.com/fenglielie_ee/MzcyCMake")
    message(STATUS "fetch: ${_address} with tag main")
    FetchContent_Declare(
      MzcyCMake
      GIT_REPOSITORY ${_address}
      GIT_TAG main
      SOURCE_DIR ${PROJECT_SOURCE_DIR}/MzcyCMake
    )
    FetchContent_MakeAvailable(MzcyCMake)
    message(STATUS "MzcyCMake  build done")
  endif()
endmacro()