cmake_minimum_required (VERSION 3.16)

project (plasmoid-widgetname)

find_package (ECM 1.4.0 REQUIRED NO_MODULE)
set (CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${ECM_MODULE_PATH})
enable_testing ()

find_package (ECM REQUIRED NO_MODULE)

set (CMAKE_MODULE_PATH ${ECM_MODULE_PATH} ${ECM_KDE_MODULE_DIR}
                       ${CMAKE_MODULE_PATH})
set (QML_IMPORT_PATH $ENV{QML2_IMPORT_PARTH})
set (CMAKE_INSTALL_PREFIX=/usr)

include (KDEInstallDirs)
include (KDECMakeSettings)
include (KDECompilerSettings NO_POLICY_SCOPE)

find_package (Qt5 REQUIRED COMPONENTS Qml Core)

find_package (KF5 REQUIRED COMPONENTS Plasma)

plasma_install_package (package com.github.zren.widgetname)

add_definitions (
  -DTRANSLATION_DOMAIN=\"plasma_applet_com.github.zren.widgetname\")

set (WIDGETNAMEPLUGIN_SRCS plugin/widgetitem.cpp plugin/widgetnameplugin.cpp)

add_library (widgetnameplugin SHARED ${WIDGETNAMEPLUGIN_SRCS})

target_include_directories (
  widgetnameplugin PRIVATE ${Qt5Core_INCLUDE_DIRS} ${Qt5Qml_INCLUDE_DIRS}
                           ${KF5Plasma_INCLUDE_DIRS})

target_link_libraries (widgetnameplugin Qt5::Core Qt5::Qml)

install (TARGETS widgetnameplugin
         DESTINATION ${KDE_INSTALL_QMLDIR}/com/github/zren/widgetname)
install (FILES plugin/qmldir
         DESTINATION ${KDE_INSTALL_QMLDIR}/com/github/zren/widgetname)
