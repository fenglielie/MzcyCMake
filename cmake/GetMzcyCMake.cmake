# MzcyCMake

macro(GetMzcyCMake)
  include(FetchContent)
  set(MzcyCMake_VERSION 0.1)
  message(STATUS "find package: MzcyCMake ${MzcyCMake_VERSION}")
  find_package(MzcyCMake ${MzcyCMake_VERSION} QUIET)
  if(NOT MzcyCMake_FOUND)
    message(STATUS "MzcyCMake ${MzcyCMake_VERSION} not found")
    set(_address "https://github.com/fenglielie/MzcyCMake")
    message(STATUS "fetch: ${_address} with tag ${MzcyCMake_VERSION}")
    FetchContent_Declare(
      MzcyCMake
      GIT_REPOSITORY ${_address}
      GIT_TAG ${MzcyCMake_VERSION}
    )
    FetchContent_MakeAvailable(MzcyCMake)
    message(STATUS "MzcyCMake ${MzcyCMake_VERSION} build done")
  endif()
endmacro()