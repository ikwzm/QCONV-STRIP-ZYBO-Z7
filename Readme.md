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

### Expand the CMA area

Add ```cma=256M``` to linux_boot_args in uEnv.txt.

```
linux_kernel_image=vmlinuz-4.14.34-armv7-fpga
linux_fdt_image=devicetree-4.14.34-socfpga.dtb
linux_boot_args=console=ttyS0,115200 root=/dev/mmcblk0p2 rw rootwait uio_pdrv_genirq.of_id=generic-uio cma=256M

linux_load_cmd=fatload mmc 0 ${loadaddr} ${linux_kernel_image} && fatload mmc 0 ${fdt_addr} ${linux_fdt_image}
linux_boot_cmd=setenv bootargs ${linux_boot_args} && bootz ${loadaddr} - ${fdt_addr}

uenvcmd=run linux_load_cmd && run linux_boot_cmd

bootmenu_0=Boot linux-4.14.34-armv7-fpga=boot
```

### Boot FPGA-SoC-Linux

### Login fpga user

### Download QCONV-STRIP-ZYBO-Z7 to ZYBO-Z7

```console
fpga@debian-fpga:~/$ git clone https://github.com/ikwzm/QCONV-STRIP-ZYBO-Z7.git
fpga@debian-fpga:~/$ cd QCONV-STRIP-ZYBO-Z7
```

### Install FPGA Bitstream file

```console
fpga@debian-fpga:~/QCONV-STRIP-ZYBO-Z7$ sudo rake install
sudo: unable to resolve host debian-fpga
dtbocfg.rb --install qconv_strip --dts qconv_strip.dts
/config/device-tree/overlays/qconv_strip/dtbo: Warning (unit_address_vs_reg): Node /fragment@0 has a unit name, but no reg property
/config/device-tree/overlays/qconv_strip/dtbo: Warning (unit_address_vs_reg): Node /fragment@1 has a unit name, but no reg property
/config/device-tree/overlays/qconv_strip/dtbo: Warning (unit_address_vs_reg): Node /fragment@1/__overlay__/uio_qconv_strip has a reg or ranges property, but no unit name
[ 2164.917900] fclkcfg amba:fclk0: driver installed.
[ 2164.923899] fclkcfg amba:fclk0: device name    : fclk0
[ 2164.936321] fclkcfg amba:fclk0: clock  name    : fclk0
[ 2164.945180] fclkcfg amba:fclk0: clock  rate    : 99999999
[ 2164.956712] fclkcfg amba:fclk0: clock  enabled : 1
[ 2164.966703] fclkcfg amba:fclk0: remove rate    : 1000000
[ 2164.977333] fclkcfg amba:fclk0: remove enable  : 0
[ 2165.007088] udmabuf udmabuf-qconv-in: driver version = 1.3.2
[ 2165.012697] udmabuf udmabuf-qconv-in: major number   = 245
[ 2165.018206] udmabuf udmabuf-qconv-in: minor number   = 0
[ 2165.023453] udmabuf udmabuf-qconv-in: phys address   = 0x38100000
[ 2165.029567] udmabuf udmabuf-qconv-in: buffer size    = 4194304
[ 2165.035342] udmabuf udmabuf-qconv-in: dma coherent   = 0
[ 2165.040798] udmabuf amba:fpga-region0:udmabuf_qconv_in: driver installed.
[ 2165.074729] udmabuf udmabuf-qconv-out: driver version = 1.3.2
[ 2165.080462] udmabuf udmabuf-qconv-out: major number   = 245
[ 2165.085962] udmabuf udmabuf-qconv-out: minor number   = 1
[ 2165.093996] udmabuf udmabuf-qconv-out: phys address   = 0x38500000
[ 2165.100976] udmabuf udmabuf-qconv-out: buffer size    = 8388608
[ 2165.107678] udmabuf udmabuf-qconv-out: dma coherent   = 0
[ 2165.113012] udmabuf amba:fpga-region0:udmabuf_qconv_out: driver installed.
[ 2165.137698] udmabuf udmabuf-qconv-k: driver version = 1.3.2
[ 2165.143216] udmabuf udmabuf-qconv-k: major number   = 245
[ 2165.150466] udmabuf udmabuf-qconv-k: minor number   = 2
[ 2165.155633] udmabuf udmabuf-qconv-k: phys address   = 0x38d00000
[ 2165.163294] udmabuf udmabuf-qconv-k: buffer size    = 4194304
[ 2165.169888] udmabuf udmabuf-qconv-k: dma coherent   = 0
[ 2165.175048] udmabuf amba:fpga-region0:udmabuf_qconv_k: driver installed.
[ 2165.186437] udmabuf udmabuf-qconv-th: driver version = 1.3.2
[ 2165.192058] udmabuf udmabuf-qconv-th: major number   = 245
[ 2165.197571] udmabuf udmabuf-qconv-th: minor number   = 3
[ 2165.202817] udmabuf udmabuf-qconv-th: phys address   = 0x38050000
[ 2165.208944] udmabuf udmabuf-qconv-th: buffer size    = 65536
[ 2165.214541] udmabuf udmabuf-qconv-th: dma coherent   = 0
[ 2165.219885] udmabuf amba:fpga-region0:udmabuf_qconv_th: driver installed.
```

