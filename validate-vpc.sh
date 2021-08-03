#!/bin/sh
set -eux

aws cloudformation validate-template --template-body file://./template/vpc.yml
