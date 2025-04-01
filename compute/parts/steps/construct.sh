#!/bin/bash

: << 'comment'
This script assumes that the underpinning Amazon ECS (Elastic Container Service) Cluster is active. 
comment

# Pause
tau=2s

# Path
path=file://compute/parts

# The log group of the task definition
aws logs create-log-group --cli-input-json "$path/ecs/logs/define.json"

sleep $tau

# The task definition vis-à-vis this repository.
aws ecs register-task-definition --cli-input-json "$path/ecs/tasks/define.json"
