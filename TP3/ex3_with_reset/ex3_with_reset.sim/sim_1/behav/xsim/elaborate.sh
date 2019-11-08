#!/bin/bash -f
# ****************************************************************************
# Vivado (TM) v2019.1 (64-bit)
#
# Filename    : elaborate.sh
# Simulator   : Xilinx Vivado Simulator
# Description : Script for elaborating the compiled design
#
# Generated by Vivado on Mon Oct 14 16:29:20 CEST 2019
# SW Build 2552052 on Fri May 24 14:47:09 MDT 2019
#
# Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
#
# usage: elaborate.sh
#
# ****************************************************************************
set -Eeuo pipefail
echo "xelab -wto fcd7aab64530434dbeb408f2ff3eb8b2 --incr --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot feu_behav xil_defaultlib.feu -log elaborate.log"
xelab -wto fcd7aab64530434dbeb408f2ff3eb8b2 --incr --debug typical --relax --mt 8 -L xil_defaultlib -L secureip --snapshot feu_behav xil_defaultlib.feu -log elaborate.log
