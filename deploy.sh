#!/bin/bash
STACK_NAME=aurora-control-lambda
TEMPLATE_FILE=./aurora-control-lambda.yml

aws cloudformation deploy \
    --template-file $TEMPLATE_FILE \
    --stack-name $STACK_NAME \
    --capabilities CAPABILITY_IAM \