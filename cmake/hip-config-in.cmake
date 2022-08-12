cmake_minimum_required(VERSION 3.3)

@PACKAGE_INIT@
include(CheckCXXCompilerFlag)
include(CMakeFindDependencyMacro OPTIONAL RESULT_VARIABLE _CMakeFindDependencyMacro_FOUND)
if (NOT _CMakeFindDependencyMacro_FOUND)
  macro(find_dependency dep)
    if (NOT ${dep}_FOUND)
      set(cmake_fd_version)
      if (${ARGC} GREATER 1)
        set(cmake_fd_version ${ARGV1})
      endif()
      set(cmake_fd_exact_arg)
      if(${CMAKE_FIND_PACKAGE_NAME}_FIND_VERSION_EXACT)
        set(cmake_fd_exact_arg EXACT)
      endif()
      set(cmake_fd_quiet_arg)
      if(${CMAKE_FIND_PACKAGE_NAME}_FIND_QUIETLY)
        set(cmake_fd_quiet_arg QUIET)
      endif()
      set(cmake_fd_required_arg)
      if(${CMAKE_FIND_PACKAGE_NAME}_FIND_REQUIRED)
        set(cmake_fd_required_arg REQUIRED)
      endif()
      find_package(${dep} ${cmake_fd_version}
          ${cmake_fd_exact_arg}
          ${cmake_fd_quiet_arg}
          ${cmake_fd_required_arg}
      )
      string(TOUPPER ${dep} cmake_dep_upper)
      if (NOT ${dep}_FOUND AND NOT ${cmake_dep_upper}_FOUND)
        set(${CMAKE_FIND_PACKAGE_NAME}_NOT_FOUND_MESSAGE "${CMAKE_FIND_PACKAGE_NAME} could not be found because dependency ${dep} could not be found.")
        set(${CMAKE_FIND_PACKAGE_NAME}_FOUND False)
        return()
      endif()
      set(cmake_fd_version)
      set(cmake_fd_required_arg)
      set(cmake_fd_quiet_arg)
      set(cmake_fd_exact_arg)
    endif()
  endmacro()
endif()

set(_HIP_SHELL "SHELL:")
if(CMAKE_VERSION VERSION_LESS 3.12)
  set(_HIP_SHELL "")
endif()

function(hip_add_interface_compile_flags TARGET)
  set_property(TARGET ${TARGET} APPEND PROPERTY
    INTERFACE_COMPILE_OPTIONS "$<$<COMPILE_LANGUAGE:CXX>:${_HIP_SHELL}${ARGN}>"
  )
endfunction()

function(hip_add_interface_link_flags TARGET)
  if(CMAKE_VERSION VERSION_LESS 3.20)
    set_property(TARGET ${TARGET} APPEND PROPERTY
      INTERFACE_LINK_LIBRARIES "${ARGN}"
    )
  else()
    set_property(TARGET ${TARGET} APPEND PROPERTY
      INTERFACE_LINK_LIBRARIES "$<$<LINK_LANGUAGE:CXX>:${ARGN}>"
    )
  endif()
endfunction()

#Number of parallel jobs by default is 1
if(NOT DEFINED HIP_CLANG_NUM_PARALLEL_JOBS)
  set(HIP_CLANG_NUM_PARALLEL_JOBS 1)
endif()

if(WIN32)
  message(FATAL_ERROR "Windows not yet supported for CHIP-SPV")
endif()

set(HIP_PATH "@HIP_PATH@" CACHE PATH "Path to the CHIP-SPV installation")
set(HIP_COMPILER "@HIP_COMPILER@" CACHE STRING "C++ compiler")
set(HIP_RUNTIME "@HIP_RUNTIME@" CACHE STRING "" FORCE)
set(HIP_PLATFORM "@HIP_PLATFORM@" CACHE STRING "" FORCE)
set(HIP_ARCH "@HIP_ARCH@" CACHE STRING "" FORCE)
set(HIP_OFFLOAD_COMPILE_OPTIONS "@HIP_OFFLOAD_COMPILE_OPTIONS@" CACHE STRING "clang compiler variables for offload compilation")
set(HIP_OFFLOAD_LINK_OPTIONS "@HIP_OFFLOAD_LINK_OPTIONS@" CACHE STRING "HIP application linker options")
message(STATUS "hip-config.cmake CHIP-SPV:")
message(STATUS "HIP_PATH: ${HIP_PATH}")
message(STATUS "HIP_COMPILER: ${HIP_COMPILER}")
message(STATUS "HIP_RUNTIME: ${HIP_RUNTIME}")
message(STATUS "HIP_PLATFORM: ${HIP_PLATFORM}")
message(STATUS "HIP_ARCH: ${HIP_ARCH}")
message(STATUS "HIP_OFFLOAD_COMPILE_OPTIONS: ${HIP_OFFLOAD_COMPILE_OPTIONS}")
message(STATUS "HIP_OFFLOAD_LINK_OPTIONS: ${HIP_OFFLOAD_LINK_OPTIONS}")

set_and_check( hip_INCLUDE_DIR "@PACKAGE_INCLUDE_INSTALL_DIR@" )
set_and_check( hip_INCLUDE_DIRS "${hip_INCLUDE_DIR}" )
set_and_check( hip_LIB_INSTALL_DIR "@PACKAGE_LIB_INSTALL_DIR@" )
set_and_check( hip_BIN_INSTALL_DIR "@PACKAGE_BIN_INSTALL_DIR@" )
if(WIN32)
  #set_and_check(hip_HIPCC_EXECUTABLE "${hip_BIN_INSTALL_DIR}/hipcc.bat")
  #set_and_check(hip_HIPCONFIG_EXECUTABLE "${hip_BIN_INSTALL_DIR}/hipconfig.bat")
