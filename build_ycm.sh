#!
#!/bin/bash

rm ~/ymd_build -rf
mkdir ~/ycm_build && cd ~/ycm_build
cmake -G "Unix Makefiles" -DPYTHON_INCLUDE_DIR=/usr/local/include/python2.7 -DPYTHON_LIBRARY=/usr/local/lib/libpython2.7.so . ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
make ycm_support_libs
