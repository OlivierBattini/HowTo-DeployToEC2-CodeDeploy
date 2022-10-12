#!/bin/bash

# Stopping existing node servers
echo "[APPLICATION_STOP] Stopping any existing node servers"
pidof node
RESULT=$?

if test $RESULT -eq 0
then
    echo "[APPLICATION_STOP] Found node process, stopping node"
else
    echo "[APPLICATION_STOP] No node process found"
    pkill node
fi

echo "[APPLICATION_STOP] Done"
