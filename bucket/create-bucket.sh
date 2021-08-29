#!/bin/sh -eux

readonly BUCKETNAME
readonly REGIONNAME
aws s3api create-bucket \
  --bucket "${BUCKETNAME}" \
  --create-bucket-configuration "LocationConstraint=${REGIONNAME}"
aws s3api list-buckets
