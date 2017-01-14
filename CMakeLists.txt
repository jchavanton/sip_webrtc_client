cmake_minimum_required(VERSION 3.2)
project(sip_webrtc_client VERSION 0.0.0 LANGUAGES C CXX)

set(CMAKE_VERBOSE_MAKEFILE ON)
message("building SWC sip_webrtc_client")

set(ROOT_DIR ".")
set(SWC_SRC_DIR "${ROOT_DIR}/src")
set(PJLIB_SRC_DIR "${ROOT_DIR}/pjsua/pjlib/src/pj")

# pjsua/pjlib/src/pj/os_core_linux_kernel.c

set(PJSIP_SRCS
	${PJLIB_SRC_DIR}/os_core_linux_kernel.c
)

set(SWC_SRCS
	${SWC_SRC_DIR}/main.c
)

include_directories(${ROOT_DIR}/pjsua/pjsip/include)

set(SOURCE_FILES ${SWC_SRCS} ${PJSIP_SRCS})

add_executable(swc ${SOURCE_FILES})
