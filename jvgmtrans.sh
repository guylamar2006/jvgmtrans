#!/bin/bash

# Determine the script path
SCRIPTPATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check how this script is executed
# From explorer -> PFLAG=1, pause when exit
# From terminal -> PFLAG=0, not pause when exit
PFLAG=0
if [[ "$PPID" -eq 1 ]]; then
    PFLAG=1
fi

if [[ -z "$1" ]]; then
    echo "Usage: $(basename "$0") filename.vgm"
    if [[ "$PFLAG" -eq 1 ]]; then
        read -p "Press any key to continue..."
    fi
    exit 1
fi

VGMFILE="$1"
echo "Processing $VGMFILE"

java -DDEBUG -classpath "$SCRIPTPATH/bin" jvgmtrans.Jvgmtrans "$VGMFILE" > jvgmtrans.log

if [[ "$PFLAG" -eq 1 ]]; then
    read -p "Press any key to continue..."
fi
