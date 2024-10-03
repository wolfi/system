#!/bin/sh

source env.sh

exec sway --unsupported-gpu "$@"

#
# If you use systemd and want sway output to go to the journal, use this
# instead of the `exec sway "$@"` above:
#
#    exec systemd-cat --identifier=sway sway "$@"
#
