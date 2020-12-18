#!/usr/bin/env sh

set -eu

irb -I . -r init -r product_merge_component/controls --readline --prompt simple $@
