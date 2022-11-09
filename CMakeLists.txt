cmake_minimum_required(VERSION 3.20)

# set(CMAKE_CXX_STANDARD 11)
# set(CMAKE_CXX_STANDARD_REQUIRED ON)
# set(CMAKE_CXX_EXTENSIONS OFF)

project("mingw64-winsdk-playground")

# Config mode means do not use CMake official configuration.
# Here i use my own "openssl-config.cmake"
# find_package(OpenSSL CONFIG REQUIRED)


if(${MINGW})
    message(STATUS "Using MINGW")
    # if(NOT WINDOWS_SDK_INCLUDE_DIR)
    #     get_filename_component(WINDOWS_SDK_ROOT_DIR
    #         "[HKEY_LOCAL_MACHINE\\SOFTWARE\\WOW6432Node\\Microsoft\\Windows Kits\\Installed Roots;KitsRoot10]" REALPATH)
    #     file(GLOB WINDOWS_SDK_INCS LIST_DIRECTORIES true "${WINDOWS_SDK_ROOT_DIR}/Include/10.0.*.*")
    #     list(SORT WINDOWS_SDK_INCS ORDER DESCENDING)
    #     list(GET WINDOWS_SDK_INCS 0 WINDOWS_SDK_INCLUDE_DIR)
    # endif()
    # if(NOT EXISTS ${WINDOWS_SDK_INCLUDE_DIR})
    #     message(FATAL_ERROR "Could not find the directory; ${WINDOWS_SDK_INCLUDE_DIR}."
    #         "You can fix by the cmake flag; -DWINDOWS_SDK_INCLUDE_DIR=<Path>")
    # endif()
    message(STATUS "Detected Windows SDK: ${WINDOWS_SDK_INCLUDE_DIR}")
endif()

SET(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -static")

add_executable(${PROJECT_NAME} 
    "src/main.cpp"
)

target_include_directories(${PROJECT_NAME} PRIVATE ${WINDOWS_SDK_INCLUDE_DIR})
target_link_libraries(${PROJECT_NAME} "${WINDOWS_SDK_LIBRARY_DIR}/libshcore.a")