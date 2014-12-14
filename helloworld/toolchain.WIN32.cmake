#//////////////////////////////////////////////////////////
#// This file contains parameters specific for MS Win and
#// Visual Studio.
#//////////////////////////////////////////////////////////


#---------------------------------------------------------
# Disable incremental linking
#---------------------------------------------------------
set(MSVC_INCREMENTAL_DEFAULT OFF)
set(CMAKE_EXE_LINKER_FLAGS_DEBUG "${CMAKE_EXE_LINKER_FLAGS_DEBUG} /INCREMENTAL:NO /MACHINE:X86 /WX /STACK:1048576")
set(CMAKE_SHARED_LINKER_FLAGS_DEBUG "${CMAKE_SHARED_LINKER_FLAGS_DEBUG} /INCREMENTAL:NO /MACHINE:X86 /WX /STACK:1048576")

#Add /DEBUG if you want a release build with debug information for use with remote debugging
set(CMAKE_EXE_LINKER_FLAGS_RELEASE "${CMAKE_EXE_LINKER_FLAGS_RELEASE} /INCREMENTAL:NO /MACHINE:X86 /WX /STACK:1048576")
set(CMAKE_SHARED_LINKER_FLAGS_RELEASE "${CMAKE_SHARED_LINKER_FLAGS_RELEASE} /INCREMENTAL:NO /MACHINE:X86 /WX /STACK:1048576")


#---------------------------------------------------------
# External lib declarations
# 
# if we define the libs here, it'll be available by
# any of the other CMakeLists.txt
#
# TODO: this may be more tedious with multiple platforms,
# need to see if there is a better way to do this
#---------------------------------------------------------

#---------------------------------------------------------
# Static Libs
#---------------------------------------------------------
#add_library(mylib STATIC IMPORTED)


#---------------------------------------------------------
# Shared Libs
#---------------------------------------------------------
#add_library(mylib SHARED IMPORTED)

#---------------------------------------------------------
# Library paths
#---------------------------------------------------------
#set_property(TARGET mylib PROPERTY IMPORTED_LOCATION_DEBUG ${OPENSSL_LIB}/mylibD.lib)
#set_property(TARGET mylib PROPERTY IMPORTED_LOCATION_RELEASE ${OPENSSL_LIB}/mylib.lib)
#set_property(TARGET mylib PROPERTY IMPORTED_IMPLIB_DEBUG ${OPENSSL_LIB}/mylibD.lib)
#set_property(TARGET mylib PROPERTY IMPORTED_IMPLIB_RELEASE ${OPENSSL_LIB}/mylib.lib)

#---------------------------------------------------------
# Default include paths

# These paths are added to the projects settings / makefile to indicate the
# location of referenced header files. All paths use the CMAKE_SOURCE_DIR
#---------------------------------------------------------
set(INCLUDE_PATHS
"${CMAKE_SOURCE_DIR}/src"
)

#---------------------------------------------------------
# Default project variable declarations
#---------------------------------------------------------
if(BUILD_SHARED_LIBS)
    set(STATIC_DEFINITIONS "")
else()
    set(STATIC_DEFINITIONS "-D_LIB")
endif()

set(DEFAULT_DEFINITIONS "-D_WIN32 -DWIN32_LEAN_AND_MEAN")
set(DEFAULT_CXX_FLAGS_DEBUG "${STATIC_DEFINITIONS} /Gm")
set(DEFAULT_CXX_FLAGS_RELEASE "${STATIC_DEFINITIONS}")

#---------------------------------------------------------
# Project specific definitions
#---------------------------------------------------------
set(HELLOWORLD_INCLUDE_PATHS "")
set(HELLOWORLD_DEFINITIONS "-D_CONSOLE -D_CRT_SECURE_NO_WARNINGS -D_SCL_SECURE_NO_WARNINGS -DHELLOWORLD_EXPORTS")
set(HELLOWORLD_LINK_LIBRARIES)
set(HELLOWORLD_POST_BUILD)

set(TESTAPP_INCLUDE_PATHS "")
set(TESTAPP_DEFINITIONS "-D_CONSOLE -D_CRT_SECURE_NO_WARNINGS -D_SCL_SECURE_NO_WARNINGS")
#set(TESTAPP_LINK_LIBRARIES HelloWorld)
set(TESTAPP_POST_BUILD)