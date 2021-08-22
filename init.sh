#!/bin/sh -eux

read -p "please input BUCKETNAME ? > " str1
read -p "please input REGIONNAME ? > " str2
read -p "please input STACKNAME  ? > " str3

echo "BUCKETNAME=\"${str1}\"" > .env
echo "REGIONNAME=\"${str2}\"" >> .env
echo "STACKNAME=\"${str3}\"" >> .env
echo "S3URL=\"https://\${BUCKETNAME}.s3.\${REGIONNAME}.amazonaws.com\"" >> .env

echo "done"
