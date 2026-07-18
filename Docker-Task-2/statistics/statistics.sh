#!/bin/bash

report_id=1

while true; do
	valid_submissions=$(ls /shared/valid | wc -l)
	invalid_submissions=$(ls /shared/invalid | wc -l)
	pending_submissions=$(ls /shared/submissions | wc -l)
	padded_report_id=$(printf "%03d" "$report_id")

	cat >> /shared/reports/report_$padded_report_id.txt <<- EOF
	valid_submissions=$valid_submissions
	invalid_submissions=$invalid_submissions
	pending_submissions=$pending_submissions
	EOF

	((report_id++))
	sleep $REPORT_INTERVAL
done
