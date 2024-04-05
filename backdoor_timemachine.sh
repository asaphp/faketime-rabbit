#!/bin/bash

while IFS= read -r INPUT || [ "$INPUT" ]; do
    echo "$INPUT" > /tmp/substituted_date;
    cat /tmp/substituted_date;
done;