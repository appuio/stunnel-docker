#!/bin/bash

set -e -o pipefail

if [ -z ${CONNECT} ]; then
    export CONNECT=${CONNECT_HOST}:${CONNECT_PORT}
fi
if [ -z ${ACCEPT} ]; then
    export ACCEPT=${ACCEPT_HOST}:${ACCEPT_PORT}
fi

config=/etc/stunnel/stunnel.conf

# poor-mans templating engine to replace with ENV vars:
# https://stackoverflow.com/questions/2914220/bash-templating-how-to-build-configuration-files-from-templates-with-bash
eval "cat <<EOF
$(<$config)
EOF
" > ${config}

if [[ ${LOG_LEVEL} == "7" ]]; then
    cat ${config}
fi

exec stunnel
