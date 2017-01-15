cmake_minimum_required(VERSION 3.2)
project(sip_webrtc_client VERSION 0.0.0 LANGUAGES C CXX)

set(CMAKE_VERBOSE_MAKEFILE ON)
message("building SWC sip_webrtc_client")

set(ROOT_DIR ".")
set(SWC_SRC_DIR "${ROOT_DIR}/src")


include_directories(${ROOT_DIR}/pjsua/pjmedia/include)
include_directories(${ROOT_DIR}/pjsua/pjsip/include)
include_directories(${ROOT_DIR}/pjsua/pjlib/include)
include_directories(${ROOT_DIR}/pjsua/pjnath/include)
include_directories(${ROOT_DIR}/pjsua/pjlib-util/include)

set(SWC_SRCS
	${SWC_SRC_DIR}/main.c
)

set(SOURCE_FILES ${SWC_SRCS} ${PJSIP_UA_SRCS})

add_executable(swc ${SOURCE_FILES})

# PJSIP
set(CMAKE_LIBRARY_PATH
	"${ROOT_DIR}/pjsua/pjsip/lib"
	"${ROOT_DIR}/pjsua/pjnath/lib"
	"${ROOT_DIR}/pjsua/pjlib/lib"
	"${ROOT_DIR}/pjsua/media/lib"
	"${ROOT_DIR}/pjsua/pjlib-util/lib"
)
execute_process(COMMAND "./pjsua/config.guess" OUTPUT_VARIABLE AC_SYSTEM)
string(STRIP ${AC_SYSTEM} AC_SYSTEM)
message("AC_SYSTEM : [${AC_SYSTEM}]")
target_link_libraries(swc
	#	pjsua2-${AC_SYSTEM}
	#	stdc++
	#	pjsua-${AC_SYSTEM}
	# pjsip-ua-${AC_SYSTEM}
	# pjsip-simple-${AC_SYSTEM}
	pjsip-${AC_SYSTEM}
	#	pjmedia-codec-${AC_SYSTEM}
	#	pjmedia-${AC_SYSTEM}
	#	pjmedia-videodev-${AC_SYSTEM}
	#	pjmedia-audiodev-${AC_SYSTEM}
	#	pjmedia-${AC_SYSTEM}
	#	pjnath-${AC_SYSTEM}
	pjlib-util-${AC_SYSTEM}
	pj-${AC_SYSTEM}
	pthread
	m
)
# /usr/local/lib/libpjsip-
# libpjsip-simple-x86_64-unknown-linux-gnu.a  libpjsip-ua-x86_64-unknown-linux-gnu.a      libpjsip-x86_64-unknown-linux-gnu.a


# include_directories(${ROOT_DIR}/pjsua/pjsip/include)
# set(PJLIB_SRC_DIR "${ROOT_DIR}/pjsua/pjlib/src/pj")
# set(PJSIP_UA_SRC_DIR "${ROOT_DIR}/pjsua/pjsip/src/pjsip-ua")
# set(PJSIP_UA_SRCS
#	${PJSIP_UA_SRC_DIR}/sip_inv.c
#)

