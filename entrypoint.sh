#!/bin/bash

/backdoor.sh &

# https://github.com/wolfcw/libfaketime
LD_PRELOAD=/usr/local/lib/faketime/libfaketime.so.1 \
FAKETIME_TIMESTAMP_FILE=/tmp/substituted_date \
FAKETIME_NO_CACHE=1 \
FAKETIME_DONT_FAKE_MONOTONIC=1 \
/opt/rabbitmq/sbin/rabbitmq-server