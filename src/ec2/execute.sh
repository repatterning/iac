#!/bin/bash

<< 'comment'
Notes:
* https://awscli.amazonaws.com/v2/documentation/api/latest/reference/ec2/run-instances.html
* $1: An Amazon region code parameter.

If the data.txt text is outwith the launch template, i.e., if its UserData is not included in the launch template define.json, then

aws ec2 run-instances --cli-input-json "$path/execute.json" --user-data "$path/data.txt" --region $1

comment

path=file://src/ec2

aws ec2 run-instances --cli-input-json "$path/execute.json" --region $1
