#!/usr/bin/env bash

set -x
set -eu

SYSTEMSLAB=${SYSTEMSLAB:-systemslab}
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

CONNECTIONS=(
    100
    1000
    10000
)

RW_RATIO=(
    8
)

VLEN=(
    32
    2048
    4096
)

cd "$SCRIPT_DIR"

for conns in "${CONNECTIONS[@]}"; do
    for rw_ratio in "${RW_RATIO[@]}"; do
        for vlen in "${VLEN[@]}"; do
            $SYSTEMSLAB submit                                  \
                --output-format short                           \
                --name "redis_c${conns}_rw${rw_ratio}_vlen${vlen}" \
                --param "connections=$conns"                    \
                --param "vlen=$vlen"                            \
                --param "rw_ratio=$rw_ratio"                    \
                redis.jsonnet
                
        done
    done
done