### Run Unit Test

```console
fpga@debian-fpga:~/QCONV-STRIP-ZYBO-Z7$ rake unit_test2_all
./unit_test -iw 160 -ih 160 -ic 64 -oc 32 -kw 1 -kh 1 -th 1 random
FPGA exec time (160x160x64x32 1x1): 3441 [usec]
[qconv_strip] test success!!!
./unit_test -iw 160 -ih 160 -ic 32 -oc 8 -kw 3 -kh 3 -th 1 random
FPGA exec time (160x160x32x8 3x3): 893 [usec]
[qconv_strip] test success!!!
./unit_test -iw 80 -ih 80 -ic 32 -oc 16 -kw 3 -kh 3 -th 1 random
FPGA exec time (80x80x32x16 3x3): 453 [usec]
[qconv_strip] test success!!!
./unit_test -iw 40 -ih 40 -ic 64 -oc 32 -kw 3 -kh 3 -th 1 random
FPGA exec time (40x40x64x32 3x3): 242 [usec]
[qconv_strip] test success!!!
./unit_test -iw 20 -ih 20 -ic 128 -oc 64 -kw 3 -kh 3 -th 1 random
FPGA exec time (20x20x128x64 3x3): 173 [usec]
[qconv_strip] test success!!!
./unit_test -iw 10 -ih 10 -ic 256 -oc 128 -kw 3 -kh 3 -th 1 random
FPGA exec time (10x10x256x128 3x3): 242 [usec]
[qconv_strip] test success!!!
./unit_test -iw 5 -ih 5 -ic 512 -oc 128 -kw 3 -kh 3 -th 1 random
FPGA exec time (5x5x512x128 3x3): 275 [usec]
[qconv_strip] test success!!!
./unit_test -iw 5 -ih 5 -ic 128 -oc 256 -kw 3 -kh 3 -th 1 random
FPGA exec time (5x5x128x256 3x3): 146 [usec]
[qconv_strip] test success!!!
./unit_test -iw 10 -ih 10 -ic 128 -oc 32 -kw 1 -kh 1 -th 1 random
FPGA exec time (10x10x128x32 1x1): 31 [usec]
[qconv_strip] test success!!!
./unit_test -iw 20 -ih 20 -ic 64 -oc 16 -kw 1 -kh 1 -th 1 random
FPGA exec time (20x20x64x16 1x1): 47 [usec]
[qconv_strip] test success!!!
./unit_test -iw 40 -ih 40 -ic 32 -oc 4 -kw 1 -kh 1 -th 1 random
FPGA exec time (40x40x32x4 1x1): 52 [usec]
[qconv_strip] test success!!!
./unit_test -iw 5 -ih 5 -ic 1024 -oc 256 -kw 3 -kh 3 -th 1 random
FPGA exec time (5x5x1024x256 3x3): 1190 [usec]
[qconv_strip] test success!!!
./unit_test -iw 5 -ih 5 -ic 256 -oc 128 -kw 3 -kh 3 -th 1 random
FPGA exec time (5x5x256x128 3x3): 145 [usec]
[qconv_strip] test success!!!
./unit_test -iw 5 -ih 5 -ic 128 -oc 256 -kw 3 -kh 3 -th 1 random
FPGA exec time (5x5x128x256 3x3): 146 [usec]
[qconv_strip] test success!!!
./unit_test -iw 5 -ih 5 -ic 256 -oc 128 -kw 3 -kh 3 -th 1 random
FPGA exec time (5x5x256x128 3x3): 146 [usec]
[qconv_strip] test success!!!
./unit_test -iw 5 -ih 5 -ic 128 -oc 256 -kw 3 -kh 3 -th 1 random
FPGA exec time (5x5x128x256 3x3): 143 [usec]
[qconv_strip] test success!!!
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

