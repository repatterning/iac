#!/bin/bash

: << 'comment'
This script assumes that Amazon ECS (Elastic Container Service) Cluster the tasks depend on is active. 
comment

# Pause
tau=2s

# Path
path=file://compute

# The log group of the task definition
aws logs create-log-group --cli-input-json "$path/measures/ecs/logs/define.json"
aws logs create-log-group --cli-input-json "$path/contrasts/ecs/logs/define.json"
aws logs create-log-group --cli-input-json "$path/quantiles/ecs/logs/define.json"
aws logs create-log-group --cli-input-json "$path/drift/ecs/logs/define.json"

sleep $tau

# The task definition vis-à-vis this repository.
aws ecs register-task-definition --cli-input-json "$path/measures/ecs/tasks/define.json"
aws ecs register-task-definition --cli-input-json "$path/contrasts/ecs/tasks/define.json"
aws ecs register-task-definition --cli-input-json "$path/quantiles/ecs/tasks/define.json"
aws ecs register-task-definition --cli-input-json "$path/drift/ecs/tasks/define.json"
