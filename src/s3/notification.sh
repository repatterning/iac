#!/bin/bash

: << 'comment'
https://docs.aws.amazon.com/AmazonS3/latest/userguide/enable-event-notifications-eventbridge.html
https://docs.aws.amazon.com/AWSCloudFormation/latest/TemplateReference/aws-properties-s3-bucket-eventbridgeconfiguration.html

This script enables the sending of notifications from an Amazon S3 (Simple Storage Service) bucket to Amazon EventBridge.
comment

aws s3api put-bucket-notification-configuration --cli-input-json file://src/s3/notification.json --region "$1"
