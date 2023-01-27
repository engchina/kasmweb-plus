#!/usr/bin/env bash
set -ex

sudo /dockerstartup/alist_sudo_startup.sh &

# unknown option ==> call command
echo -e "\n\n------------------ EXECUTE COMMAND ------------------"
echo "Executing command: '$@'"
exec "$@"
