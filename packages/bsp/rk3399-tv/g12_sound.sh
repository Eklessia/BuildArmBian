#!/bin/sh

mixer() {
  parm=${4:-on}
  amixer -c "$1" sset "$2" "$3" $parm >/dev/null 2>&1
  amixer -c "$1" sset "$2" $parm >/dev/null 2>&1
}

card=AMLG12
echo $card

# Amlogic G12 HDMI to PCM0
  mixer $card 'FRDDR_A SINK 1 SEL' 'OUT 1'
  mixer $card 'FRDDR_A SRC 1 EN' on
  mixer $card 'TDMOUT_B SRC SEL' 'IN 0'
  mixer $card 'TOHDMITX I2S SRC' 'I2S B'
  mixer $card 'TOHDMITX' on

# Amlogic G12 S/PDIF to PCM1
  mixer $card 'FRDDR_B SINK 1 SEL' 'OUT 3'
  mixer $card 'FRDDR_B SRC 1 EN' on
  mixer $card 'SPDIFOUT SRC SEL' 'IN 1'
  mixer $card 'SPDIFOUT Playback' on
