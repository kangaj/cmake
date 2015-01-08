#!/bin/sh
echo -------------------------------------
echo Generating Eclipse CDT4 project
echo -------------------------------------

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
CMAKE_CMD=/opt/cmake-3.0.2-Linux-i386/bin/cmake

CMAKE_GENERATOR="Eclipse CDT4 - Unix Makefiles"

ROOT_BUILD_PATH=$DIR/output_gcc_linux_x86

mkdir -p $ROOT_BUILD_PATH
cd $ROOT_BUILD_PATH

TOOLCHAIN=-DINCLUDE_PATH=$DIR/toolchain.EclipseCDT.cmake
echo $TOOLCHAIN
echo ....
echo $CMAKE_CMD -G "$CMAKE_GENERATOR" $TOOLCHAIN $DIR
$CMAKE_CMD -G "$CMAKE_GENERATOR" $TOOLCHAIN $DIR

cd $DIR
exit 0
