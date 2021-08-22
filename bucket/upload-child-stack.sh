#!/bin/sh -eux

readonly BUCKETNAME
aws s3 cp ../template/child_stack_template s3://"${BUCKETNAME}"/ --recursive 
