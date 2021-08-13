#!/bin/sh -eux

pip3 install cfn-lint
pip3 install pre-commit
pre-commit install
