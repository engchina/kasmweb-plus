#!/usr/bin/env bash
set -ex

function mv_bashrc_to_tmp {
    echo "Moving .bashrc profile to tmp directory"
    mv $HOME/.bashrc /tmp
    ls -la $HOME
}

function merge_bashrc_to_home {
    echo "Merging .bashrc profile to home directory"
    until [ -f "$HOME/.bashrc" ]; do sleep .5; done
    cat /tmp/.bashrc | tee -a $HOME/.bashrc
    ls -la $HOME
}

# delete .wget-hsts
if  [ -f "$HOME/.wget-hsts" ]; then
    echo "$HOME/.wget-hsts exists. Will delete it"
    rm -rf $HOME/.wget-hsts
fi

# start sshd
echo "kasm-user:$VNC_PW" | sudo chpasswd
sudo /usr/sbin/sshd

# mv .bashrc
if  [ -f "$HOME/.bashrc" ]; then
    echo "$HOME/.bashrc Profile already exists. Will mv to /tmp"
    mv_bashrc_to_tmp
fi

# merge .bashrc
if  [ -f "/tmp/.bashrc" ]; then
    echo "/tmp/.bashrc Profile already exists. Will merge to $HOME/.bashrc"
    merge_bashrc_to_home &
fi

# unknown option ==> call command
echo -e "\n\n------------------ EXECUTE COMMAND ------------------"
echo "Executing command: '$@'"
exec "$@"
