cmake_minimum_required (VERSION 3.1)
project (intel-gemm)

find_package(OpenCL REQUIRED)

include_directories ("${PROJECT_SOURCE_DIR}/common")

add_executable(intel-gemm GEMM/cmdoptions.cpp GEMM/gemm.cpp common/basic.cpp common/cmdparser.cpp common/oclobject.cpp)

target_link_libraries(intel-gemm ${OpenCL_LIBRARY} )
install(TARGETS intel-gemm DESTINATION bin)

