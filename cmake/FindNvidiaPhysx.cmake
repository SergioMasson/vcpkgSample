set( CUSTOME_PHYSX_ROOT_DIR $ENV{PHYSX_PATH})
set( CUSTOME_PHYSX_INCLUDE_DIRS ${CUSTOME_PHYSX_ROOT_DIR}/include/)

if(NOT DEFINED ENV{PHYSX_PATH})
    message(FATAL_ERROR "Could not find a location for the nvidia Physx sdk. Please set the PHYSX_PATH envirorment variable.")
    # some more commands
endif()

message("Physx found at location: " ${CUSTOME_PHYSX_ROOT_DIR})

#defines the location of all Physx release dlls.
set( CUSTOME_PHYSX_IMPORTED_LOCATION
    ${CUSTOME_PHYSX_ROOT_DIR}/bin/PhysX_64.dll
	${CUSTOME_PHYSX_ROOT_DIR}/bin/PhysXCommon_64.dll
	${CUSTOME_PHYSX_ROOT_DIR}/bin/PhysXCooking_64.dll
	${CUSTOME_PHYSX_ROOT_DIR}/bin/PhysXFoundation_64.dll
)

#defines the location of all Physx debug dlls.
set( CUSTOME_PHYSX_IMPORTED_LOCATION_DEBUG
    ${CUSTOME_PHYSX_ROOT_DIR}/debug/bin/PhysX_64.dll
	${CUSTOME_PHYSX_ROOT_DIR}/debug/bin/PhysXCommon_64.dll
	${CUSTOME_PHYSX_ROOT_DIR}/debug/bin/PhysXCooking_64.dll
	${CUSTOME_PHYSX_ROOT_DIR}/debug/bin/PhysXFoundation_64.dll
)

set( CUSTOME_PHYSX_IMPORTED_IMPLIB
    ${CUSTOME_PHYSX_ROOT_DIR}/lib/LowLevel_static_64.lib
	${CUSTOME_PHYSX_ROOT_DIR}/lib/LowLevelAABB_static_64.lib
	${CUSTOME_PHYSX_ROOT_DIR}/lib/LowLevelDynamics_static_64.lib
	${CUSTOME_PHYSX_ROOT_DIR}/lib/PhysX_64.lib
	${CUSTOME_PHYSX_ROOT_DIR}/lib/PhysXCharacterKinematic_static_64.lib
	${CUSTOME_PHYSX_ROOT_DIR}/lib/PhysXCommon_64.lib
	${CUSTOME_PHYSX_ROOT_DIR}/lib/PhysXCooking_64.lib
	${CUSTOME_PHYSX_ROOT_DIR}/lib/PhysXExtensions_static_64.lib
    ${CUSTOME_PHYSX_ROOT_DIR}/lib/PhysXFoundation_64.lib
    ${CUSTOME_PHYSX_ROOT_DIR}/lib/PhysXPvdSDK_static_64.lib
    ${CUSTOME_PHYSX_ROOT_DIR}/lib/PhysXTask_static_64.lib
    ${CUSTOME_PHYSX_ROOT_DIR}/lib/PhysXVehicle_static_64.lib
    ${CUSTOME_PHYSX_ROOT_DIR}/lib/SceneQuery_static_64.lib
    ${CUSTOME_PHYSX_ROOT_DIR}/lib/SimulationController_static_64.lib
)

set( CUSTOME_PHYSX_IMPORTED_IMPLIB_DEBUG
    ${CUSTOME_PHYSX_ROOT_DIR}/debug/lib/LowLevel_static_64.lib
	${CUSTOME_PHYSX_ROOT_DIR}/debug/lib/LowLevelAABB_static_64.lib
	${CUSTOME_PHYSX_ROOT_DIR}/debug/lib/LowLevelDynamics_static_64.lib
	${CUSTOME_PHYSX_ROOT_DIR}/debug/lib/PhysX_64.lib
	${CUSTOME_PHYSX_ROOT_DIR}/debug/lib/PhysXCharacterKinematic_static_64.lib
	${CUSTOME_PHYSX_ROOT_DIR}/debug/lib/PhysXCommon_64.lib
	${CUSTOME_PHYSX_ROOT_DIR}/debug/lib/PhysXCooking_64.lib
	${CUSTOME_PHYSX_ROOT_DIR}/debug/lib/PhysXExtensions_static_64.lib
    ${CUSTOME_PHYSX_ROOT_DIR}/debug/lib/PhysXFoundation_64.lib
    ${CUSTOME_PHYSX_ROOT_DIR}/debug/lib/PhysXPvdSDK_static_64.lib
    ${CUSTOME_PHYSX_ROOT_DIR}/debug/lib/PhysXTask_static_64.lib
    ${CUSTOME_PHYSX_ROOT_DIR}/debug/lib/PhysXVehicle_static_64.lib
    ${CUSTOME_PHYSX_ROOT_DIR}/debug/lib/SceneQuery_static_64.lib
    ${CUSTOME_PHYSX_ROOT_DIR}/debug/lib/SimulationController_static_64.lib
)

#creates a target for the nvidia Physx library.
add_library(NvidiaPhysxLibrary SHARED IMPORTED)

#set target properties acording to the instalation of the nvidia library.
set_target_properties(NvidiaPhysxLibrary PROPERTIES
  IMPORTED_LOCATION ${CUSTOME_PHYSX_IMPORTED_LOCATION}
  IMPORTED_LOCATION_DEBUG ${CUSTOME_PHYSX_IMPORTED_LOCATION_DEBUG}
  IMPORTED_IMPLIB ${CUSTOME_PHYSX_IMPORTED_IMPLIB}
  IMPORTED_IMPLIB_DEBUG ${CUSTOME_PHYSX_IMPORTED_IMPLIB_DEBUG}
  INTERFACE_INCLUDE_DIRECTORIES ${CUSTOME_PHYSX_INCLUDE_DIRS}
  IMPORTED_CONFIGURATIONS "RELEASE;DEBUG"
)
