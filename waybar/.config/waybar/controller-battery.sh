#!/bin/sh

PERC=$(dualsensectl battery | awk '{ print $1 }')
STATUS=$(dualsensectl battery | awk '{ print $2 }')

OUTPUT="$PERC%"

echo -n $OUTPUT
