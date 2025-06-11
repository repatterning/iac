#!/bin/bash

: << 'comment'
The reverse of construct 
comment


# Path
path=file://compute/periodic

# Delete Machine
aws stepfunctions delete-state-machine --cli-input-json $path/steps/delete.json
