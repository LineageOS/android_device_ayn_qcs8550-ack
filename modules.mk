#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

# Atheros wifi
BOARD_VENDOR_KERNEL_MODULES_LOAD += \
    michael_mic \
    pci-pwrctrl-pwrseq \
    pwrseq-qcom-wcn \
    ath12k

# Camera
BOARD_VENDOR_KERNEL_MODULES_LOAD += \
    camcc-sm8550 \
    i2c-qcom-cci \
    qcom-camss

# LEDs
BOARD_VENDOR_KERNEL_MODULES_LOAD += \
    leds-qcom-flash

# Media
BOARD_VENDOR_KERNEL_MODULES_LOAD += \
    videocc-sm8550 \
    qcom-iris

# Network
BOARD_VENDOR_KERNEL_MODULES_LOAD += \
    ipa

# Sound
BOARD_VENDOR_KERNEL_MODULES_LOAD += \
    snd-soc-hdmi-codec \
    pinctrl-sm8550-lpass-lpi \
    q6afe-clocks \
    q6prm-clocks \
    q6apm-lpass-dais \
    q6asm-dai \
    q6afe-dai \
    q6apm-dai \
    snd-soc-lpass-rx-macro \
    snd-soc-lpass-tx-macro \
    snd-soc-lpass-va-macro \
    snd-soc-lpass-wsa-macro \
    soundwire-qcom \
    snd-soc-aw88166 \
    snd-soc-wcd938x \
    snd-soc-sc8280xp


# Copy to boot
BOOT_KERNEL_MODULES += \
    cma_heap.ko \
    system_heap.ko \
    qcom-scm.ko \
    qcom_tzmem.ko \
    arm_smmu.ko \
    qcom_pd_mapper.ko \
    qcom-cpufreq-hw.ko \
    nvmem-reboot-mode.ko \
    qcom-pon.ko \
    pm8941-pwrkey.ko \
    bam_dma.ko \
    icc-bwmon.ko \
    qnoc-sm8550.ko \
    fastrpc.ko \
    i2c-qcom-geni.ko \
    spi-geni-qcom.ko \
    qcom_q6v5_pas.ko \
    qcom_sysmon.ko \
    phy-snps-eusb2.ko \
    phy-qcom-eusb2-repeater.ko \
    pinctrl-msm.ko \
    pinctrl-sm8550.ko \
    pinctrl-spmi-gpio.ko \
    qcom-spmi-pmic.ko \
    qcom-rpmh-regulator.ko \
    rtc-pm8xxx.ko \
    rmtfs_mem.ko \
    qcom_stats.ko \
    dispcc-sm8550.ko \
    gcc-sm8550.ko \
    gpi.ko \
    gpucc-sm8550.ko \
    msm.ko \
    qcom_ice.ko \
    qcom-ipcc.ko \
    qcom-pdc.ko \
    qcrypto.ko \
    phy-qcom-qmp-pcie.ko \
    phy-qcom-qmp-combo.ko \
    phy-qcom-qmp-ufs.ko \
    clk-rpmh.ko \
    rpmhpd.ko \
    tcsrcc-sm8550.ko \
    sdhci-msm.ko \
    sg.ko \
    ufs-qcom.ko \
    qcom-rng.ko \
    qcom_tsens.ko \
    smp2p.ko \
    spmi-pmic-arb.ko \
    nvmem_qcom-spmi-sdam.ko \
    qcom_hwspinlock.ko \
    qcom-spmi-temp-alarm.ko \
    icc-clk.ko \
    clk-qcom.ko \
    qcom_rpmh.ko \
    cmd-db.ko \
    reboot-mode.ko \
    icc-rpmh.ko \
    icc-bcm-voter.ko \
    icc-osm-l3.ko \
    phy-qcom-qmp-combo.ko \
    smem.ko \
    socinfo.ko \
    qcom_aoss.ko \
    qcom_ice.ko \
    cqhci.ko \
    aux-bridge.ko \
    drm_dp_aux_bus.ko \
    drm_display_helper.ko \
    llcc-qcom.ko \
    ubwc_config.ko \
    mdt_loader.ko \
    gpu-sched.ko \
    drm_gpuvm.ko \
    drm_exec.ko \
    qcom_pil_info.ko \
    qcom_q6v5.ko \
    qcom_common.ko \
    gpio-sbu-mux.ko \
    apr.ko \
    qcom_pdr_msg.ko \
    qmi_helpers.ko \
    pdr_interface.ko \
    aux-hpd-bridge.ko \
    mhi.ko \
    qrtr.ko \
    qrtr-mhi.ko \
    qrtr-smd.ko \
    qcom_glink.ko \
    qcom_glink_rpm.ko \
    qcom_glink_smem.ko \
    qcom_smd.ko \
    pmic_glink.ko \
    pmic_glink_altmode.ko \
    ucsi_glink.ko \
    qcom_battmgr.ko \
    leds-qcom-lpg.ko \
    hwmon.ko \
    pwm-fan.ko \
    bootloader_log.ko \
    tee.ko \
    qcomtee.ko \
    rsinput.ko


# Load in first stage boot
BOARD_VENDOR_RAMDISK_KERNEL_MODULES_LOAD += \
    cma_heap \
    system_heap \
    qnoc-sm8550 \
    icc-bwmon \
    arm_smmu \
    qcom_pd_mapper \
    rpmhpd \
    icc-osm-l3 \
    pinctrl-sm8550 \
    pinctrl-spmi-gpio \
    gcc-sm8550 \
    tcsrcc-sm8550 \
    dispcc-sm8550 \
    gpucc-sm8550 \
    clk-rpmh \
    qrtr-mhi \
    qrtr-smd \
    apr \
    qcom-cpufreq-hw \
    i2c-qcom-geni \
    spi-geni-qcom \
    phy-qcom-qmp-pcie \
    phy-qcom-qmp-combo \
    phy-qcom-qmp-ufs \
    phy-snps-eusb2 \
    phy-qcom-eusb2-repeater \
    qcom_glink_rpm \
    qcom_glink_smem \
    qcom_smd \
    pmic_glink_altmode \
    ucsi_glink \
    nvmem-reboot-mode \
    qcom-pon \
    pm8941-pwrkey \
    bam_dma \
    fastrpc \
    socinfo \
    qcom_sysmon \
    qcom_q6v5_pas \
    qcom-spmi-pmic \
    qcom-rpmh-regulator \
    rtc-pm8xxx \
    rmtfs_mem \
    qcom_stats \
    gpi \
    msm \
    qcom-ipcc \
    qcom-pdc \
    qcomtee \
    qcrypto \
    sdhci-msm \
    sg \
    ufs-qcom \
    qcom-rng \
    qcom_tsens \
    smp2p \
    spmi-pmic-arb \
    nvmem_qcom-spmi-sdam \
    qcom_hwspinlock \
    qcom-spmi-temp-alarm \
    gpio-sbu-mux \
    qcom_battmgr \
    leds-qcom-lpg \
    pwm-fan \
    bootloader_log \
    rsinput
