General Matrix Multiply Sample (originally by Intel)
====================================================

https://software.intel.com/en-us/articles/gemm

Build
-----
For running in PC, use standard cmake

For running in Android, use:
    (make sure your device have libOpenCL.so as it is not supported in AOSP
     the libOpenCL.so build here is only a stub for linking only. DO NOT USE in target device.
     The stube assume OpenCL in target device is v1.2, if using v1.1 change the include and stub filename
     in Android.mk)

    export NDK_PROJECT_PATH=.
    ndk-build NDK_APPLICATION_MK=./Application.mk

Usage
-----
To run, put GEMM/gemm.cl into the same folder of intel-gemm, then:

    $ ./intel-gemm -p 0 # select first available CL device 


