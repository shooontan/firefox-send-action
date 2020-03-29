#!/bin/bash
set -e

export FFSEND_NO_INTERACT=1 FFSEND_YES=1


if [ -z "${INPUT_FILE}" ]; then
  echo 'file does not exits.'
fi

# exec command
command="ffsend upload ${INPUT_FILE}"

# expiry opt
if [ -n "${INPUT_EXPIRY_TIME}" ]; then
  command+=" --expiry-time ${INPUT_EXPIRY_TIME}"
fi

# password opt
if [ -n "${INPUT_PASSWORD}" ]; then
  command+=" --password ${INPUT_PASSWORD}"
fi

# run
ffsend_url=(`eval $command`)

echo
echo '===================================================================='
echo $ffsend_url
echo '===================================================================='

# for github actions outputs
echo "::set-output name=url::$ffsend_url"
