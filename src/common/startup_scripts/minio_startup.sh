#!/usr/bin/env bash
set -ex

function create_minio_desktop_symlink {
    echo "Creating Minio Desktop Symlink"
    until [ -d "$HOME/Minio" ]; do sleep .5; done

    if [ -d "$HOME/Desktop/Minio" ]; then
        echo "Minio Desktop Symlink Exists"
    else
        echo "Creating Minio Desktop Symlink"
        ln -sf $HOME/Minio $HOME/Desktop/Minio
    fi
}

/usr/bin/minio server $HOME/Minio --console-address ":9001" &
create_minio_desktop_symlink &

# unknown option ==> call command
echo -e "\n\n------------------ EXECUTE COMMAND ------------------"
echo "Executing command: '$@'"
exec "$@"
