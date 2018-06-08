FROM ububtu:16.04
RUN apt-get update && apt-get install -y subversion 
RUN svn co http://llvm.org/svn/llvm-project/llvm/trunk llvm && \
    cd llvm/tools && \
    svn co http://llvm.org/svn/llvm-project/cfe/trunk clang && \
    cd ../.. && \
    cd llvm/tools/clang/tools && \
    svn co http://llvm.org/svn/llvm-project/clang-tools-extra/trunk extra && \
    cd ../../../.. && \
    cd llvm/projects && \
    svn co http://llvm.org/svn/llvm-project/compiler-rt/trunk compiler-rt && \
    cd ../.. && \
    cd llvm/projects && \
    svn co http://llvm.org/svn/llvm-project/libcxx/trunk libcxx && \
    cd ../.. && \
    mkdir build && \
    cd build && \
    cmake -G "Unix Makefiles" ../llvm && \
    make -j24 
    
