# An external project for yaehmop
set(yaehmop_install_dir "${OpenChemistry_INSTALL_PREFIX}/bin")

if(NOT USE_SYSTEM_YAEHMOP)
  if(BUILD_YAEHMOP)
    # This does not work currently
    # Yaehmop depends on f2c or gfortran, with an optional dependency on
    # blas and lapack. This may be hard to do on windows.
    message(FATAL_ERROR "Yaehmop cannot currently be built here")
  else()
    # Need to use ExternalProject_Add
    set(yaehmop_download_dir "${CMAKE_CURRENT_BINARY_DIR}/yaehmop/bin")
    include(DownloadYaehmop)
    DownloadYaehmop("${yaehmop_download_dir}" "${yaehmop_install_dir}")
  endif()
endif()
