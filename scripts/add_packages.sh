#!/bin/bash

# 下载佳能MF4452专用PPD
wget -O files/usr/share/ppd/canonmf4452.ppd \
  https://www.openprinting.org/download/printdriver/components/lsb3.2/main/RPMS/noarch/openprinting-canon-5.90-1.noarch.rpm

# 提取PPD文件
(cd files/usr/share/ppd/ && \
 rpm2cpio canonmf4452.ppd | cpio -idmv && \
 mv usr/share/ppd/canon/* ./ && \
 rm -rf usr/ canonmf4452.ppd)

# 添加AirPrint支持包
echo "src/gz airprint https://downloads.openwrt.org/snapshots/packages/mipsel_24kc/packages" >> feeds.conf.default
./scripts/feeds update airprint
./scripts/feeds install -p airprint avahi-daemon cups-avahi-service
