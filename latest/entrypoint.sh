#!/bin/bash

config=/etc/stunnel/stunnel.conf

# poor-mans templating engine to replace with ENV vars:
# https://stackoverflow.com/questions/2914220/bash-templating-how-to-build-configuration-files-from-templates-with-bash
eval "cat <<EOF
$(<$config)
EOF
" > ${config}

exec stunnel
