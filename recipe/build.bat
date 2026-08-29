@echo off

SETLOCAL EnableExtensions DisableDelayedExpansion

if exist build rmdir /s /q build
mkdir build
cd build

cmake %SRC_DIR% %CMAKE_ARGS% ^
    -DBUILD_SHARED_LIBS=ON

cmake --build . --config Release -- /m:%CPU_COUNT%

cmake --build . --config Release --target install
