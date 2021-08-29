#!/bin/sh -eux

readonly BUCKETNAME
aws s3 rb s3://"${BUCKETNAME}" --force
aws s3api list-buckets

