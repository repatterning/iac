#!/bin/bash

: << 'comment'
This script ... 
comment

# Pause
tau=2s

# Path
path=file://compute/quantiles/batch

# Compute Environment
aws batch create-compute-environment --cli-input-json "$path/environment.json"

# Queue
aws batch create-job-queue --cli-input-json "$path/queue.json"

# Task Definition
aws batch register-job-definition --cli-input-json "$path/definition.json"

# Task
aws batch submit-job --cli-input-json "$path/task.json"
