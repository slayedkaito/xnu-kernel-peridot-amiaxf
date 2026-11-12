# POCO F6 / Redmi Turbo 3 (`peridot`)

HakiOS device layer for Xiaomi POCO F6 / Redmi Turbo 3 (Qualcomm Snapdragon 8s Gen 3 / SM8635).

- **SoC layer:** `soc/` (`sm8635`, 3x Cortex-A520 + 4x Cortex-A720 + 1x Cortex-X4, Adreno 735 `0x43030b00`)
- **Board defaults:** handled in `drivers/core/hakios.board.c` when `/arm-io/device_type` is `peridot`, keeping kernel boot-args within XNU's 607-character limit.
- **Configuration:** `make peridot_defconfig && make kernel && make loader`
- **Validation:** `python3 tools/hakios-device.py check peridot && python3 tools/hakios-config.py check`
