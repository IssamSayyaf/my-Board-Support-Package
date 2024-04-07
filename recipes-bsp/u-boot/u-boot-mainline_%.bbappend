FILESEXTRAPATHS:prepend := "${THISDIR}/files/common:${THISDIR}/files/${MACHINE}:${THISDIR}/files:"

do_compile:prepend:custom-stm32-dk1 () {
	sed -i -e "s/%UBOOT_DTB_LOADADDRESS%/${UBOOT_DTB_LOADADDRESS}/g" \
		-e "s/%UBOOT_DTBO_LOADADDRESS%/${UBOOT_DTBO_LOADADDRESS}/g" \
		${WORKDIR}/${UBOOT_ENV_SRC}
}

SRC_URI:append:custom-stm32-dk1 = " \
	file://boot.cmd \
	file://fw_env.config \
	file://default-device-tree.cfg \
	file://0001-UBOOT-sdmmc1-change-detected-pin.patch \
	file://0002-UBOOT-added-sdmmc2-support.patch \
	file://0003-UBOOT-added-cmd-gpt.patch \
	file://0004-UBOOT-set-sdmmc2-4bit-bus-width.patch \
	file://0005-UBOOT-fixed-sdmmc2-data-pins-for-8bit-mode.patch \
	file://0006-UBOOT-added-ethernet-power-enable-pins.patch \
	file://0007-UBOOT-set-sdmmc2-boothph-pre-ram.patch \
	"

