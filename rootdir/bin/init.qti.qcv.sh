#! /vendor/bin/sh
#=============================================================================
# Copyright (c) 2020-21 Qualcomm Technologies, Inc.
# All Rights Reserved.
# Confidential and Proprietary - Qualcomm Technologies, Inc.
#=============================================================================

soc_id=`cat /sys/devices/soc0/soc_id` 2> /dev/null

# Store soc_id in ro.vendor.qti.soc_id
setprop ro.vendor.qti.soc_id $soc_id

# For chipsets in QCV family, convert soc_id to soc_name
# and store it in ro.vendor.qti.soc_name.
if [ "$soc_id" -eq 507 ] || [ "$soc_id" -eq 565 ] || [ "$soc_id" -eq 628 ] || [ "$soc_id" -eq 578 ]; then
    setprop ro.vendor.qti.soc_name blair
    setprop ro.vendor.qti.soc_model SM6375
elif [ "$soc_id" -eq 454 ] || [ "$soc_id" -eq 472 ]; then
    setprop ro.vendor.qti.soc_name holi
    setprop ro.vendor.qti.soc_model SM4350
fi
