TEMPLATE = lib
TARGET = ipc

CONFIG -= qt
CONFIG += c++1z # may be useless

msvc:QMAKE_CXXFLAGS += /std:c++17
else:QMAKE_CXXFLAGS += -std=gnu++1z

DEFINES += __IPC_LIBRARY__
DESTDIR = ../output

INCLUDEPATH += \
    ../include \
    ../src \
    ../src/platform

HEADERS += \
    ../include/export.h \
    ../include/shm.h \
    ../include/circ_elem_array.h \
    ../include/circ_queue.h \
    ../include/ipc.h \
    ../include/def.h \
    ../include/rw_lock.h \
    ../include/tls_pointer.h

SOURCES += \
    ../src/shm.cpp \
    ../src/ipc.cpp

unix {

SOURCES += \
    ../src/platform/shm_linux.cpp \
    ../src/platform/tls_pointer_linux.cpp

LIBS += -lrt

target.path = /usr/lib
INSTALLS += target

} # unix

else:win32 {

SOURCES += \
    ../src/platform/shm_win.cpp \
    ../src/platform/tls_pointer_win.cpp

LIBS += -lKernel32

} # else:win32
