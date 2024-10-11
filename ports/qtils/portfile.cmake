vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO ReEnvision-AI/qtils
    REF "${VERSION}"
    SHA512 bb5a3c5c564763fed653fe4b60dfbe8265836be14df989616d9aa359d7251425261f9d96200090e6c2c83dd07f965e10c033ec5de6e3fa38c68ecd9253f725b2
    HEAD_REF main
)


vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()

vcpkg_cmake_config_fixup(PACKAGE_NAME qtils)

vcpkg_fixup_pkgconfig()

if(VCPKG_TARGET_IS_WINDOWS)
    file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug")
endif()

file(INSTALL "${SOURCE_PATH}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)