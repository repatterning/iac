#!/bin/bash

: << 'comment'
The reverse of construct.
comment

# Pause
tau=2s

# Path
path=file://compute/parts

# Delete Machine
aws stepfunctions delete-state-machine --cli-input-json $path/steps/delete.json
sleep $tau

# De-register Task Definition/s
# aws ecs deregister-task-definition --cli-input-json $path/ecs/tasks/deregister.json
aws ecs deregister-task-definition --task-definition $1:1
aws ecs deregister-task-definition --task-definition $1:2
sleep $tau

# Delete Task Definition/s
# aws ecs delete-task-definitions --cli-input-json $path/ecs/tasks/delete-data.json
aws ecs delete-task-definitions --task-definition $1:1
aws ecs delete-task-definitions --task-definition $1:2
sleep $tau

# Delete Log Group
aws logs delete-log-group --cli-input-json $path/ecs/logs/delete.json
