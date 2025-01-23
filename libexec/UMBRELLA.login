#!/bin/bash
#
#
trap ctrl_c 2
source ${HOME}/.UMBRELLA/UMBRELLA/functions
ctrl_c() { pass Disable; }
theme red
pass Disable
