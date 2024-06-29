.PHONY: all clean

# Check if g++ is available, if not, check if clang++ is available
CXX := $(shell command -v g++ 2>/dev/null)
ifeq ($(strip $(CXX)),)
    CXX := $(shell command -v clang++ 2>/dev/null)
endif

dest_dir := $(shell pwd)


all: 
	mkdir -p temp && \
	cd temp && \
	git clone --depth 1 --branch 2.3.4 https://github.com/accellera-official/systemc.git && \
	mkdir -p objdir && \
	cmake -DCMAKE_INSTALL_PREFIX="$(dest_dir)" -DCMAKE_CXX_STANDARD=14  ./systemc && \
	make install && \
	rm -rf ../temp