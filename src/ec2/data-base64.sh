#!/bin/bash

: << 'comment'
This script converts the user data script, data.txt, to a Base 64 format.
comment

base64 "src/ec2/data.txt" > "src/ec2/data-base64.txt"
