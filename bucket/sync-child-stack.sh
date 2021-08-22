#!/bin/sh -eux

readonly BUCKETNAME
aws s3 sync ../template/child_stack_template s3://"${BUCKETNAME}"/
