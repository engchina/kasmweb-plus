#!/usr/bin/env bash
set -ex

/usr/bin/minio server $HOME/Desktop/Minio --console-address ":9001" &

# unknown option ==> call command
echo -e "\n\n------------------ EXECUTE COMMAND ------------------"
echo "Executing command: '$@'"
exec "$@"