else()
  set_and_check(hip_HIPCC_EXECUTABLE "${hip_BIN_INSTALL_DIR}/hipcc")
  set_and_check(hip_HIPCONFIG_EXECUTABLE "${hip_BIN_INSTALL_DIR}/hipconfig")
endif()


# TODO check if hipcc CMAKE_CXX_COMPILER_ID is clang
# Make sure that the compiler is either clang, IntelLLVM, or hipcc
if((CMAKE_CXX_COMPILER_ID MATCHES "[Cc]lang") OR(CMAKE_CXX_COMPILER_ID MATCHES "IntelLLVM"))
  if(CMAKE_CXX_COMPILER_VERSION VERSION_LESS 8.0.0)
    message(FATAL_ERROR "this project requires clang >= 8.0")
  endif()

  if(CMAKE_CXX_COMPILER_VERSION VERSION_LESS 14.0.0)
    message(WARNING "Deprecated clang version '${CMAKE_CXX_COMPILER_VERSION}'. \
            Support for Clang < 14.0 will be discontinued in the future.")
  endif()
else()
  message(FATAL_ERROR "this project must be compiled with clang. CMAKE_CXX_COMPILER_ID = ${CMAKE_CXX_COMPILER_ID}")
endif()

if(NOT HIP_CXX_COMPILER)
  set(HIP_CXX_COMPILER ${CMAKE_CXX_COMPILER})
endif()

# # Get the clang git version
# if(HIP_CXX_COMPILER MATCHES ".*hipcc" OR HIP_CXX_COMPILER MATCHES ".*clang\\+\\+")
#   execute_process(COMMAND ${HIP_CXX_COMPILER} --version
#                   OUTPUT_STRIP_TRAILING_WHITESPACE
#                   OUTPUT_VARIABLE HIP_CXX_COMPILER_VERSION_OUTPUT)
#   # Capture the repo, branch and patch level details of the HIP CXX Compiler.
#   # Ex. clang version 13.0.0 (https://github.com/ROCm-Developer-Tools/HIP main 12345 COMMIT_HASH)
#   # HIP_CLANG_REPO: https://github.com/ROCm-Developer-Tools/HIP
#   # HIP_CLANG_BRANCH: main
#   # HIP_CLANG_PATCH_LEVEL: 12345
#   if(${HIP_CXX_COMPILER_VERSION_OUTPUT} MATCHES "clang version [0-9]+\\.[0-9]+\\.[0-9]+ \\(([^ \n]*) ([^ \n]*) ([^ \n]*)")
#     set(HIP_CLANG_REPO ${CMAKE_MATCH_1})
#     set(HIP_CLANG_BRANCH ${CMAKE_MATCH_2})
#     set(HIP_CLANG_PATCH_LEVEL ${CMAKE_MATCH_3})
#   endif()
# endif()

# if(HIP_CXX_COMPILER MATCHES ".*hipcc")
#   if(HIP_CXX_COMPILER_VERSION_OUTPUT MATCHES "InstalledDir:[ \t]*([^\n]*)")
#     get_filename_component(HIP_CLANG_ROOT "${CMAKE_MATCH_1}" DIRECTORY)
#   endif()
# elseif (HIP_CXX_COMPILER MATCHES ".*clang\\+\\+")
#   get_filename_component(_HIP_CLANG_REAL_PATH "${HIP_CXX_COMPILER}" REALPATH)
#   get_filename_component(_HIP_CLANG_BIN_PATH "${_HIP_CLANG_REAL_PATH}" DIRECTORY)
#   get_filename_component(HIP_CLANG_ROOT "${_HIP_CLANG_BIN_PATH}" DIRECTORY)
# endif()
# file(GLOB HIP_CLANG_INCLUDE_SEARCH_PATHS ${HIP_CLANG_ROOT}/lib/clang/*/include)
# find_path(HIP_CLANG_INCLUDE_PATH stddef.h
#     HINTS
#         ${HIP_CLANG_INCLUDE_SEARCH_PATHS}
#     NO_DEFAULT_PATH)

include( "${CMAKE_CURRENT_LIST_DIR}/hip-targets.cmake" )

#Using find_dependency to locate the dependency for the packages
#This makes the cmake generated file xxxx-targets to supply the linker libraries
# without worrying other transitive dependencies
if(NOT WIN32)
  find_dependency(Threads)
endif()

set( hip_LIBRARIES hip::host hip::device)
set( hip_LIBRARY ${hip_LIBRARIES})

set(HIP_INCLUDE_DIR ${hip_INCLUDE_DIR})
set(HIP_INCLUDE_DIRS ${hip_INCLUDE_DIRS})
set(HIP_LIB_INSTALL_DIR ${hip_LIB_INSTALL_DIR})
set(HIP_BIN_INSTALL_DIR ${hip_BIN_INSTALL_DIR})
set(HIP_LIBRARIES ${hip_LIBRARIES})
set(HIP_LIBRARY ${hip_LIBRARY})
set(HIP_HIPCC_EXECUTABLE ${hip_HIPCC_EXECUTABLE})
set(HIP_HIPCONFIG_EXECUTABLE ${hip_HIPCONFIG_EXECUTABLE})