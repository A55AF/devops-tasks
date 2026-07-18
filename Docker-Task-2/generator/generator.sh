#!/bin/bash

names=("Ali" "Mohamed" "Ahmed" "Mahmoud" "Ismail" "Mo'men" "Ziad")
assignments=("Linux" "Backend" "Flutter" "Blender")
submission_id=1
student_id=1

while true; do
	for first_name in "${names[@]}"; do
		for last_name in "${names[@]}"; do
			if [ "$first_name" = "$last_name" ]; then
				continue
			fi

			padded_student_id=$(printf "%08d" "$student_id")
			for assignment in "${assignments[@]}"; do
				padded_submission_id=$(printf "%03d" "$submission_id")
				file_name="submission_$padded_submission_id.txt"

				# names
				student_name=""
				student_name="$first_name $last_name"

				# Assignment
				cat >> /shared/submissions/$file_name <<- EOF
				student_name=$student_name
				student_id=$padded_student_id
				assignment=$assignment
				EOF

				((submission_id++))
				sleep $GENERATE_INTERVAL
			done
			((student_id++))
		done
	done
	sleep $GENERATE_INTERVAL
done
