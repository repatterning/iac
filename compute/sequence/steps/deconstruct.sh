#!/bin/bash

: << 'comment'
The reverse of construct 
comment

# Pause
tau=8s

# Path
path=file://compute/sequence

# Delete Machine
aws stepfunctions delete-state-machine --cli-input-json $path/steps/delete.json
sleep $tau

# De-register Task Definition/s
aws ecs deregister-task-definition --cli-input-json $path/ecs/tasks/events/deregister.json
aws ecs deregister-task-definition --cli-input-json $path/ecs/tasks/parts/deregister.json
aws ecs deregister-task-definition --cli-input-json $path/ecs/tasks/daily/deregister.json
sleep $tau

# Delete Task Definition/s
aws ecs delete-task-definitions --cli-input-json $path/ecs/tasks/events/delete-data.json
aws ecs delete-task-definitions --cli-input-json $path/ecs/tasks/parts/delete-data.json
aws ecs delete-task-definitions --cli-input-json $path/ecs/tasks/daily/delete-data.json
sleep $tau

# Delete Log Group
aws logs delete-log-group --cli-input-json $path/ecs/logs/events/delete.json
aws logs delete-log-group --cli-input-json $path/ecs/logs/parts/delete.json
aws logs delete-log-group --cli-input-json $path/ecs/logs/daily/delete.json