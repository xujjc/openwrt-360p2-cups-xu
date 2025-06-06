#!/bin/bash
# 添加Gutenprint PPD文件
wget https://gimp-print.sourceforge.io/packages/gutenprint-5.3.4.tar.xz
tar -xvf gutenprint-5.3.4.tar.xz
cp -r gutenprint-5.3.4/ppd/canonmf*.ppd package/gutenprint-ppds/files/
rm -rf gutenprint-5.3.4*

# 添加佳能MF4452专用PPD
wget -O package/gutenprint-ppds/files/canonmf4452.ppd \
  https://www.openprinting.org/ppd-o-matic.php?driver=gutenprint.5.3&printer=Canon-MF4452
