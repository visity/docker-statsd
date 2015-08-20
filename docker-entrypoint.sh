#!/bin/bash

set -e

# Add statsd as command if needed
if [ "${1:0:1}" = '-' ]; then
	set -- statsd "$@"
fi

# Drop root privileges if we are running statsd
if [ "$1" = 'statsd' ]; then
	exec gosu statsd "$@"
fi

# As argument is not related to statsd,
# then assume that user wants to run his own process,
# for example a `bash` shell to explore this image
exec "$@"