#!/bin/bash

cd /shared/submissions

while true; do
  for submission_file in *; do
    # there is no submissions
    is_empty=$(ls)
    if [ -z "$is_empty" ]; then
      continue
    fi

    # if the student name is emtpy
    is_empty=$(cat "$submission_file" | grep "student_name=[[:alpha:]]\+ [[:alpha:]]\+")
    if [ -z "$is_empty" ]; then
      mv $submission_file /shared/invalid/
      echo "$(date +"%H%M%S%d%m%Y") - invalid submission - $submission_file"
      continue
    fi

    # if the assignment name is empty
    is_empty=$(cat "$submission_file" | grep "assignment=[[:alpha:]]\+")
    if [ -z "$is_empty" ]; then
      mv $submission_file /shared/invalid/
      echo "$(date +"%H%M%S%d%m%Y") - invalid submission - $submission_file"
      continue
    fi

    # check if student id is only digits
    is_empty=$(cat "$submission_file" | grep "student_id=[[:digit:]]\+")
    if [ -z "$is_empty" ]; then
      mv $submission_file /shared/invalid
      echo "$(date +"%H%M%S%d%m%Y") - invalid submission - $submission_file"
      continue
    fi

    # file name is valid
    is_valid=$(ls $submission_file | grep "submission_[[:digit:]]\+.txt$")
    if [ -z "$is_valid" ]; then
      mv $submission_file /shared/invalid
      echo "$(date +"%H%M%S%d%m%Y") - invalid submission - $submission_file"
      continue
    fi

    mv $submission_file /shared/valid
  done
  sleep $VALIDATE_INTERVAL
done
