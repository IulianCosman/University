# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\L5_Teambcc_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\L5_Teambcc_autogen.dir\\ParseCache.txt"
  "L5_Teambcc_autogen"
  )
endif()
