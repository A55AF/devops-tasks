#!/bin/bash

while true; do
	tar -caf /shared/archive/valid_$(date +"%H%M%S%d%m%Y").tar.gz /shared/valid
	tar -caf /shared/archive/invalid_$(date +"%H%M%S%d%m%Y").tar.gz /shared/invalid
	sleep $ARCHIVE_INTERVAL
done
