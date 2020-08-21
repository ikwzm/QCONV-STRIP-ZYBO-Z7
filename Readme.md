Quantized Convolution (strip) for ZYBO-Z7
=========================================

Quantized Convolution (strip) binary and project and test code for ZYBO-Z7.

Quantized Convolution is a convolution method published by LeapMind Inc(https://leapmind.io) on Blueoil(https://github.com/blue-oil/blueoil).

### Requirement

* Board: ZYBO-Z7
* OS: https://github.com/ikwzm/FPGA-SoC-Linux

## Install

### Install FPGA-SoC-Linux

See https://github.com/ikwzm/FPGA-SoC-Linux

### Boot ZynqMP-FPGA-Linux

### Expand the CMA area

Add ```cma=256M``` to linux_boot_args_cma in /mnt/boot/uEnv.txt

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
linux_boot_args_cma=cma=256M
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
cp qconv_strip_axi3.bin /lib/firmware/qconv_strip_axi3.bin
dtbocfg.rb --install qconv_strip --dts qconv_strip_axi3_5.4.dts
<stdin>:26.20-31.20: Warning (unit_address_vs_reg): /fragment@1/__overlay__/uio_qconv_strip: node has a reg or ranges property, but no unit name
<stdin>:10.13-57.5: Warning (avoid_unnecessary_addr_size): /fragment@1: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
[  436.805790] fpga_manager fpga0: writing qconv_strip_axi3.bin to Xilinx Zynq FPGA Manager
[  436.882846] OF: overlay: WARNING: memory leak will occur if overlay removed, property: /amba/fpga-region0/firmware-name
[  436.896755] fclkcfg amba:fclk0: driver version : 1.7.2
[  436.903441] fclkcfg amba:fclk0: device name    : amba:fclk0
[  436.909033] fclkcfg amba:fclk0: clock  name    : fclk0
[  436.914326] fclkcfg amba:fclk0: clock  rate    : 99999999
[  436.919720] fclkcfg amba:fclk0: clock  enabled : 1
[  436.924598] fclkcfg amba:fclk0: remove rate    : 1000000
[  436.929909] fclkcfg amba:fclk0: remove enable  : 0
[  436.934765] fclkcfg amba:fclk0: driver installed.
[  436.968053] u-dma-buf udmabuf-qconv-in: driver version = 3.2.2
[  436.973934] u-dma-buf udmabuf-qconv-in: major number   = 244
[  436.979584] u-dma-buf udmabuf-qconv-in: minor number   = 0
[  436.985124] u-dma-buf udmabuf-qconv-in: phys address   = 0x30100000
[  436.991431] u-dma-buf udmabuf-qconv-in: buffer size    = 4194304
[  436.997431] u-dma-buf amba:udmabuf_qconv_in: driver installed.
[  437.036730] u-dma-buf udmabuf-qconv-out: driver version = 3.2.2
[  437.042716] u-dma-buf udmabuf-qconv-out: major number   = 244
[  437.048460] u-dma-buf udmabuf-qconv-out: minor number   = 1
[  437.054085] u-dma-buf udmabuf-qconv-out: phys address   = 0x30500000
[  437.060439] u-dma-buf udmabuf-qconv-out: buffer size    = 8388608
[  437.066582] u-dma-buf amba:udmabuf_qconv_out: driver installed.
[  437.102665] u-dma-buf udmabuf-qconv-k: driver version = 3.2.2
[  437.108415] u-dma-buf udmabuf-qconv-k: major number   = 244
[  437.114040] u-dma-buf udmabuf-qconv-k: minor number   = 2
[  437.119438] u-dma-buf udmabuf-qconv-k: phys address   = 0x30d00000
[  437.125655] u-dma-buf udmabuf-qconv-k: buffer size    = 4194304
[  437.131614] u-dma-buf amba:udmabuf_qconv_k: driver installed.
[  437.142001] u-dma-buf udmabuf-qconv-th: driver version = 3.2.2
[  437.147832] u-dma-buf udmabuf-qconv-th: major number   = 244
[  437.153612] u-dma-buf udmabuf-qconv-th: minor number   = 3
[  437.159097] u-dma-buf udmabuf-qconv-th: phys address   = 0x30050000
[  437.165422] u-dma-buf udmabuf-qconv-th: buffer size    = 65536
[  437.171337] u-dma-buf amba:udmabuf_qconv_th: driver installed.
```

### Run Unit Test

```console
fpga@debian-fpga:~/QCONV-STRIP-ZYBO-Z7$ rake unit_test2_all
./unit_test -iw 160 -ih 160 -ic 64 -oc 32 -kw 1 -kh 1 -th 1 random
FPGA exec time (160x160x64x32 1x1): 3440 [usec]
[qconv_strip] test success!!!
./unit_test -iw 160 -ih 160 -ic 32 -oc 8 -kw 3 -kh 3 -th 1 random
FPGA exec time (160x160x32x8 3x3): 895 [usec]
[qconv_strip] test success!!!
./unit_test -iw 80 -ih 80 -ic 32 -oc 16 -kw 3 -kh 3 -th 1 random
FPGA exec time (80x80x32x16 3x3): 452 [usec]
[qconv_strip] test success!!!
./unit_test -iw 40 -ih 40 -ic 64 -oc 32 -kw 3 -kh 3 -th 1 random
FPGA exec time (40x40x64x32 3x3): 242 [usec]
[qconv_strip] test success!!!
./unit_test -iw 20 -ih 20 -ic 128 -oc 64 -kw 3 -kh 3 -th 1 random
FPGA exec time (20x20x128x64 3x3): 173 [usec]
[qconv_strip] test success!!!
./unit_test -iw 10 -ih 10 -ic 256 -oc 128 -kw 3 -kh 3 -th 1 random
FPGA exec time (10x10x256x128 3x3): 237 [usec]
[qconv_strip] test success!!!
./unit_test -iw 5 -ih 5 -ic 512 -oc 128 -kw 3 -kh 3 -th 1 random
FPGA exec time (5x5x512x128 3x3): 278 [usec]
[qconv_strip] test success!!!
./unit_test -iw 5 -ih 5 -ic 128 -oc 256 -kw 3 -kh 3 -th 1 random
FPGA exec time (5x5x128x256 3x3): 146 [usec]
[qconv_strip] test success!!!
./unit_test -iw 10 -ih 10 -ic 128 -oc 32 -kw 1 -kh 1 -th 1 random
FPGA exec time (10x10x128x32 1x1): 30 [usec]
[qconv_strip] test success!!!
./unit_test -iw 20 -ih 20 -ic 64 -oc 16 -kw 1 -kh 1 -th 1 random
FPGA exec time (20x20x64x16 1x1): 46 [usec]
[qconv_strip] test success!!!
./unit_test -iw 40 -ih 40 -ic 32 -oc 4 -kw 1 -kh 1 -th 1 random
FPGA exec time (40x40x32x4 1x1): 51 [usec]
[qconv_strip] test success!!!
./unit_test -iw 5 -ih 5 -ic 1024 -oc 256 -kw 3 -kh 3 -th 1 random
FPGA exec time (5x5x1024x256 3x3): 1174 [usec]
[qconv_strip] test success!!!
./unit_test -iw 5 -ih 5 -ic 256 -oc 128 -kw 3 -kh 3 -th 1 random
FPGA exec time (5x5x256x128 3x3): 145 [usec]
[qconv_strip] test success!!!
./unit_test -iw 5 -ih 5 -ic 128 -oc 256 -kw 3 -kh 3 -th 1 random
FPGA exec time (5x5x128x256 3x3): 141 [usec]
[qconv_strip] test success!!!
./unit_test -iw 5 -ih 5 -ic 256 -oc 128 -kw 3 -kh 3 -th 1 random
FPGA exec time (5x5x256x128 3x3): 143 [usec]
[qconv_strip] test success!!!
./unit_test -iw 5 -ih 5 -ic 128 -oc 256 -kw 3 -kh 3 -th 1 random
FPGA exec time (5x5x128x256 3x3): 142 [usec]
[qconv_strip] test success!!!
```

## Uninstall

### Uninstall Device Tree

```console
fpga@debian-fpga:~/QCONV-STRIP-ZYBO-Z7$ rake uninstall
dtbocfg.rb --remove qconv_strip
[ 1026.409279] u-dma-buf amba:udmabuf_qconv_th: driver removed.
[ 1026.417139] u-dma-buf amba:udmabuf_qconv_k: driver removed.
[ 1026.427597] u-dma-buf amba:udmabuf_qconv_out: driver removed.
[ 1026.435293] u-dma-buf amba:udmabuf_qconv_in: driver removed.
[ 1026.443312] fclkcfg amba:fclk0: driver removed.
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

