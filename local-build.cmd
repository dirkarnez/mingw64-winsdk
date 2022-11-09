REM run as Administrator
@echo off
cd /d %~dp0
set DOWNLOADS_DIR=%USERPROFILE%\Downloads
set DOWNLOADS_DIR_LINUX=%DOWNLOADS_DIR:\=/%

SET PATH=^
%DOWNLOADS_DIR%\PortableGit\bin;^
%DOWNLOADS_DIR%\x86_64-8.1.0-release-posix-seh-rt_v6-rev0;^
%DOWNLOADS_DIR%\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\bin;^
%DOWNLOADS_DIR%\cmake-3.22.2-windows-x86_64\bin;

@REM set PATH=^
@REM D:\Softwares\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\mingw64;^
@REM D:\Softwares\x86_64-8.1.0-release-posix-seh-rt_v6-rev0\mingw64\bin;^
@REM D:\Softwares\cmake-3.23.0-rc1-windows-x86_64\bin;

set current_directory=%~dp0
set current_directory_linux=%current_directory:\=/%

rmdir build

cmake.exe -G"MinGW Makefiles" ^
-DCMAKE_BUILD_TYPE=Debug ^
-DWINDOWS_SDK_INCLUDE_DIR="%current_directory_linux%msys2-w32api/msys2-w32api-headers-10.0.0.r16.g49a56d453-1-x86_64.pkg.tar/msys2-w32api-headers-10.0.0.r16.g49a56d453-1-x86_64.pkg/usr/include/w32api" ^
-DWINDOWS_SDK_LIBRARY_DIR="%current_directory_linux%msys2-w32api/msys2-w32api-runtime-10.0.0.r16.g49a56d453-1-x86_64.pkg.tar/msys2-w32api-runtime-10.0.0.r16.g49a56d453-1-x86_64.pkg/usr/lib/w32api" ^
-B./build &&^
cd build &&^
cmake --build . &&^
echo "Successful build"
pause