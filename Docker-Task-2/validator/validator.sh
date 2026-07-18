#!/bin/bash

while true; do
  for submission_file in /shared/submissions/*; do
    # there is no submissions
    is_empty=$(ls /shared/submissions)
    if [ -z "$is_empty" ]; then
      continue
    fi

    # if the student name is emtpy
    is_empty=$(cat "$submission_file" | grep "student_name=[[:alpha:]]\+ [[:alpha:]]\+")
    if [ -z "$is_empty" ]; then
      mv $submission_file /shared/invalid/
      echo "$submission_file student name is empty"
      continue
    fi

    # if the assignment name is empty
    is_empty=$(cat "$submission_file" | grep "assignment=[[:alpha:]]\+")
    if [ -z "$is_empty" ]; then
      mv $submission_file /shared/invalid/
      echo "$submission_file assignment name is empty"
      continue
    fi

    # check if student id is only digits
    is_empty=$(cat "$submission_file" | grep "student_id=[[:digit:]]\+")
    if [ -z "$is_empty" ]; then
      mv $submission_file /shared/invalid
      echo "$submission_file student id is not digits"
      continue
    fi

    # file name is valid
    is_valid=$(ls $submission_file | grep "submission_[[:digit:]]\+.txt$")
    if [ -z "$is_valid" ]; then
      mv $submission_file /shared/invalid
      echo "$submission_file file name is not valid"
      continue
    fi

    mv $submission_file /shared/valid
  done
  sleep $LISTEN_INTERVAL
done
