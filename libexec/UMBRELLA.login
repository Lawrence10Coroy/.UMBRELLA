#!/bin/env bash
#

trap ctrl_c 2
source ${HOME}/.UMBRELLA/UMBRELLA/functions || { echo -en "\033[31mError:\033[33m File 'functions' does not exist!.\033[0m\n"; exit 1; }
ctrl_c() { pass ; }
theme red
pass 
