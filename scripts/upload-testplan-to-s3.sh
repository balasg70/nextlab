#!/bin/bash
# Usage: ./upload-testplan-to-s3.sh <bucket-name> [path]
BUCKET=$1
PATH=${2:-jmx}
if [ -z "$BUCKET" ]; then
  echo "Usage: $0 <bucket-name> [path]"
  exit 1
fi
aws s3 cp jmeter/test-plans/contactform-test.jmx s3://$BUCKET/$PATH/contactform-test.jmx
aws s3 cp --recursive jmeter/test-plans/data s3://$BUCKET/$PATH/data/
echo "Uploaded testplan and data to s3://$BUCKET/$PATH/"
