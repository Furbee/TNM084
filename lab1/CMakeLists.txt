cmake_minimum_required(VERSION 3.3)
project(TNM084_lab1_C)

set(CMAKE_CXX_STANDARD 11)

find_package(OpenGL REQUIRED)

set(GLFW_SOURCE_DIR "GLFW")

include_directories(
        ${GLFW_SOURCE_DIR}
        ${OPENGL_INCLUDE_DIRS})

set(SOURCE_FILES
        cellular.c
        cellular.h
        noise1234.c
        noise1234.h
        simplexnoise1234.c
        simplexnoise1234.h
        SWshading.c
        SWshading.layout
        tnm084_lab1.c
        tnm084_lab1.h
        triangleSoup.c
        triangleSoup.h
      )

add_executable(TNM084_lab1_C ${SOURCE_FILES})
target_link_libraries("TNM084_lab1_C" glfw ${OPENGL_LIBRARIES} ${GLFW_LIBRARIES})