cmake_minimum_required(VERSION 3.2)

######## Project settings ########
project(azscfgsto)
set(LICENSE "MIT")

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fPIC -fvisibility=hidden")

######## Primary target ########
add_library(azscfgsto STATIC ${CMAKE_CURRENT_SOURCE_DIR}/src/config_store.c)

target_include_directories(azscfgsto
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/inc
)

######## Install targets ########
install(TARGETS azscfgsto
    LIBRARY DESTINATION lib
    ARCHIVE DESTINATION lib)

install(FILES inc/config_store.h DESTINATION include)
