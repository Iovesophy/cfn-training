#!/bin/sh
set -eux

aws cloudformation validate-template --template-body file://templates/vpc.yml
