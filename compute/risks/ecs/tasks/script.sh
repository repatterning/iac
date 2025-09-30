#!/bin/bash

: << 'comment'
For standalone updates of a task definition.  This script assumes that the underpinning 
Amazon ECS (Elastic Container Service) Cluster is active. 
comment

# Path
path=file://compute/risks

# The task definition vis-à-vis this repository.
aws ecs register-task-definition --cli-input-json "$path/ecs/tasks/define.json"
