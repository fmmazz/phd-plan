#!/bin/bash

LN=$(grep -n ! $1 | cut -d: -f1)
for i in $LN
do
    echo "ERRO:"
    cat -n $1 | head -n $((i+5)) | tail -n 6
    echo "--- x --- x ---"
done

