Quantized Convolution (strip) for ZYBO-Z7
=========================================

Quantized Convolution (strip) binary and project and test code for ZYBO-Z7.

Quantized Convolution is a convolution method published by LeapMind Inc(https://leapmind.io) on Blueoil(https://github.com/blue-oil/blueoil).

### Requirement

* Board: ZYBO-Z7
* OS:
   + ~~[FPGA-SoC-Linux](https://github.com/ikwzm/FPGA-SoC-Linux.git)~~
   + [FPGA-SoC-Debian12](https://github.com/ikwzm/FPGA-SoC-Debian12.git)
   + [FPGA-SoC-Debian13](https://github.com/ikwzm/FPGA-SoC-Debian13.git)

## Install

### Install FPGA-SoC-Linux

See https://github.com/ikwzm/FPGA-SoC-Linux

### Boot ZynqMP-FPGA-Linux

### Expand the CMA area

Add ```cma=64M``` to linux_boot_args_cma in /mnt/boot/uEnv.txt

```
########################################################################
# Linux Boot Argments
#  * linux_boot_args_console : ex) console=tty1
#                                  console=ttyPS0,115200
#  * linux_boot_args_rootfs  : ex) root=/dev/mmcblk0p2 rw rootwait
#  * linux_boot_args_systemd : ex) systemd.unit=graphical.target
#                                  systemd.unit=multi-user.target
#  * linux_boot_args_cpuidle : ex) cpuidle.off=1
#  * linux_boot_args_cma     : ex) cma=256M
#  * linux_boot_args_uio     : ex) uio=uio_pdrv_genirq.of_id=generic-uio
#  * linux_boot_args_other   :
########################################################################
linux_boot_args_console=console=ttyPS0,115200
linux_boot_args_rootfs=root=/dev/mmcblk0p2 rw rootwait
linux_boot_args_systemd=
linux_boot_args_cpuidle=
linux_boot_args_cma=cma=64M
linux_boot_args_uio=uio_pdrv_genirq.of_id=generic-uio
linux_boot_args_other=
```

### Reboot FPGA-SoC-Linux

### Login fpga user

### Download QCONV-STRIP-ZYBO-Z7 to ZYBO-Z7

```console
fpga@debian-fpga:~/$ git clone https://github.com/ikwzm/QCONV-STRIP-ZYBO-Z7.git
fpga@debian-fpga:~/$ cd QCONV-STRIP-ZYBO-Z7
```

### Install FPGA Bitstream file

```console
fpga@debian-fpga:~/QCONV-STRIP-ZYBO-Z7$ sudo rake install
dtbocfg.rb --install qconv_strip --dts qconv_strip_axi3_6.12.dts
<stdin>:26.20-31.20: Warning (unit_address_vs_reg): /fragment@1/[ 3289.221739] fpga_manager fpga0: writing qconv_strip_axi3.bin to Xilinx Zynq FPGA Manager
__overlay__/uio_qconv_strip: node has a reg or ranges property, but no unit name
<stdin>:10.13-57.5: Warning (avoid_unnecessary_addr_size): /fragment@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
[ 3289.523895] OF: overlay: WARNING: memory leak will occur if overlay removed, property: /axi/fpga-region0/firmware-name
[ 3289.538944] fclkcfg axi:fclk0: driver version : 1.9.0
[ 3289.544017] fclkcfg axi:fclk0: device name    : axi:fclk0
[ 3289.554765] fclkcfg axi:fclk0: clock  name    : fclk0
[ 3289.563066] fclkcfg axi:fclk0: clock  rate    : 99999999
[ 3289.570730] fclkcfg axi:fclk0: clock  enabled : 1
[ 3289.575478] fclkcfg axi:fclk0: remove rate    : 1000000
[ 3289.580801] fclkcfg axi:fclk0: remove enable  : 0
[ 3289.585513] fclkcfg axi:fclk0: driver installed.
[ 3289.629641] u-dma-buf udmabuf-qconv-in: driver version = 5.3.0
[ 3289.635503] u-dma-buf udmabuf-qconv-in: major number   = 243
[ 3289.641251] u-dma-buf udmabuf-qconv-in: minor number   = 0
[ 3289.646750] u-dma-buf udmabuf-qconv-in: phys address   = 0x3c100000
[ 3289.653067] u-dma-buf udmabuf-qconv-in: buffer size    = 4194304
[ 3289.659128] u-dma-buf axi:udmabuf_qconv_in: driver installed.
[ 3289.718549] u-dma-buf udmabuf-qconv-out: driver version = 5.3.0
[ 3289.724490] u-dma-buf udmabuf-qconv-out: major number   = 243
[ 3289.730292] u-dma-buf udmabuf-qconv-out: minor number   = 1
[ 3289.735876] u-dma-buf udmabuf-qconv-out: phys address   = 0x3c500000
[ 3289.742278] u-dma-buf udmabuf-qconv-out: buffer size    = 8388608
[ 3289.748431] u-dma-buf axi:udmabuf_qconv_out: driver installed.
[ 3289.778432] u-dma-buf udmabuf-qconv-k: driver version = 5.3.0
[ 3289.784199] u-dma-buf udmabuf-qconv-k: major number   = 243
[ 3289.789841] u-dma-buf udmabuf-qconv-k: minor number   = 2
[ 3289.795248] u-dma-buf udmabuf-qconv-k: phys address   = 0x3cd00000
[ 3289.801485] u-dma-buf udmabuf-qconv-k: buffer size    = 4194304
[ 3289.807418] u-dma-buf axi:udmabuf_qconv_k: driver installed.
[ 3289.820961] u-dma-buf udmabuf-qconv-th: driver version = 5.3.0
[ 3289.826839] u-dma-buf udmabuf-qconv-th: major number   = 243
[ 3289.835813] u-dma-buf udmabuf-qconv-th: minor number   = 3
[ 3289.841453] u-dma-buf udmabuf-qconv-th: phys address   = 0x3c050000
[ 3289.847736] u-dma-buf udmabuf-qconv-th: buffer size    = 65536
[ 3289.853649] u-dma-buf axi:udmabuf_qconv_th: driver installed.
```

### Run Unit Test

```console
fpga@debian-fpga:~/QCONV-STRIP-ZYBO-Z7$ rake unit_test2_all
./unit_test -iw 160 -ih 160 -ic 64 -oc 32 -kw 1 -kh 1 -th 1 random
FPGA exec time (160x160x64x32 1x1): 3444 [usec]
[qconv_strip] test success!!!
./unit_test -iw 160 -ih 160 -ic 32 -oc 8 -kw 3 -kh 3 -th 1 random
FPGA exec time (160x160x32x8 3x3): 898 [usec]
[qconv_strip] test success!!!
./unit_test -iw 80 -ih 80 -ic 32 -oc 16 -kw 3 -kh 3 -th 1 random
FPGA exec time (80x80x32x16 3x3): 454 [usec]
[qconv_strip] test success!!!
./unit_test -iw 40 -ih 40 -ic 64 -oc 32 -kw 3 -kh 3 -th 1 random
FPGA exec time (40x40x64x32 3x3): 241 [usec]
[qconv_strip] test success!!!
./unit_test -iw 20 -ih 20 -ic 128 -oc 64 -kw 3 -kh 3 -th 1 random
FPGA exec time (20x20x128x64 3x3): 171 [usec]
[qconv_strip] test success!!!
./unit_test -iw 10 -ih 10 -ic 256 -oc 128 -kw 3 -kh 3 -th 1 random
FPGA exec time (10x10x256x128 3x3): 242 [usec]
[qconv_strip] test success!!!
./unit_test -iw 5 -ih 5 -ic 512 -oc 128 -kw 3 -kh 3 -th 1 random
FPGA exec time (5x5x512x128 3x3): 273 [usec]
[qconv_strip] test success!!!
./unit_test -iw 5 -ih 5 -ic 128 -oc 256 -kw 3 -kh 3 -th 1 random
FPGA exec time (5x5x128x256 3x3): 144 [usec]
[qconv_strip] test success!!!
./unit_test -iw 10 -ih 10 -ic 128 -oc 32 -kw 1 -kh 1 -th 1 random
FPGA exec time (10x10x128x32 1x1): 31 [usec]
[qconv_strip] test success!!!
./unit_test -iw 20 -ih 20 -ic 64 -oc 16 -kw 1 -kh 1 -th 1 random
FPGA exec time (20x20x64x16 1x1): 46 [usec]
[qconv_strip] test success!!!
./unit_test -iw 40 -ih 40 -ic 32 -oc 4 -kw 1 -kh 1 -th 1 random
FPGA exec time (40x40x32x4 1x1): 52 [usec]
[qconv_strip] test success!!!
./unit_test -iw 5 -ih 5 -ic 1024 -oc 256 -kw 3 -kh 3 -th 1 random
FPGA exec time (5x5x1024x256 3x3): 1178 [usec]
[qconv_strip] test success!!!
./unit_test -iw 5 -ih 5 -ic 256 -oc 128 -kw 3 -kh 3 -th 1 random
FPGA exec time (5x5x256x128 3x3): 145 [usec]
[qconv_strip] test success!!!
./unit_test -iw 5 -ih 5 -ic 128 -oc 256 -kw 3 -kh 3 -th 1 random
FPGA exec time (5x5x128x256 3x3): 145 [usec]
[qconv_strip] test success!!!
./unit_test -iw 5 -ih 5 -ic 256 -oc 128 -kw 3 -kh 3 -th 1 random
FPGA exec time (5x5x256x128 3x3): 143 [usec]
[qconv_strip] test success!!!
./unit_test -iw 5 -ih 5 -ic 128 -oc 256 -kw 3 -kh 3 -th 1 random
FPGA exec time (5x5x128x256 3x3): 144 [usec]
[qconv_strip] test success!!!
```

## Uninstall

### Uninstall Device Tree

```console
fpga@debian-fpga:~/QCONV-STRIP-ZYBO-Z7$ rake uninstall
dtbocfg.rb --remove qconv_strip
[ 3445.973324] u-dma-buf axi:udmabuf_qconv_th: driver removed.
[ 3445.981475] u-dma-buf axi:udmabuf_qconv_k: driver removed.
[ 3445.993870] u-dma-buf axi:udmabuf_qconv_out: driver removed.
[ 3446.002747] u-dma-buf axi:udmabuf_qconv_in: driver removed.
[ 3446.026110] fclkcfg axi:fclk0: driver removed.
```

## Build Bitstream file

### Requirement

* Xilinx Vivado 2018.3

### Download QCONV-STRIP-ZYBO-Z7

```console
shell$ git clone https://github.com/ikwzm/QCONV-STRIP-ZYBO-Z7.git
shell$ cd QCONV-STRIP-ZYBO-Z7
shell$ git submodule update --init --recursive
```

### Build qconv_strip_axi3.bin

#### Download QCONV-STRIP-ZYBO-Z7

```console
shell$ git clone https://github.com/ikwzm/QCONV-STRIP-ZYBO-Z7.git
shell$ cd QCONV-STRIP-ZYBO-Z7
shell$ git submodule update --init --recursive
```

#### Create Project

```
Vivado > Tools > Run Tcl Script > project/create_project.tcl
```

#### Implementation

```
Vivado > Tools > Run Tcl Script > project/implementation.tcl
```

#### Convert from Bitstream File to Binary File

```
shell$ tools/fpga-bit-to-bin.py --flip project/project.runs/impl_1/design_1_wrapper.bit qconv_strip_axi3.bin
```

## Licensing

Distributed under the BSD 2-Clause License.

