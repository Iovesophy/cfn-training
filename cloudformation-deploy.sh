#!/bin/sh -eux

readonly BUCKETNAME
aws s3 sync template/child_stack_template "s3://${BUCKETNAME}"/

readonly REGIONNAME
readonly STACKNAME
readonly FILENAME="template/root-stack.yml"
readonly S3URL
echo "${S3URL}"


changeset_option="--no-execute-changeset"
if [ $# = 1 ] && [ $1 = "start-deploy" ]; then
    echo "-- Set deploy mode --"
    changeset_option=""
else
    echo "-- Check Outputs --"
    ./outputs.sh
fi

aws cloudformation validate-template --template-body file://${FILENAME}

aws cloudformation deploy \
    ${changeset_option} \
    --stack-name "${STACKNAME}" \
    --template-file "${FILENAME}" \
    --parameter-overrides \
      TemplateVPC="${S3URL}/vpc.yml" \
      TemplateInternetGateway="${S3URL}/internetgateway.yml" \
      TemplateSubnetRoute="${S3URL}/subnet-route.yml" \
      TemplateSecurityGroup="${S3URL}/securitygroup.yml" \
      TemplateEC2="${S3URL}/ec2.yml"
