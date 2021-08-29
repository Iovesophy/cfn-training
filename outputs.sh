#!/bin/sh -eux

echo "-- child_stack_template --"
grep -A -100 Outputs template/child_stack_template/*.yml
echo "-- root_stack_template --"
grep -A -100 Outputs template/*.yml
