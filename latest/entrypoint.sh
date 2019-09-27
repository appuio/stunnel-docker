#!/bin/bash

set -e -o pipefail

if [ -z ${CONNECT} ]; then
    export CONNECT=${CONNECT_HOST}:${CONNECT_PORT}
fi
if [ -z ${ACCEPT} ]; then
    export ACCEPT=${ACCEPT_HOST}:${ACCEPT_PORT}
fi

config=/etc/stunnel/stunnel.conf
template=/etc/stunnel/stunnel.conf.template

if [[ -f ${template} ]]; then
# poor-mans templating engine to replace with ENV vars:
# https://stackoverflow.com/questions/2914220/bash-templating-how-to-build-configuration-files-from-templates-with-bash
eval "cat <<EOF
$(<$template)
EOF
" > ${config}
fi

if [[ ${LOG_LEVEL} == "7" ]]; then
    ls -lah /etc/stunnel
    cat ${config}
fi

echo "Starting stunnel with LOG_LEVEL = '${LOG_LEVEL}'. A level <= 4 means pretty much no logs except errors."

exec stunnel
