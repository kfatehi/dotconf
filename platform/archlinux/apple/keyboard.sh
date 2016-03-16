#!/bin/bash
echo "Fixing tilde button"
echo "options hid_apple iso_layout=0" | sudo tee /etc/modprobe.d/hid_apple.conf
