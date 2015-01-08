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
#add_library(pocofoundation STATIC IMPORTED)


#---------------------------------------------------------
# Shared Libs
#---------------------------------------------------------
add_library(pocofoundation SHARED IMPORTED)

#---------------------------------------------------------
# Library paths
#---------------------------------------------------------
if (MSVC10)
 set(POCO_LIB_DIR "${CMAKE_SOURCE_DIR}/src/3PC/poco1.6.0/lib/vs2010")
endif() 

set_property(TARGET pocofoundation PROPERTY IMPORTED_LOCATION_DEBUG ${POCO_LIB_DIR}/PocoFoundationd.lib)
set_property(TARGET pocofoundation PROPERTY IMPORTED_LOCATION_RELEASE ${POCO_LIB_DIR}/PocoFoundation.lib)
set_property(TARGET pocofoundation PROPERTY IMPORTED_IMPLIB_DEBUG ${POCO_LIB_DIR}/PocoFoundationd.lib)
set_property(TARGET pocofoundation PROPERTY IMPORTED_IMPLIB_RELEASE ${POCO_LIB_DIR}/PocoFoundation.lib)

#---------------------------------------------------------
# Default include paths

# These paths are added to the projects settings / makefile to indicate the
# location of referenced header files. All paths use the CMAKE_SOURCE_DIR
#---------------------------------------------------------
set(INCLUDE_PATHS
"${CMAKE_SOURCE_DIR}/src"
)

set(POCO_INCLUDE_PATH "${CMAKE_SOURCE_DIR}/src/3PC/poco1.6.0/include")

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

#we are setting the lib here to make the cmake project file in HelloWorld consist with what we are doing on the linux side
set(HELLOWORLD_LINK_LIBRARIES pocofoundation)
set(HELLOWORLD_POST_BUILD)

set(TESTAPP_INCLUDE_PATHS "")
set(TESTAPP_DEFINITIONS "-D_CONSOLE -D_CRT_SECURE_NO_WARNINGS -D_SCL_SECURE_NO_WARNINGS")
#set(TESTAPP_LINK_LIBRARIES HelloWorld)
set(TESTAPP_POST_BUILD)