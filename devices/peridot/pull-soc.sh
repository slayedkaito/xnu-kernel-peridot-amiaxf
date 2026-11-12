#!/bin/bash
# Extract SM8635 SoC boot-arguments from /sys/firmware/fdt (or a local DTB) into devices/peridot/soc.args.
set -euo pipefail
cd "$(dirname "$(readlink -f "$0")")/../.."
DTB=${1:-}
if [ -z "$DTB" ]; then
    DTB=$(mktemp "${TMPDIR:-/tmp}/peridot-fdt.XXXXXX")
    trap 'rm -f "$DTB"' EXIT
    adb pull /sys/firmware/fdt "$DTB" || adb shell "su -c 'cat /sys/firmware/fdt'" > "$DTB"
fi
python3 tools/soc-args.py "$DTB" > devices/peridot/soc.args
echo "pull-soc.sh: wrote devices/peridot/soc.args ($(wc -l < devices/peridot/soc.args) lines)"
