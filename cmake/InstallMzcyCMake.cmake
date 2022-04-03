include(GNUInstallDirs)

install(DIRECTORY ${PROJECT_SOURCE_DIR}/include
        DESTINATION ../include)

install(DIRECTORY ${PROJECT_SOURCE_DIR}/cmake
        DESTINATION ../cmake)


include(CMakePackageConfigHelpers)

write_basic_package_version_file(
        MzcyCMakeConfigVersion.cmake
        VERSION 0.1
        COMPATIBILITY AnyNewerVersion  # 表示该函数库向下兼容
)

install(FILES
"${CMAKE_CURRENT_BINARY_DIR}/MzcyCMakeConfigVersion.cmake"
DESTINATION ../cmake
)