#!/bin/bash
# Pull Peridot (SM8635) vendor firmware from the phone's Android over adb into fw-{gpu,wifi,audio,haptic,bt}/.
set -euo pipefail
cd "$(dirname "$(readlink -f "$0")")/../.."
mkdir -p fw-gpu fw-wifi fw-audio fw-haptic fw-bt
for f in gen71100_sqe.fw gen71100_gmu.bin gen71100_zap.mbn; do
    adb pull "/vendor/firmware/$f" "fw-gpu/$f" 2>/dev/null || true
done
adb pull /vendor/firmware_mnt/image/qca6750 fw-wifi/qca6750 2>/dev/null || true
for f in bd_n16t.elf bdwlan.elf regdb_xiaomi.bin regdb.bin Data.msc wpss.mdt; do
    adb pull "/vendor/firmware_mnt/image/$f" "fw-wifi/$f" 2>/dev/null || true
done
adb pull /vendor/firmware_mnt/image/adsp.mdt fw-audio/ 2>/dev/null || true
echo "pull-firmware.sh: done (check ls fw-gpu fw-wifi fw-audio fw-bt)"
