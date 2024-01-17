# STAT = -static --static
FLAG = -g0 -O2 -Wno-error

ifneq ($(NATIVE),)
COMMON_CONFIG += CC="$(HOST)-gcc ${STAT}" CXX="$(HOST)-g++ ${STAT}"
else
COMMON_CONFIG += CC="gcc ${STAT}" CXX="g++ ${STAT}"
endif

COMMON_CONFIG += --disable-gprofng CFLAGS="${FLAG}" CXXFLAGS="${FLAG}" FFLAGS="${FLAG}" LDFLAGS="-s ${STAT}"

# BINUTILS_CONFIG += --enable-gold=yes
GCC_CONFIG += --enable-default-pie --enable-static-pie --disable-cet
GCC_CONFIG += --disable-shared --enable-static
# GCC_CONFIG += --enable-shared --enable-static --disable-symvers

-include versions.mak
