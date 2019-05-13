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

### Install g++

```console
fpga% sudo apt-get install g++
```

### Download QCONV-STRIP-ZYBO-Z7 to ZYBO-Z7

```console
fpga@debian-fpga:~/$ git clone https://github.com/ikwzm/QCONV-STRIP-ZYBO-Z7.git
fpga@debian-fpga:~/$ cd QCONV-STRIP-ZYBO-Z7
```

### Install FPGA Bitstream file

(T.B.D)

### Run Unit Test

(T.B.D)

## Build Bitstream file

### Requirement

* Xilinx Vivado 2018.3

### Download QCONV-STRIP-ZYBO-Z7

```console
shell$ git clone https://github.com/ikwzm/QCONV-STRIP-ZYBO-Z7.git
shell$ cd QCONV-STRIP-ZYBO-Z7
shell$ git submodule update --init --recursive
```

### Build design_1_wrapper.bit

(T.B.D)

## Licensing

Distributed under the BSD 2-Clause License.

