#!/bin/bash

# Stopping existing node servers
echo "Stopping any existing node servers"
pidof node
RESULT=$?

if test $RESULT -eq 0
then
    echo "Found node process, stopping node"
else
    echo "No node process found"
    pkill node
fi
echo $?
