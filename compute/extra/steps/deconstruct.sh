#!/bin/bash

: << 'comment'
The reverse of construct. Herein, $1 is a task name.
comment

# Pause
tau=5s

# Path
path=file://compute/extra

# Delete Machine
aws stepfunctions delete-state-machine --cli-input-json $path/steps/delete.json
sleep $tau

# De-register Task Definition/s
aws ecs deregister-task-definition --task-definition $1:1
sleep $tau

# Delete Task Definition/s
aws ecs delete-task-definitions --task-definition $1:1
sleep $tau

# Delete Log Group
aws logs delete-log-group --cli-input-json $path/ecs/logs/delete.json
